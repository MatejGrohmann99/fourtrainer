
// puzzle_wasm_wrapper_sync.js - Synchronous version that won't hang

let wasmModule = null;
let wasmReady = false;

class WasmAcceleratorSync {
    constructor() {
        this.ready = false;
        this.cubeOriPtr = null;
        this.edgePartnersPtr = null;
    }

    // Check if WASM functions are available
    checkReady() {
        try {
            if (typeof Module !== 'undefined' && Module._mult) {
                wasmModule = Module;
                this.ready = true;
                wasmReady = true;
                return true;
            }
        } catch (e) {
            console.error('WASM check failed:', e);
        }
        this.ready = false;
        return false;
    }

    // Setup persistent buffers (call once per Puzzle)
    setupBuffers(cubeOri, edgePartners, pcCount) {
        if (!this.ready || !wasmModule) return;

        try {
            // Setup cubeOri
            if (this.cubeOriPtr) wasmModule._free(this.cubeOriPtr);
            this.cubeOriPtr = wasmModule._malloc(pcCount);
            wasmModule.HEAPU8.set(new Uint8Array(cubeOri), this.cubeOriPtr);

            // Setup edge partners lookup table
            if (this.edgePartnersPtr) wasmModule._free(this.edgePartnersPtr);
            this.edgePartnersPtr = wasmModule._malloc(256);
            const lookup = new Uint8Array(256).fill(255);
            for (let [k, v] of edgePartners) {
                lookup[k] = v;
            }
            wasmModule.HEAPU8.set(lookup, this.edgePartnersPtr);
        } catch (e) {
            console.error('Buffer setup failed:', e);
            this.ready = false;
        }
    }

    // Optimized mult
    mult(start, move, result, pcCount) {
        if (!this.ready || !wasmModule) return false;

        try {
            const startPtr = wasmModule._malloc(pcCount);
            const movePtr = wasmModule._malloc(pcCount);
            const resultPtr = wasmModule._malloc(pcCount);

            wasmModule.HEAPU8.set(new Uint8Array(start), startPtr);
            wasmModule.HEAPU8.set(new Uint8Array(move), movePtr);

            wasmModule._mult(startPtr, movePtr, resultPtr, this.cubeOriPtr, pcCount);

            const resultArray = new Uint8Array(wasmModule.HEAPU8.buffer, resultPtr, pcCount);
            for (let i = 0; i < pcCount; i++) {
                result[i] = resultArray[i];
            }

            wasmModule._free(startPtr);
            wasmModule._free(movePtr);
            wasmModule._free(resultPtr);
            return true;
        } catch (e) {
            console.error('mult failed:', e);
            return false;
        }
    }

    // Optimized execute
    execute(start, sequence, moves, pcCount) {
        if (!this.ready || !wasmModule) return null;

        try {
            const startPtr = wasmModule._malloc(pcCount);
            const seqPtr = wasmModule._malloc(sequence.length * 4);
            const movesPtr = wasmModule._malloc(moves.length * pcCount);
            const resultPtr = wasmModule._malloc(pcCount);

            wasmModule.HEAPU8.set(new Uint8Array(start), startPtr);

            const seqView = new Uint32Array(wasmModule.HEAPU8.buffer, seqPtr, sequence.length);
            seqView.set(sequence);

            const flatMoves = new Uint8Array(moves.length * pcCount);
            for (let i = 0; i < moves.length; i++) {
                flatMoves.set(new Uint8Array(moves[i]), i * pcCount);
            }
            wasmModule.HEAPU8.set(flatMoves, movesPtr);

            wasmModule._execute(startPtr, seqPtr, sequence.length, movesPtr, this.cubeOriPtr, pcCount, resultPtr);

            const result = new Uint8Array(wasmModule.HEAPU8.buffer, resultPtr, pcCount).slice();

            wasmModule._free(startPtr);
            wasmModule._free(seqPtr);
            wasmModule._free(movesPtr);
            wasmModule._free(resultPtr);

            return Array.from(result);
        } catch (e) {
            console.error('execute failed:', e);
            return null;
        }
    }

    // Optimized isEdgesPaired
    isEdgesPaired(state, pcCount) {
        if (!this.ready || !wasmModule) return null;

        try {
            const statePtr = wasmModule._malloc(pcCount);
            wasmModule.HEAPU8.set(new Uint8Array(state), statePtr);

            const result = wasmModule._isEdgesPaired(statePtr, this.edgePartnersPtr, pcCount);

            wasmModule._free(statePtr);
            return result === 1;
        } catch (e) {
            console.error('isEdgesPaired failed:', e);
            return null;
        }
    }

    // Optimized compressArrIgnoringEdges
    compressArr(list, isEdgePiece, pcCount) {
        if (!this.ready || !wasmModule) return null;

        try {
            const listPtr = wasmModule._malloc(pcCount);
            const edgePtr = wasmModule._malloc(pcCount);
            const resultPtr = wasmModule._malloc(pcCount);

            wasmModule.HEAPU8.set(new Uint8Array(list), listPtr);
            wasmModule.HEAPU8.set(new Uint8Array(isEdgePiece.map(x => x ? 1 : 0)), edgePtr);

            wasmModule._compressArr(listPtr, pcCount, edgePtr, resultPtr);

            const result = new Uint8Array(wasmModule.HEAPU8.buffer, resultPtr, pcCount);
            const str = String.fromCharCode(...result);

            wasmModule._free(listPtr);
            wasmModule._free(edgePtr);
            wasmModule._free(resultPtr);

            return str;
        } catch (e) {
            console.error('compressArr failed:', e);
            return null;
        }
    }
}

// Export for use in worker
if (typeof self !== 'undefined') {
    self.WasmAcceleratorSync = WasmAcceleratorSync;
}