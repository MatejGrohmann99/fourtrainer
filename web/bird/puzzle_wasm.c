#include <stdint.h>
#include <string.h>

// Constants
#define MAX_PIECES 31
#define POS_BITS 5
#define POS_MASK 31
#define ORI_MASK 96

// Export functions for JavaScript
__attribute__((export_name("mult")))
void mult(
        const uint8_t* start,
        const uint8_t* move,
        uint8_t* result,
        const uint8_t* cubeOri,
        int pcCount
) {
    for (int i = 0; i < pcCount; i++) {
        uint8_t moveVal = move[i];
        uint8_t pos = moveVal & POS_MASK;
        uint8_t temp = start[pos] + (moveVal & ORI_MASK);
        uint8_t oriShift = cubeOri[pos] << POS_BITS;
        result[i] = temp >= oriShift ? temp - oriShift : temp;
    }
}

__attribute__((export_name("execute")))
void execute(
        const uint8_t* start,
        const uint32_t* sequence,
        int seqLen,
        const uint8_t* moves,
        const uint8_t* cubeOri,
        int pcCount,
        uint8_t* result
) {
    uint8_t buffer1[MAX_PIECES];
    uint8_t buffer2[MAX_PIECES];
    uint8_t* current = buffer1;
    uint8_t* next = buffer2;

    // Initialize current with start state
    memcpy(current, start, pcCount);

    for (int i = 0; i < seqLen; i++) {
        uint32_t moveIdx = sequence[i];
        const uint8_t* move = moves + (moveIdx * pcCount);

        // Perform multiplication
        for (int j = 0; j < pcCount; j++) {
            uint8_t moveVal = move[j];
            uint8_t pos = moveVal & POS_MASK;
            uint8_t temp = current[pos] + (moveVal & ORI_MASK);
            uint8_t oriShift = cubeOri[pos] << POS_BITS;
            next[j] = temp >= oriShift ? temp - oriShift : temp;
        }

        // Swap buffers
        uint8_t* tmp = current;
        current = next;
        next = tmp;
    }

    memcpy(result, current, pcCount);
}

__attribute__((export_name("compressArr")))
void compressArr(
        const uint8_t* list,
        int pcCount,
        const uint8_t* isEdgePiece,
        uint8_t* result
) {
    for (int i = 0; i < pcCount; i++) {
        result[i] = isEdgePiece[i] ? 0 : list[i];
    }
}

__attribute__((export_name("arraysEqual")))
int arraysEqual(
        const uint8_t* arr1,
        const uint8_t* arr2,
        int length
) {
    for (int i = 0; i < length; i++) {
        if (arr1[i] != arr2[i]) return 0;
    }
    return 1;
}

__attribute__((export_name("isEdgesPaired")))
int isEdgesPaired(
        const uint8_t* state,
        const uint8_t* edgePartners,
        int pcCount
) {
    // Check fixed pieces
    if ((state[13] & POS_MASK) != 13) return 0;
    if ((state[16] & POS_MASK) != 16) return 0;
    if ((state[22] & POS_MASK) != 22) return 0;
    if ((state[24] & POS_MASK) != 24) return 0;
    if ((state[30] & POS_MASK) != 30) return 0;

    // Check edge pairs - edgePartners is a lookup table [256]
    uint8_t piece1, piece2;

    piece1 = state[4] & POS_MASK;
    piece2 = state[8] & POS_MASK;
    if (edgePartners[piece1] != piece2) return 0;

    piece1 = state[5] & POS_MASK;
    piece2 = state[9] & POS_MASK;
    if (edgePartners[piece1] != piece2) return 0;

    piece1 = state[6] & POS_MASK;
    piece2 = state[10] & POS_MASK;
    if (edgePartners[piece1] != piece2) return 0;

    piece1 = state[7] & POS_MASK;
    piece2 = state[11] & POS_MASK;
    if (edgePartners[piece1] != piece2) return 0;

    piece1 = state[17] & POS_MASK;
    piece2 = state[14] & POS_MASK;
    if (edgePartners[piece1] != piece2) return 0;

    piece1 = state[23] & POS_MASK;
    piece2 = state[25] & POS_MASK;
    if (edgePartners[piece1] != piece2) return 0;

    return 1;
}

__attribute__((export_name("getCost")))
float getCost(
        const uint32_t* sequence,
        int seqLen,
        const float* weightTable
) {
    float cost = 0.0f;
    for (int i = 0; i < seqLen; i++) {
        cost += weightTable[sequence[i]];
    }
    return cost;
}