part of '../revenge_algorithms.dart';

const _fourFlipOutput = '''
Searching depth 7

Searching depth 8

Searching depth 9

U R F D2 B L D2 R F  (9f*)
U R D2 B L D2 R2 F R  (9f*)
U R B R2 D2 L F D2 R  (9f*)
U R B2 L' B' U2 L B' R'  (9f*)
U R' F' L U2 F' L' F2 R  (9f*)
U F R F2 D2 B L D2 F  (9f*)
U F R2 B' R' U2 B R' F'  (9f*)
U F D2 R B D2 F2 L F  (9f*)
U F L D2 R B D2 F L  (9f*)
U F' L' B U2 L' B' L2 F  (9f*)
U L F L2 D2 R B D2 L  (9f*)
U L F2 R' F' U2 R F' L'  (9f*)
U L D2 F R D2 L2 B L  (9f*)
U L B D2 F R D2 L B  (9f*)
U L' B' R U2 B' R' B2 L  (9f*)
U B R D2 L F D2 B R  (9f*)
U B D2 L F D2 B2 R B  (9f*)
U B L B2 D2 F R D2 B  (9f*)
U B L2 F' L' U2 F L' B'  (9f*)
U B' R' F U2 R' F' R2 B  (9f*)
U' R B L' U2 B L B2 R'  (9f*)
U' R' F2 L F U2 L' F R  (9f*)
U' R' F' R2 D2 L' B' D2 R'  (9f*)
U' R' D2 F' L' D2 R2 B' R'  (9f*)
U' R' B' D2 F' L' D2 R' B'  (9f*)
U' F R B' U2 R B R2 F'  (9f*)
U' F' R' D2 L' B' D2 F' R'  (9f*)
U' F' D2 L' B' D2 F2 R' F'  (9f*)
U' F' L2 B L U2 B' L F  (9f*)
U' F' L' F2 D2 B' R' D2 F'  (9f*)
U' L F R' U2 F R F2 L'  (9f*)
U' L' F' D2 B' R' D2 L' F'  (9f*)
U' L' D2 B' R' D2 L2 F' L'  (9f*)
U' L' B2 R B U2 R' B L  (9f*)
U' L' B' L2 D2 R' F' D2 L'  (9f*)
U' B L F' U2 L F L2 B'  (9f*)
U' B' R2 F R U2 F' R B  (9f*)
U' B' R' B2 D2 F' L' D2 B'  (9f*)
U' B' D2 R' F' D2 B2 L' B'  (9f*)
U' B' L' D2 R' F' D2 B' L'  (9f*)
R F D2 B L D2 R F U  (9f*)
R D2 B L D2 R2 F R U  (9f*)
R B R2 D2 L F D2 R U  (9f*)
R B L' U2 B L B2 R' U'  (9f*)
R B2 L' B' U2 L B' R' U  (9f*)
R' F2 L F U2 L' F R U'  (9f*)
R' F' R2 D2 L' B' D2 R' U'  (9f*)
R' F' L U2 F' L' F2 R U  (9f*)
R' D2 F' L' D2 R2 B' R' U'  (9f*)
R' B' D2 F' L' D2 R' B' U'  (9f*)
F R F2 D2 B L D2 F U  (9f*)
F R B' U2 R B R2 F' U'  (9f*)
F R2 B' R' U2 B R' F' U  (9f*)
F D2 R B D2 F2 L F U  (9f*)
F L D2 R B D2 F L U  (9f*)
F' R' D2 L' B' D2 F' R' U'  (9f*)
F' D2 L' B' D2 F2 R' F' U'  (9f*)
F' L2 B L U2 B' L F U'  (9f*)
F' L' F2 D2 B' R' D2 F' U'  (9f*)
F' L' B U2 L' B' L2 F U  (9f*)
L F R' U2 F R F2 L' U'  (9f*)
L F L2 D2 R B D2 L U  (9f*)
L F2 R' F' U2 R F' L' U  (9f*)
L D2 F R D2 L2 B L U  (9f*)
L B D2 F R D2 L B U  (9f*)
L' F' D2 B' R' D2 L' F' U'  (9f*)
L' D2 B' R' D2 L2 F' L' U'  (9f*)
L' B2 R B U2 R' B L U'  (9f*)
L' B' R U2 B' R' B2 L U  (9f*)
L' B' L2 D2 R' F' D2 L' U'  (9f*)
B R D2 L F D2 B R U  (9f*)
B D2 L F D2 B2 R B U  (9f*)
B L F' U2 L F L2 B' U'  (9f*)
B L B2 D2 F R D2 B U  (9f*)
B L2 F' L' U2 F L' B' U  (9f*)
B' R2 F R U2 F' R B U'  (9f*)
B' R' F U2 R' F' R2 B U  (9f*)
B' R' B2 D2 F' L' D2 B' U'  (9f*)
B' D2 R' F' D2 B2 L' B' U'  (9f*)
B' L' D2 R' F' D2 B' L' U'  (9f*)
Searching depth 10

U R F2 D2 L' B L D2 F2 R'  (10f)
U R F2 L' D2 B D2 L F2 R'  (10f)
U R D2 B D L D R2 F R  (10f)
U R D2 B L D' R2 D' F R  (10f)
U R L F U2 R2 F' U2 R' L'  (10f)
U R L F R2 U2 F' U2 R' L'  (10f)
U R L F D2 L2 B D2 R L  (10f)
U R L F L2 D2 B D2 R L  (10f)
U R L D2 F D2 L2 B R L  (10f)
U R L D2 F L2 D2 B R L  (10f)
U R L D2 B R2 D2 F R L  (10f)
U R L D2 B D2 R2 F R L  (10f)
U R L B U2 L2 B' U2 R' L'  (10f)
U R L B R2 D2 F D2 R L  (10f)
U R L B D2 R2 F D2 R L  (10f)
U R L B L2 U2 B' U2 R' L'  (10f)
U R L2 B L U2 B' L U2 R'  (10f)
U R L' F2 D2 B R' L D2 F2  (10f)
U R L' F2 D2 B D2 F2 R' L  (10f)
U R L' B2 U2 B U2 B2 R' L  (10f)
U R L' B2 U2 B R' L U2 B2  (10f)
U R B R2 F D2 R F2 L F  (10f)
U R B R2 D L D F D2 R  (10f)
U R B D2 R2 L F R2 D2 R'  (10f)
U R B D' R2 D' L F D2 R  (10f)
U R B L U2 L2 B' L U2 R'  (10f)
U R B L2 U2 L B' U2 R' L2  (10f)
U R B L' U2 B L B2 R' U2  (10f)
U R B2 U2 R B R' U2 B2 R'  (10f)
U R2 U2 F B' R U2 R2 F' B  (10f)
U R2 U2 F B' R F' B U2 R2  (10f)
U R2 F B' U2 R' U2 F' B R2  (10f)
U R2 F' D2 B L B' D2 F R2  (10f)
U R2 F' L B D2 F L B' R2  (10f)
U R2 F' B D2 L D2 F B' R2  (10f)
U R2 D2 F' B L F B' D2 R2  (10f)
U R2 D2 F' B L D2 R2 F B'  (10f)
U R2 L F R U2 F' R U2 L'  (10f)
U R2 L' U2 B' R U2 R2 B L  (10f)
U R2 B D2 F' L F D2 B' R2  (10f)
U R' U2 L F' U2 L F R L2  (10f)
U R' U2 L F' L2 U2 L F R  (10f)
U R' F R U2 F2 U2 L F L'  (10f)
U R' F L B2 D2 B2 R F L'  (10f)
U R' F2 U2 R' F R U2 F2 R  (10f)
U R' F2 L F U2 L' F R U2  (10f)
U R' F' R2 D2 L' B' D2 R' U2  (10f)
U R' D2 R2 B R2 L D2 F R  (10f)
U R' D2 F' L' D2 R2 B' R' U2  (10f)
U R' L F2 U2 F U2 F2 R L'  (10f)
U R' L F2 U2 F R L' U2 F2  (10f)
U R' L B2 D2 F R L' D2 B2  (10f)
U R' L B2 D2 F D2 B2 R L'  (10f)
U R' L2 U2 F' L U2 L2 F R  (10f)
U R' L' U2 F' U2 L2 F R L  (10f)
U R' L' U2 F' L2 U2 F R L  (10f)
U R' L' U2 B' U2 R2 B R L  (10f)
U R' L' U2 B' R2 U2 B R L  (10f)
U R' B2 D2 L F L' D2 B2 R  (10f)
U R' B2 L D2 F D2 L' B2 R  (10f)
U R' B' D2 F' L' D2 R' B' U2  (10f)
U F R F2 D B D L D2 F  (10f)
U F R F2 L D2 F L2 B L  (10f)
U F R D2 F2 B L F2 D2 F'  (10f)
U F R D' F2 D' B L D2 F  (10f)
U F R B U2 B2 R' B U2 F'  (10f)
U F R B2 U2 B R' U2 F' B2  (10f)
U F R B' U2 R B R2 F' U2  (10f)
U F R2 U2 F R F' U2 R2 F'  (10f)
U F D2 R D B D F2 L F  (10f)
U F D2 R B D' F2 D' L F  (10f)
U F L2 D2 B' R B D2 L2 F'  (10f)
U F L2 B' D2 R D2 B L2 F'  (10f)
U F B R U2 B2 R' U2 F' B'  (10f)
U F B R F2 D2 L D2 F B  (10f)
U F B R D2 F2 L D2 F B  (10f)
U F B R B2 U2 R' U2 F' B'  (10f)
U F B D2 R F2 D2 L F B  (10f)
U F B D2 R D2 F2 L F B  (10f)
U F B D2 L D2 B2 R F B  (10f)
U F B D2 L B2 D2 R F B  (10f)
U F B L U2 F2 L' U2 F' B'  (10f)
U F B L F2 U2 L' U2 F' B'  (10f)
U F B L D2 B2 R D2 F B  (10f)
U F B L B2 D2 R D2 F B  (10f)
U F B2 R B U2 R' B U2 F'  (10f)
U F B' R2 U2 R U2 R2 F' B  (10f)
U F B' R2 U2 R F' B U2 R2  (10f)
U F B' L2 D2 R F' B D2 L2  (10f)
U F B' L2 D2 R D2 L2 F' B  (10f)
U F2 U2 R' L F U2 F2 R L'  (10f)
U F2 U2 R' L F R L' U2 F2  (10f)
U F2 R D2 L' B L D2 R' F2  (10f)
U F2 R L' D2 B D2 R' L F2  (10f)
U F2 R' L U2 F' U2 R L' F2  (10f)
U F2 D2 R L' B R' L D2 F2  (10f)
U F2 D2 R L' B D2 F2 R' L  (10f)
U F2 L' D2 R B R' D2 L F2  (10f)
U F2 L' B R D2 L B R' F2  (10f)
U F2 B L F U2 L' F U2 B'  (10f)
U F2 B' U2 R' F U2 F2 R B  (10f)
U F' U2 B L' U2 B L F B2  (10f)
U F' U2 B L' B2 U2 B L F  (10f)
U F' R2 D2 B L B' D2 R2 F  (10f)
U F' R2 B D2 L D2 B' R2 F  (10f)
U F' R' D2 L' B' D2 F' R' U2  (10f)
U F' D2 F2 R F2 B D2 L F  (10f)
U F' D2 L' B' D2 F2 R' F' U2  (10f)
U F' L F U2 L2 U2 B L B'  (10f)
U F' L B R2 D2 R2 F L B'  (10f)
U F' L2 U2 F' L F U2 L2 F  (10f)
U F' L2 B L U2 B' L F U2  (10f)
U F' L' F2 D2 B' R' D2 F' U2  (10f)
U F' B R2 D2 L F B' D2 R2  (10f)
U F' B R2 D2 L D2 R2 F B'  (10f)
U F' B L2 U2 L U2 L2 F B'  (10f)
U F' B L2 U2 L F B' U2 L2  (10f)
U F' B2 U2 L' B U2 B2 L F  (10f)
U F' B' U2 R' U2 F2 R F B  (10f)
U F' B' U2 R' F2 U2 R F B  (10f)
U F' B' U2 L' U2 B2 L F B  (10f)
U F' B' U2 L' B2 U2 L F B  (10f)
U L F R U2 R2 F' R U2 L'  (10f)
U L F R2 U2 R F' U2 R2 L'  (10f)
U L F R' U2 F R F2 L' U2  (10f)
U L F D2 R L2 B L2 D2 L'  (10f)
U L F D' L2 D' R B D2 L  (10f)
U L F L2 D R D B D2 L  (10f)
U L F L2 B D2 L B2 R B  (10f)
U L F2 U2 L F L' U2 F2 L'  (10f)
U L D2 F R D' L2 D' B L  (10f)
U L D2 F D R D L2 B L  (10f)
U L B2 R' D2 F D2 R B2 L'  (10f)
U L B2 D2 R' F R D2 B2 L'  (10f)
U L2 U2 F' B L U2 L2 F B'  (10f)
U L2 U2 F' B L F B' U2 L2  (10f)
U L2 F D2 B' R B D2 F' L2  (10f)
U L2 F B' D2 R D2 F' B L2  (10f)
U L2 F' B U2 L' U2 F B' L2  (10f)
U L2 D2 F B' R F' B D2 L2  (10f)
U L2 D2 F B' R D2 L2 F' B  (10f)
U L2 B' R F D2 B R F' L2  (10f)
U L2 B' D2 F R F' D2 B L2  (10f)
U L' U2 R B' U2 R B R2 L  (10f)
U L' U2 R B' R2 U2 R B L  (10f)
U L' F2 R D2 B D2 R' F2 L  (10f)
U L' F2 D2 R B R' D2 F2 L  (10f)
U L' F' D2 B' R' D2 L' F' U2  (10f)
U L' D2 L2 F R L2 D2 B L  (10f)
U L' D2 B' R' D2 L2 F' L' U2  (10f)
U L' B R F2 D2 F2 L B R'  (10f)
U L' B L U2 B2 U2 R B R'  (10f)
U L' B2 U2 L' B L U2 B2 L  (10f)
U L' B2 R B U2 R' B L U2  (10f)
U L' B' L2 D2 R' F' D2 L' U2  (10f)
U B R2 F' D2 L D2 F R2 B'  (10f)
U B R2 D2 F' L F D2 R2 B'  (10f)
U B D2 L F D' B2 D' R B  (10f)
U B D2 L D F D B2 R B  (10f)
U B L F U2 F2 L' F U2 B'  (10f)
U B L F2 U2 F L' U2 F2 B'  (10f)
U B L F' U2 L F L2 B' U2  (10f)
U B L D2 F B2 R B2 D2 B'  (10f)
U B L D' B2 D' F R D2 B  (10f)
U B L B2 R D2 B R2 F R  (10f)
U B L B2 D F D R D2 B  (10f)
U B L2 U2 B L B' U2 L2 B'  (10f)
U B2 U2 R L' B U2 B2 R' L  (10f)
U B2 U2 R L' B R' L U2 B2  (10f)
U B2 R L' U2 B' U2 R' L B2  (10f)
U B2 R' F L D2 R F L' B2  (10f)
U B2 R' D2 L F L' D2 R B2  (10f)
U B2 R' L D2 F D2 R L' B2  (10f)
U B2 D2 R' L F R L' D2 B2  (10f)
U B2 D2 R' L F D2 B2 R L'  (10f)
U B2 L D2 R' F R D2 L' B2  (10f)
U B' U2 F R' U2 F R F2 B  (10f)
U B' U2 F R' F2 U2 F R B  (10f)
U B' R F L2 D2 L2 B R F'  (10f)
U B' R B U2 R2 U2 F R F'  (10f)
U B' R2 U2 B' R B U2 R2 B  (10f)
U B' R2 F R U2 F' R B U2  (10f)
U B' R' B2 D2 F' L' D2 B' U2  (10f)
U B' D2 R' F' D2 B2 L' B' U2  (10f)
U B' D2 B2 L F B2 D2 R B  (10f)
U B' L2 F D2 R D2 F' L2 B  (10f)
U B' L2 D2 F R F' D2 L2 B  (10f)
U B' L' D2 R' F' D2 B' L' U2  (10f)
U2 R F D2 B L D2 R F U'  (10f)
U2 R D2 B L D2 R2 F R U'  (10f)
U2 R B R2 D2 L F D2 R U'  (10f)
U2 R B L' U2 B L B2 R' U  (10f)
U2 R B2 L' B' U2 L B' R' U'  (10f)
U2 R B' U L' B2 L U' B R'  (10f)
U2 R' F U' L F2 L' U F' R  (10f)
U2 R' F2 L F U2 L' F R U  (10f)
U2 R' F' R2 D2 L' B' D2 R' U  (10f)
U2 R' F' L U2 F' L' F2 R U'  (10f)
U2 R' D2 F' L' D2 R2 B' R' U  (10f)
U2 R' B' D2 F' L' D2 R' B' U  (10f)
U2 F R F2 D2 B L D2 F U'  (10f)
U2 F R B' U2 R B R2 F' U  (10f)
U2 F R2 B' R' U2 B R' F' U'  (10f)
U2 F R' U B' R2 B U' R F'  (10f)
U2 F D2 R B D2 F2 L F U'  (10f)
U2 F L D2 R B D2 F L U'  (10f)
U2 F' R' D2 L' B' D2 F' R' U  (10f)
U2 F' D2 L' B' D2 F2 R' F' U  (10f)
U2 F' L U' B L2 B' U L' F  (10f)
U2 F' L2 B L U2 B' L F U  (10f)
U2 F' L' F2 D2 B' R' D2 F' U  (10f)
U2 F' L' B U2 L' B' L2 F U'  (10f)
U2 L F R' U2 F R F2 L' U  (10f)
U2 L F L2 D2 R B D2 L U'  (10f)
U2 L F2 R' F' U2 R F' L' U'  (10f)
U2 L F' U R' F2 R U' F L'  (10f)
U2 L D2 F R D2 L2 B L U'  (10f)
U2 L B D2 F R D2 L B U'  (10f)
U2 L' F' D2 B' R' D2 L' F' U  (10f)
U2 L' D2 B' R' D2 L2 F' L' U  (10f)
U2 L' B U' R B2 R' U B' L  (10f)
U2 L' B2 R B U2 R' B L U  (10f)
U2 L' B' R U2 B' R' B2 L U'  (10f)
U2 L' B' L2 D2 R' F' D2 L' U  (10f)
U2 B R D2 L F D2 B R U'  (10f)
U2 B D2 L F D2 B2 R B U'  (10f)
U2 B L F' U2 L F L2 B' U  (10f)
U2 B L B2 D2 F R D2 B U'  (10f)
U2 B L2 F' L' U2 F L' B' U'  (10f)
U2 B L' U F' L2 F U' L B'  (10f)
U2 B' R U' F R2 F' U R' B  (10f)
U2 B' R2 F R U2 F' R B U  (10f)
U2 B' R' F U2 R' F' R2 B U'  (10f)
U2 B' R' B2 D2 F' L' D2 B' U  (10f)
U2 B' D2 R' F' D2 B2 L' B' U  (10f)
U2 B' L' D2 R' F' D2 B' L' U  (10f)
U' R U2 L' B U2 L' B' R' L2  (10f)
U' R U2 L' B L2 U2 L' B' R'  (10f)
U' R F D2 B L D2 R F U2  (10f)
U' R F2 D2 L' B' L D2 F2 R'  (10f)
U' R F2 L' D2 B' D2 L F2 R'  (10f)
U' R D2 R2 F' R2 L' D2 B' R'  (10f)
U' R D2 B L D2 R2 F R U2  (10f)
U' R L U2 F U2 R2 F' R' L'  (10f)
U' R L U2 F R2 U2 F' R' L'  (10f)
U' R L U2 B U2 L2 B' R' L'  (10f)
U' R L U2 B L2 U2 B' R' L'  (10f)
U' R L2 U2 B L' U2 L2 B' R'  (10f)
U' R L' F2 D2 B' R' L D2 F2  (10f)
U' R L' F2 D2 B' D2 F2 R' L  (10f)
U' R L' B2 U2 B' U2 B2 R' L  (10f)
U' R L' B2 U2 B' R' L U2 B2  (10f)
U' R B R2 D2 L F D2 R U2  (10f)
U' R B2 U2 R B' R' U2 B2 R'  (10f)
U' R B2 L' B' U2 L B' R' U2  (10f)
U' R B' R' U2 B2 U2 L' B' L  (10f)
U' R B' L' F2 D2 F2 R' B' L  (10f)
U' R2 U2 F B' R' U2 R2 F' B  (10f)
U' R2 U2 F B' R' F' B U2 R2  (10f)
U' R2 F B' U2 R U2 F' B R2  (10f)
U' R2 F' D2 B L' B' D2 F R2  (10f)
U' R2 F' B D2 L' D2 F B' R2  (10f)
U' R2 D2 F' B L' F B' D2 R2  (10f)
U' R2 D2 F' B L' D2 R2 F B'  (10f)
U' R2 L U2 F R' U2 R2 F' L'  (10f)
U' R2 L' B' R' U2 B R' U2 L  (10f)
U' R2 B D2 F' L' F D2 B' R2  (10f)
U' R2 B L' F' D2 B' L' F R2  (10f)
U' R' F2 U2 R' F' R U2 F2 R  (10f)
U' R' F' R2 D' L' D' B' D2 R'  (10f)
U' R' F' R2 B' D2 R' B2 L' B'  (10f)
U' R' F' D R2 D L' B' D2 R'  (10f)
U' R' F' D2 R2 L' B' R2 D2 R  (10f)
U' R' F' L U2 F' L' F2 R U2  (10f)
U' R' F' L2 U2 L' F U2 R L2  (10f)
U' R' F' L' U2 L2 F L' U2 R  (10f)
U' R' D2 F' D' L' D' R2 B' R'  (10f)
U' R' D2 F' L' D R2 D B' R'  (10f)
U' R' L F2 U2 F' U2 F2 R L'  (10f)
U' R' L F2 U2 F' R L' U2 F2  (10f)
U' R' L B2 D2 F' R L' D2 B2  (10f)
U' R' L B2 D2 F' D2 B2 R L'  (10f)
U' R' L2 F' L' U2 F L' U2 R  (10f)
U' R' L' F' U2 L2 F U2 R L  (10f)
U' R' L' F' R2 D2 B' D2 R' L'  (10f)
U' R' L' F' D2 R2 B' D2 R' L'  (10f)
U' R' L' F' L2 U2 F U2 R L  (10f)
U' R' L' D2 F' R2 D2 B' R' L'  (10f)
U' R' L' D2 F' D2 R2 B' R' L'  (10f)
U' R' L' D2 B' D2 L2 F' R' L'  (10f)
U' R' L' D2 B' L2 D2 F' R' L'  (10f)
U' R' L' B' U2 R2 B U2 R L  (10f)
U' R' L' B' R2 U2 B U2 R L  (10f)
U' R' L' B' D2 L2 F' D2 R' L'  (10f)
U' R' L' B' L2 D2 F' D2 R' L'  (10f)
U' R' B2 D2 L F' L' D2 B2 R  (10f)
U' R' B2 L D2 F' D2 L' B2 R  (10f)
U' F U2 B' R U2 B' R' F' B2  (10f)
U' F U2 B' R B2 U2 B' R' F'  (10f)
U' F R F2 D2 B L D2 F U2  (10f)
U' F R2 U2 F R' F' U2 R2 F'  (10f)
U' F R2 B' R' U2 B R' F' U2  (10f)
U' F R' F' U2 R2 U2 B' R' B  (10f)
U' F R' B' L2 D2 L2 F' R' B  (10f)
U' F D2 R B D2 F2 L F U2  (10f)
U' F D2 F2 L' F2 B' D2 R' F'  (10f)
U' F L D2 R B D2 F L U2  (10f)
U' F L2 D2 B' R' B D2 L2 F'  (10f)
U' F L2 B' D2 R' D2 B L2 F'  (10f)
U' F B U2 R U2 B2 R' F' B'  (10f)
U' F B U2 R B2 U2 R' F' B'  (10f)
U' F B U2 L U2 F2 L' F' B'  (10f)
U' F B U2 L F2 U2 L' F' B'  (10f)
U' F B2 U2 R B' U2 B2 R' F'  (10f)
U' F B' R2 U2 R' U2 R2 F' B  (10f)
U' F B' R2 U2 R' F' B U2 R2  (10f)
U' F B' L2 D2 R' F' B D2 L2  (10f)
U' F B' L2 D2 R' D2 L2 F' B  (10f)
U' F2 U2 R' L F' U2 F2 R L'  (10f)
U' F2 U2 R' L F' R L' U2 F2  (10f)
U' F2 R D2 L' B' L D2 R' F2  (10f)
U' F2 R L' D2 B' D2 R' L F2  (10f)
U' F2 R B' L' D2 R' B' L F2  (10f)
U' F2 R' L U2 F U2 R L' F2  (10f)
U' F2 D2 R L' B' R' L D2 F2  (10f)
U' F2 D2 R L' B' D2 F2 R' L  (10f)
U' F2 L' D2 R B' R' D2 L F2  (10f)
U' F2 B U2 L F' U2 F2 L' B'  (10f)
U' F2 B' R' F' U2 R F' U2 B  (10f)
U' F' R2 D2 B L' B' D2 R2 F  (10f)
U' F' R2 B D2 L' D2 B' R2 F  (10f)
U' F' D2 L' D' B' D' F2 R' F'  (10f)
U' F' D2 L' B' D F2 D R' F'  (10f)
U' F' L2 U2 F' L' F U2 L2 F  (10f)
U' F' L' F2 R' D2 F' R2 B' R'  (10f)
U' F' L' F2 D' B' D' R' D2 F'  (10f)
U' F' L' D F2 D B' R' D2 F'  (10f)
U' F' L' D2 F2 B' R' F2 D2 F  (10f)
U' F' L' B U2 L' B' L2 F U2  (10f)
U' F' L' B2 U2 B' L U2 F B2  (10f)
U' F' L' B' U2 B2 L B' U2 F  (10f)
U' F' B R2 D2 L' F B' D2 R2  (10f)
U' F' B R2 D2 L' D2 R2 F B'  (10f)
U' F' B L2 U2 L' U2 L2 F B'  (10f)
U' F' B L2 U2 L' F B' U2 L2  (10f)
U' F' B2 L' B' U2 L B' U2 F  (10f)
U' F' B' R' U2 F2 R U2 F B  (10f)
U' F' B' R' F2 U2 R U2 F B  (10f)
U' F' B' R' D2 B2 L' D2 F' B'  (10f)
U' F' B' R' B2 D2 L' D2 F' B'  (10f)
U' F' B' D2 R' D2 B2 L' F' B'  (10f)
U' F' B' D2 R' B2 D2 L' F' B'  (10f)
U' F' B' D2 L' F2 D2 R' F' B'  (10f)
U' F' B' D2 L' D2 F2 R' F' B'  (10f)
U' F' B' L' U2 B2 L U2 F B  (10f)
U' F' B' L' F2 D2 R' D2 F' B'  (10f)
U' F' B' L' D2 F2 R' D2 F' B'  (10f)
U' F' B' L' B2 U2 L U2 F B  (10f)
U' L U2 R' F U2 R' F' R2 L'  (10f)
U' L U2 R' F R2 U2 R' F' L'  (10f)
U' L F L2 D2 R B D2 L U2  (10f)
U' L F2 U2 L F' L' U2 F2 L'  (10f)
U' L F2 R' F' U2 R F' L' U2  (10f)
U' L F' R' B2 D2 B2 L' F' R  (10f)
U' L F' L' U2 F2 U2 R' F' R  (10f)
U' L D2 F R D2 L2 B L U2  (10f)
U' L D2 L2 B' R' L2 D2 F' L'  (10f)
U' L B D2 F R D2 L B U2  (10f)
U' L B2 R' D2 F' D2 R B2 L'  (10f)
U' L B2 D2 R' F' R D2 B2 L'  (10f)
U' L2 U2 F' B L' U2 L2 F B'  (10f)
U' L2 U2 F' B L' F B' U2 L2  (10f)
U' L2 F R' B' D2 F' R' B L2  (10f)
U' L2 F D2 B' R' B D2 F' L2  (10f)
U' L2 F B' D2 R' D2 F' B L2  (10f)
U' L2 F' B U2 L U2 F B' L2  (10f)
U' L2 D2 F B' R' F' B D2 L2  (10f)
U' L2 D2 F B' R' D2 L2 F' B  (10f)
U' L2 B' D2 F R' F' D2 B L2  (10f)
U' L' F2 R D2 B' D2 R' F2 L  (10f)
U' L' F2 D2 R B' R' D2 F2 L  (10f)
U' L' D2 B' R' D L2 D F' L'  (10f)
U' L' D2 B' D' R' D' L2 F' L'  (10f)
U' L' B2 U2 L' B' L U2 B2 L  (10f)
U' L' B' R U2 B' R' B2 L U2  (10f)
U' L' B' R2 U2 R' B U2 R2 L  (10f)
U' L' B' R' U2 R2 B R' U2 L  (10f)
U' L' B' D L2 D R' F' D2 L'  (10f)
U' L' B' D2 R' L2 F' L2 D2 L  (10f)
U' L' B' L2 F' D2 L' F2 R' F'  (10f)
U' L' B' L2 D' R' D' F' D2 L'  (10f)
U' B U2 F' L U2 F' L' F2 B'  (10f)
U' B U2 F' L F2 U2 F' L' B'  (10f)
U' B R D2 L F D2 B R U2  (10f)
U' B R2 F' D2 L' D2 F R2 B'  (10f)
U' B R2 D2 F' L' F D2 R2 B'  (10f)
U' B D2 L F D2 B2 R B U2  (10f)
U' B D2 B2 R' F' B2 D2 L' B'  (10f)
U' B L B2 D2 F R D2 B U2  (10f)
U' B L2 U2 B L' B' U2 L2 B'  (10f)
U' B L2 F' L' U2 F L' B' U2  (10f)
U' B L' F' R2 D2 R2 B' L' F  (10f)
U' B L' B' U2 L2 U2 F' L' F  (10f)
U' B2 U2 R L' B' U2 B2 R' L  (10f)
U' B2 U2 R L' B' R' L U2 B2  (10f)
U' B2 R L' U2 B U2 R' L B2  (10f)
U' B2 R' D2 L F' L' D2 R B2  (10f)
U' B2 R' L D2 F' D2 R L' B2  (10f)
U' B2 D2 R' L F' R L' D2 B2  (10f)
U' B2 D2 R' L F' D2 B2 R L'  (10f)
U' B2 L F' R' D2 L' F' R B2  (10f)
U' B2 L D2 R' F' R D2 L' B2  (10f)
U' B' R2 U2 B' R' B U2 R2 B  (10f)
U' B' R' F U2 R' F' R2 B U2  (10f)
U' B' R' F2 U2 F' R U2 F2 B  (10f)
U' B' R' F' U2 F2 R F' U2 B  (10f)
U' B' R' D B2 D F' L' D2 B'  (10f)
U' B' R' D2 F' B2 L' B2 D2 B  (10f)
U' B' R' B2 D' F' D' L' D2 B'  (10f)
U' B' R' B2 L' D2 B' L2 F' L'  (10f)
U' B' D2 R' F' D B2 D L' B'  (10f)
U' B' D2 R' D' F' D' B2 L' B'  (10f)
U' B' L2 F D2 R' D2 F' L2 B  (10f)
U' B' L2 D2 F R' F' D2 L2 B  (10f)
R U2 L' B U2 L' B' R' L2 U'  (10f)
R U2 L' B L2 U2 L' B' R' U'  (10f)
R F2 D2 L' B L D2 F2 R' U  (10f)
R F2 D2 L' B' L D2 F2 R' U'  (10f)
R F2 L' D2 B D2 L F2 R' U  (10f)
R F2 L' D2 B' D2 L F2 R' U'  (10f)
R D2 R2 F' R2 L' D2 B' R' U'  (10f)
R D2 B D L D R2 F R U  (10f)
R D2 B L D' R2 D' F R U  (10f)
R L U2 F U2 R2 F' R' L' U'  (10f)
R L U2 F R2 U2 F' R' L' U'  (10f)
R L U2 B U2 L2 B' R' L' U'  (10f)
R L U2 B L2 U2 B' R' L' U'  (10f)
R L F U2 R2 F' U2 R' L' U  (10f)
R L F R2 U2 F' U2 R' L' U  (10f)
R L F D2 L2 B D2 R L U  (10f)
R L F L2 D2 B D2 R L U  (10f)
R L D2 F D2 L2 B R L U  (10f)
R L D2 F L2 D2 B R L U  (10f)
R L D2 B R2 D2 F R L U  (10f)
R L D2 B D2 R2 F R L U  (10f)
R L B U2 L2 B' U2 R' L' U  (10f)
R L B R2 D2 F D2 R L U  (10f)
R L B D2 R2 F D2 R L U  (10f)
R L B L2 U2 B' U2 R' L' U  (10f)
R L2 U2 B L' U2 L2 B' R' U'  (10f)
R L2 B L U2 B' L U2 R' U  (10f)
R L' F2 D2 B R' L D2 F2 U  (10f)
R L' F2 D2 B D2 F2 R' L U  (10f)
R L' F2 D2 B' R' L D2 F2 U'  (10f)
R L' F2 D2 B' D2 F2 R' L U'  (10f)
R L' B2 U2 B U2 B2 R' L U  (10f)
R L' B2 U2 B R' L U2 B2 U  (10f)
R L' B2 U2 B' U2 B2 R' L U'  (10f)
R L' B2 U2 B' R' L U2 B2 U'  (10f)
R B R2 F D2 R F2 L F U  (10f)
R B R2 D L D F D2 R U  (10f)
R B D2 R2 L F R2 D2 R' U  (10f)
R B D' R2 D' L F D2 R U  (10f)
R B L U2 L2 B' L U2 R' U  (10f)
R B L2 U2 L B' U2 R' L2 U  (10f)
R B2 U2 R B R' U2 B2 R' U  (10f)
R B2 U2 R B' R' U2 B2 R' U'  (10f)
R B' U L' B2 L U' B R' U2  (10f)
R B' R' U2 B2 U2 L' B' L U'  (10f)
R B' L' F2 D2 F2 R' B' L U'  (10f)
R2 U2 F B' R U2 R2 F' B U  (10f)
R2 U2 F B' R F' B U2 R2 U  (10f)
R2 U2 F B' R' U2 R2 F' B U'  (10f)
R2 U2 F B' R' F' B U2 R2 U'  (10f)
R2 F B' U2 R U2 F' B R2 U'  (10f)
R2 F B' U2 R' U2 F' B R2 U  (10f)
R2 F' D2 B L B' D2 F R2 U  (10f)
R2 F' D2 B L' B' D2 F R2 U'  (10f)
R2 F' L B D2 F L B' R2 U  (10f)
R2 F' B D2 L D2 F B' R2 U  (10f)
R2 F' B D2 L' D2 F B' R2 U'  (10f)
R2 D2 F' B L F B' D2 R2 U  (10f)
R2 D2 F' B L D2 R2 F B' U  (10f)
R2 D2 F' B L' F B' D2 R2 U'  (10f)
R2 D2 F' B L' D2 R2 F B' U'  (10f)
R2 L U2 F R' U2 R2 F' L' U'  (10f)
R2 L F R U2 F' R U2 L' U  (10f)
R2 L' U2 B' R U2 R2 B L U  (10f)
R2 L' B' R' U2 B R' U2 L U'  (10f)
R2 B D2 F' L F D2 B' R2 U  (10f)
R2 B D2 F' L' F D2 B' R2 U'  (10f)
R2 B L' F' D2 B' L' F R2 U'  (10f)
R' U2 L F' U2 L F R L2 U  (10f)
R' U2 L F' L2 U2 L F R U  (10f)
R' F U' L F2 L' U F' R U2  (10f)
R' F R U2 F2 U2 L F L' U  (10f)
R' F L B2 D2 B2 R F L' U  (10f)
R' F2 U2 R' F R U2 F2 R U  (10f)
R' F2 U2 R' F' R U2 F2 R U'  (10f)
R' F' R2 D' L' D' B' D2 R' U'  (10f)
R' F' R2 B' D2 R' B2 L' B' U'  (10f)
R' F' D R2 D L' B' D2 R' U'  (10f)
R' F' D2 R2 L' B' R2 D2 R U'  (10f)
R' F' L2 U2 L' F U2 R L2 U'  (10f)
R' F' L' U2 L2 F L' U2 R U'  (10f)
R' D2 R2 B R2 L D2 F R U  (10f)
R' D2 F' D' L' D' R2 B' R' U'  (10f)
R' D2 F' L' D R2 D B' R' U'  (10f)
R' L F2 U2 F U2 F2 R L' U  (10f)
R' L F2 U2 F R L' U2 F2 U  (10f)
R' L F2 U2 F' U2 F2 R L' U'  (10f)
R' L F2 U2 F' R L' U2 F2 U'  (10f)
R' L B2 D2 F R L' D2 B2 U  (10f)
R' L B2 D2 F D2 B2 R L' U  (10f)
R' L B2 D2 F' R L' D2 B2 U'  (10f)
R' L B2 D2 F' D2 B2 R L' U'  (10f)
R' L2 U2 F' L U2 L2 F R U  (10f)
R' L2 F' L' U2 F L' U2 R U'  (10f)
R' L' U2 F' U2 L2 F R L U  (10f)
R' L' U2 F' L2 U2 F R L U  (10f)
R' L' U2 B' U2 R2 B R L U  (10f)
R' L' U2 B' R2 U2 B R L U  (10f)
R' L' F' U2 L2 F U2 R L U'  (10f)
R' L' F' R2 D2 B' D2 R' L' U'  (10f)
R' L' F' D2 R2 B' D2 R' L' U'  (10f)
R' L' F' L2 U2 F U2 R L U'  (10f)
R' L' D2 F' R2 D2 B' R' L' U'  (10f)
R' L' D2 F' D2 R2 B' R' L' U'  (10f)
R' L' D2 B' D2 L2 F' R' L' U'  (10f)
R' L' D2 B' L2 D2 F' R' L' U'  (10f)
R' L' B' U2 R2 B U2 R L U'  (10f)
R' L' B' R2 U2 B U2 R L U'  (10f)
R' L' B' D2 L2 F' D2 R' L' U'  (10f)
R' L' B' L2 D2 F' D2 R' L' U'  (10f)
R' B2 D2 L F L' D2 B2 R U  (10f)
R' B2 D2 L F' L' D2 B2 R U'  (10f)
R' B2 L D2 F D2 L' B2 R U  (10f)
R' B2 L D2 F' D2 L' B2 R U'  (10f)
F U2 B' R U2 B' R' F' B2 U'  (10f)
F U2 B' R B2 U2 B' R' F' U'  (10f)
F R F2 D B D L D2 F U  (10f)
F R F2 L D2 F L2 B L U  (10f)
F R D2 F2 B L F2 D2 F' U  (10f)
F R D' F2 D' B L D2 F U  (10f)
F R B U2 B2 R' B U2 F' U  (10f)
F R B2 U2 B R' U2 F' B2 U  (10f)
F R2 U2 F R F' U2 R2 F' U  (10f)
F R2 U2 F R' F' U2 R2 F' U'  (10f)
F R' U B' R2 B U' R F' U2  (10f)
F R' F' U2 R2 U2 B' R' B U'  (10f)
F R' B' L2 D2 L2 F' R' B U'  (10f)
F D2 R D B D F2 L F U  (10f)
F D2 R B D' F2 D' L F U  (10f)
F D2 F2 L' F2 B' D2 R' F' U'  (10f)
F L2 D2 B' R B D2 L2 F' U  (10f)
F L2 D2 B' R' B D2 L2 F' U'  (10f)
F L2 B' D2 R D2 B L2 F' U  (10f)
F L2 B' D2 R' D2 B L2 F' U'  (10f)
F B U2 R U2 B2 R' F' B' U'  (10f)
F B U2 R B2 U2 R' F' B' U'  (10f)
F B U2 L U2 F2 L' F' B' U'  (10f)
F B U2 L F2 U2 L' F' B' U'  (10f)
F B R U2 B2 R' U2 F' B' U  (10f)
F B R F2 D2 L D2 F B U  (10f)
F B R D2 F2 L D2 F B U  (10f)
F B R B2 U2 R' U2 F' B' U  (10f)
F B D2 R F2 D2 L F B U  (10f)
F B D2 R D2 F2 L F B U  (10f)
F B D2 L D2 B2 R F B U  (10f)
F B D2 L B2 D2 R F B U  (10f)
F B L U2 F2 L' U2 F' B' U  (10f)
F B L F2 U2 L' U2 F' B' U  (10f)
F B L D2 B2 R D2 F B U  (10f)
F B L B2 D2 R D2 F B U  (10f)
F B2 U2 R B' U2 B2 R' F' U'  (10f)
F B2 R B U2 R' B U2 F' U  (10f)
F B' R2 U2 R U2 R2 F' B U  (10f)
F B' R2 U2 R F' B U2 R2 U  (10f)
F B' R2 U2 R' U2 R2 F' B U'  (10f)
F B' R2 U2 R' F' B U2 R2 U'  (10f)
F B' L2 D2 R F' B D2 L2 U  (10f)
F B' L2 D2 R D2 L2 F' B U  (10f)
F B' L2 D2 R' F' B D2 L2 U'  (10f)
F B' L2 D2 R' D2 L2 F' B U'  (10f)
F2 U2 R' L F U2 F2 R L' U  (10f)
F2 U2 R' L F R L' U2 F2 U  (10f)
F2 U2 R' L F' U2 F2 R L' U'  (10f)
F2 U2 R' L F' R L' U2 F2 U'  (10f)
F2 R D2 L' B L D2 R' F2 U  (10f)
F2 R D2 L' B' L D2 R' F2 U'  (10f)
F2 R L' D2 B D2 R' L F2 U  (10f)
F2 R L' D2 B' D2 R' L F2 U'  (10f)
F2 R B' L' D2 R' B' L F2 U'  (10f)
F2 R' L U2 F U2 R L' F2 U'  (10f)
F2 R' L U2 F' U2 R L' F2 U  (10f)
F2 D2 R L' B R' L D2 F2 U  (10f)
F2 D2 R L' B D2 F2 R' L U  (10f)
F2 D2 R L' B' R' L D2 F2 U'  (10f)
F2 D2 R L' B' D2 F2 R' L U'  (10f)
F2 L' D2 R B R' D2 L F2 U  (10f)
F2 L' D2 R B' R' D2 L F2 U'  (10f)
F2 L' B R D2 L B R' F2 U  (10f)
F2 B U2 L F' U2 F2 L' B' U'  (10f)
F2 B L F U2 L' F U2 B' U  (10f)
F2 B' U2 R' F U2 F2 R B U  (10f)
F2 B' R' F' U2 R F' U2 B U'  (10f)
F' U2 B L' U2 B L F B2 U  (10f)
F' U2 B L' B2 U2 B L F U  (10f)
F' R2 D2 B L B' D2 R2 F U  (10f)
F' R2 D2 B L' B' D2 R2 F U'  (10f)
F' R2 B D2 L D2 B' R2 F U  (10f)
F' R2 B D2 L' D2 B' R2 F U'  (10f)
F' D2 F2 R F2 B D2 L F U  (10f)
F' D2 L' D' B' D' F2 R' F' U'  (10f)
F' D2 L' B' D F2 D R' F' U'  (10f)
F' L U' B L2 B' U L' F U2  (10f)
F' L F U2 L2 U2 B L B' U  (10f)
F' L B R2 D2 R2 F L B' U  (10f)
F' L2 U2 F' L F U2 L2 F U  (10f)
F' L2 U2 F' L' F U2 L2 F U'  (10f)
F' L' F2 R' D2 F' R2 B' R' U'  (10f)
F' L' F2 D' B' D' R' D2 F' U'  (10f)
F' L' D F2 D B' R' D2 F' U'  (10f)
F' L' D2 F2 B' R' F2 D2 F U'  (10f)
F' L' B2 U2 B' L U2 F B2 U'  (10f)
F' L' B' U2 B2 L B' U2 F U'  (10f)
F' B R2 D2 L F B' D2 R2 U  (10f)
F' B R2 D2 L D2 R2 F B' U  (10f)
F' B R2 D2 L' F B' D2 R2 U'  (10f)
F' B R2 D2 L' D2 R2 F B' U'  (10f)
F' B L2 U2 L U2 L2 F B' U  (10f)
F' B L2 U2 L F B' U2 L2 U  (10f)
F' B L2 U2 L' U2 L2 F B' U'  (10f)
F' B L2 U2 L' F B' U2 L2 U'  (10f)
F' B2 U2 L' B U2 B2 L F U  (10f)
F' B2 L' B' U2 L B' U2 F U'  (10f)
F' B' U2 R' U2 F2 R F B U  (10f)
F' B' U2 R' F2 U2 R F B U  (10f)
F' B' U2 L' U2 B2 L F B U  (10f)
F' B' U2 L' B2 U2 L F B U  (10f)
F' B' R' U2 F2 R U2 F B U'  (10f)
F' B' R' F2 U2 R U2 F B U'  (10f)
F' B' R' D2 B2 L' D2 F' B' U'  (10f)
F' B' R' B2 D2 L' D2 F' B' U'  (10f)
F' B' D2 R' D2 B2 L' F' B' U'  (10f)
F' B' D2 R' B2 D2 L' F' B' U'  (10f)
F' B' D2 L' F2 D2 R' F' B' U'  (10f)
F' B' D2 L' D2 F2 R' F' B' U'  (10f)
F' B' L' U2 B2 L U2 F B U'  (10f)
F' B' L' F2 D2 R' D2 F' B' U'  (10f)
F' B' L' D2 F2 R' D2 F' B' U'  (10f)
F' B' L' B2 U2 L U2 F B U'  (10f)
L U2 R' F U2 R' F' R2 L' U'  (10f)
L U2 R' F R2 U2 R' F' L' U'  (10f)
L F R U2 R2 F' R U2 L' U  (10f)
L F R2 U2 R F' U2 R2 L' U  (10f)
L F D2 R L2 B L2 D2 L' U  (10f)
L F D' L2 D' R B D2 L U  (10f)
L F L2 D R D B D2 L U  (10f)
L F L2 B D2 L B2 R B U  (10f)
L F2 U2 L F L' U2 F2 L' U  (10f)
L F2 U2 L F' L' U2 F2 L' U'  (10f)
L F' U R' F2 R U' F L' U2  (10f)
L F' R' B2 D2 B2 L' F' R U'  (10f)
L F' L' U2 F2 U2 R' F' R U'  (10f)
L D2 F R D' L2 D' B L U  (10f)
L D2 F D R D L2 B L U  (10f)
L D2 L2 B' R' L2 D2 F' L' U'  (10f)
L B2 R' D2 F D2 R B2 L' U  (10f)
L B2 R' D2 F' D2 R B2 L' U'  (10f)
L B2 D2 R' F R D2 B2 L' U  (10f)
L B2 D2 R' F' R D2 B2 L' U'  (10f)
L2 U2 F' B L U2 L2 F B' U  (10f)
L2 U2 F' B L F B' U2 L2 U  (10f)
L2 U2 F' B L' U2 L2 F B' U'  (10f)
L2 U2 F' B L' F B' U2 L2 U'  (10f)
L2 F R' B' D2 F' R' B L2 U'  (10f)
L2 F D2 B' R B D2 F' L2 U  (10f)
L2 F D2 B' R' B D2 F' L2 U'  (10f)
L2 F B' D2 R D2 F' B L2 U  (10f)
L2 F B' D2 R' D2 F' B L2 U'  (10f)
L2 F' B U2 L U2 F B' L2 U'  (10f)
L2 F' B U2 L' U2 F B' L2 U  (10f)
L2 D2 F B' R F' B D2 L2 U  (10f)
L2 D2 F B' R D2 L2 F' B U  (10f)
L2 D2 F B' R' F' B D2 L2 U'  (10f)
L2 D2 F B' R' D2 L2 F' B U'  (10f)
L2 B' R F D2 B R F' L2 U  (10f)
L2 B' D2 F R F' D2 B L2 U  (10f)
L2 B' D2 F R' F' D2 B L2 U'  (10f)
L' U2 R B' U2 R B R2 L U  (10f)
L' U2 R B' R2 U2 R B L U  (10f)
L' F2 R D2 B D2 R' F2 L U  (10f)
L' F2 R D2 B' D2 R' F2 L U'  (10f)
L' F2 D2 R B R' D2 F2 L U  (10f)
L' F2 D2 R B' R' D2 F2 L U'  (10f)
L' D2 L2 F R L2 D2 B L U  (10f)
L' D2 B' R' D L2 D F' L' U'  (10f)
L' D2 B' D' R' D' L2 F' L' U'  (10f)
L' B U' R B2 R' U B' L U2  (10f)
L' B R F2 D2 F2 L B R' U  (10f)
L' B L U2 B2 U2 R B R' U  (10f)
L' B2 U2 L' B L U2 B2 L U  (10f)
L' B2 U2 L' B' L U2 B2 L U'  (10f)
L' B' R2 U2 R' B U2 R2 L U'  (10f)
L' B' R' U2 R2 B R' U2 L U'  (10f)
L' B' D L2 D R' F' D2 L' U'  (10f)
L' B' D2 R' L2 F' L2 D2 L U'  (10f)
L' B' L2 F' D2 L' F2 R' F' U'  (10f)
L' B' L2 D' R' D' F' D2 L' U'  (10f)
B U2 F' L U2 F' L' F2 B' U'  (10f)
B U2 F' L F2 U2 F' L' B' U'  (10f)
B R2 F' D2 L D2 F R2 B' U  (10f)
B R2 F' D2 L' D2 F R2 B' U'  (10f)
B R2 D2 F' L F D2 R2 B' U  (10f)
B R2 D2 F' L' F D2 R2 B' U'  (10f)
B D2 L F D' B2 D' R B U  (10f)
B D2 L D F D B2 R B U  (10f)
B D2 B2 R' F' B2 D2 L' B' U'  (10f)
B L F U2 F2 L' F U2 B' U  (10f)
B L F2 U2 F L' U2 F2 B' U  (10f)
B L D2 F B2 R B2 D2 B' U  (10f)
B L D' B2 D' F R D2 B U  (10f)
B L B2 R D2 B R2 F R U  (10f)
B L B2 D F D R D2 B U  (10f)
B L2 U2 B L B' U2 L2 B' U  (10f)
B L2 U2 B L' B' U2 L2 B' U'  (10f)
B L' U F' L2 F U' L B' U2  (10f)
B L' F' R2 D2 R2 B' L' F U'  (10f)
B L' B' U2 L2 U2 F' L' F U'  (10f)
B2 U2 R L' B U2 B2 R' L U  (10f)
B2 U2 R L' B R' L U2 B2 U  (10f)
B2 U2 R L' B' U2 B2 R' L U'  (10f)
B2 U2 R L' B' R' L U2 B2 U'  (10f)
B2 R L' U2 B U2 R' L B2 U'  (10f)
B2 R L' U2 B' U2 R' L B2 U  (10f)
B2 R' F L D2 R F L' B2 U  (10f)
B2 R' D2 L F L' D2 R B2 U  (10f)
B2 R' D2 L F' L' D2 R B2 U'  (10f)
B2 R' L D2 F D2 R L' B2 U  (10f)
B2 R' L D2 F' D2 R L' B2 U'  (10f)
B2 D2 R' L F R L' D2 B2 U  (10f)
B2 D2 R' L F D2 B2 R L' U  (10f)
B2 D2 R' L F' R L' D2 B2 U'  (10f)
B2 D2 R' L F' D2 B2 R L' U'  (10f)
B2 L F' R' D2 L' F' R B2 U'  (10f)
B2 L D2 R' F R D2 L' B2 U  (10f)
B2 L D2 R' F' R D2 L' B2 U'  (10f)
B' U2 F R' U2 F R F2 B U  (10f)
B' U2 F R' F2 U2 F R B U  (10f)
B' R U' F R2 F' U R' B U2  (10f)
B' R F L2 D2 L2 B R F' U  (10f)
B' R B U2 R2 U2 F R F' U  (10f)
B' R2 U2 B' R B U2 R2 B U  (10f)
B' R2 U2 B' R' B U2 R2 B U'  (10f)
B' R' F2 U2 F' R U2 F2 B U'  (10f)
B' R' F' U2 F2 R F' U2 B U'  (10f)
B' R' D B2 D F' L' D2 B' U'  (10f)
B' R' D2 F' B2 L' B2 D2 B U'  (10f)
B' R' B2 D' F' D' L' D2 B' U'  (10f)
B' R' B2 L' D2 B' L2 F' L' U'  (10f)
B' D2 R' F' D B2 D L' B' U'  (10f)
B' D2 R' D' F' D' B2 L' B' U'  (10f)
B' D2 B2 L F B2 D2 R B U  (10f)
B' L2 F D2 R D2 F' L2 B U  (10f)
B' L2 F D2 R' D2 F' L2 B U'  (10f)
B' L2 D2 F R F' D2 L2 B U  (10f)
B' L2 D2 F R' F' D2 L2 B U'  (10f)
Searching depth 11

U R U R B' R' U2 B2 U' B' R'  (11f)
U R U L' B2 U' B R' U L B2  (11f)
U R U2 R F R F' U2 F R F'  (11f)
U R U2 R2 F' U2 D2 L' D2 F R  (11f)
U R U2 R2 D2 F' U2 L' F D2 R  (11f)
U R U2 F R F' B U2 B2 R' B  (11f)
U R U2 L' B U2 L' B' R' L2 U2  (11f)
U R U2 L' B L2 U2 L' B' R' U2  (11f)
U R F R2 L F' U2 R' F' L' F'  (11f)
U R F R2 B' R' U2 R' F' B R'  (11f)
U R F D2 B R2 D2 R' F2 L F  (11f)
U R F L D2 B R2 D2 R' F L  (11f)
U R F L' D2 L2 B D2 R F L  (11f)
U R F B2 L' B' L B' R2 F' R'  (11f)
U R F2 D2 L' B' L U2 B2 L D2  (11f)
U R F2 D2 L' B' L D2 F2 R' U2  (11f)
U R F2 D2 B D F L D F R'  (11f)
U R F2 D' F D' B L D2 F R'  (11f)
U R F2 L' D2 B R' L2 D2 L' F2  (11f)
U R F2 L' D2 B' D2 L F2 R' U2  (11f)
U R F2 L' D2 B' L F2 R' U2 B2  (11f)
U R F' D2 B L D2 F' R' F2 R'  (11f)
U R D B2 L' B' U2 L B' D' R'  (11f)
U R D B' L' B' U2 B' L D' R'  (11f)
U R D2 R2 F' R2 L' D2 B' R' U2  (11f)
U R D2 L F L' D2 L' B R L  (11f)
U R D2 L2 B L U2 B' U2 D2 R'  (11f)
U R D2 L' B2 U2 B' L D2 R' F2  (11f)
U R D2 B D L D2 R2 D' F R  (11f)
U R D2 B D2 R2 D2 L D2 F R  (11f)
U R D2 B D2 R2 D' L D F R  (11f)
U R D2 B D' R2 D L D2 F R  (11f)
U R D2 B D' R2 D2 L D F R  (11f)
U R D2 B L U2 L2 B' U2 D2 R'  (11f)
U R D2 B L' U2 B' U2 L2 D2 R'  (11f)
U R D2 B L' U2 B' D2 R2 U2 R  (11f)
U R D2 B2 L' B' U2 L B' D2 R'  (11f)
U R D' B D R2 L D F D' R  (11f)
U R D' B D' R2 L D' F D' R  (11f)
U R D' B2 L' B' U2 L B' D R'  (11f)
U R L U2 F U2 R2 F' R' L' U2  (11f)
U R L U2 F R2 U2 F' R' L' U2  (11f)
U R L U2 B U2 L2 B' R' L' U2  (11f)
U R L U2 B L2 U2 B' R' L' U2  (11f)
U R L F U2 R2 F' R2 U2 R L'  (11f)
U R L F U2 R2 F' L2 U2 R' L  (11f)
U R L F R U2 R F' R' U2 L'  (11f)
U R L F R2 U2 F' R2 U2 R L'  (11f)
U R L F R2 U2 F' L2 U2 R' L  (11f)
U R L F D2 L2 B R2 D2 R' L  (11f)
U R L F D2 L2 B L2 D2 R L'  (11f)
U R L F L2 D2 B R2 D2 R' L  (11f)
U R L F L2 D2 B L2 D2 R L'  (11f)
U R L F L' D2 L' B L D2 R  (11f)
U R L F2 R2 F' U2 R2 F' R' L'  (11f)
U R L F2 R2 F' R2 U2 F' R' L'  (11f)
U R L B U2 L2 B' R2 U2 R L'  (11f)
U R L B U2 L2 B' L2 U2 R' L  (11f)
U R L B R2 D2 F R2 D2 R' L  (11f)
U R L B R2 D2 F L2 D2 R L'  (11f)
U R L B R' D2 R' F R D2 L  (11f)
U R L B D2 R2 F R2 D2 R' L  (11f)
U R L B D2 R2 F L2 D2 R L'  (11f)
U R L B L U2 L B' L' U2 R'  (11f)
U R L B L2 U2 B' R2 U2 R L'  (11f)
U R L B L2 U2 B' L2 U2 R' L  (11f)
U R L B2 L2 B' U2 L2 B' R' L'  (11f)
U R L B2 L2 B' L2 U2 B' R' L'  (11f)
U R L2 U2 B L' U2 L2 B' R' U2  (11f)
U R L2 B U2 L B' L2 U2 R' L2  (11f)
U R L' U2 R2 F' U2 L2 F R L  (11f)
U R L' U2 R2 F' L2 U2 F R L  (11f)
U R L' U2 R2 B' U2 R2 B R L  (11f)
U R L' U2 R2 B' R2 U2 B R L  (11f)
U R L' U2 B2 U2 B U2 R' L B2  (11f)
U R L' F L2 F D2 B R' L D2  (11f)
U R L' F L2 B R2 F R' L D2  (11f)
U R L' F B R2 F R' L D2 F2  (11f)
U R L' F B R2 F D2 F2 R' L  (11f)
U R L' F2 D2 F L2 F B R' L  (11f)
U R L' F2 D2 F2 B' U2 B2 R' L  (11f)
U R L' F2 D2 F2 B' R' L U2 B2  (11f)
U R L' F2 D2 B' U2 B2 R' L D2  (11f)
U R L' F2 D2 B' R' L U2 B2 D2  (11f)
U R L' F2 D2 B' R' L D2 F2 U2  (11f)
U R L' F2 D2 B' D2 F2 R' L U2  (11f)
U R L' F' B' L2 F U2 B2 R' L  (11f)
U R L' F' B' L2 F R' L U2 B2  (11f)
U R L' D2 L2 F D2 L2 B R L  (11f)
U R L' D2 L2 F L2 D2 B R L  (11f)
U R L' D2 L2 B R2 D2 F R L  (11f)
U R L' D2 L2 B D2 R2 F R L  (11f)
U R L' D2 B2 U2 B' D2 R' L F2  (11f)
U R L' B D2 F R2 F R' L D2  (11f)
U R L' B L U2 B2 U B U R'  (11f)
U R L' B L B U2 B U2 B2 R'  (11f)
U R L' B2 U2 F R2 F' B' R' L  (11f)
U R L' B2 U2 F2 B' R' L D2 F2  (11f)
U R L' B2 U2 F2 B' D2 F2 R' L  (11f)
U R L' B2 U2 B' U2 B2 R' L U2  (11f)
U R L' B2 U2 B' R' L U2 B2 U2  (11f)
U R L' B2 U2 B' R' L D2 F2 D2  (11f)
U R L' B2 U2 B' D2 F2 R' L D2  (11f)
U R L' B' R' F' L2 F L U2 B2  (11f)
U R B R2 F' D2 F2 L D2 R F  (11f)
U R B R' D L D R' F R D2  (11f)
U R B D L U2 L2 D' B' U2 R'  (11f)
U R B D L D R2 F R2 D2 R'  (11f)
U R B D L D2 R2 D' F D2 R  (11f)
U R B D L D' R2 D2 F D2 R  (11f)
U R B D2 L U2 L2 D2 B' U2 R'  (11f)
U R B D2 L D R2 D' F D2 R  (11f)
U R B D2 L D2 R2 D2 F D2 R  (11f)
U R B D2 L' U2 D2 B' R2 U2 R  (11f)
U R B D' R2 D2 L D F D2 R  (11f)
U R B2 U2 R B' R' U2 B2 R' U2  (11f)
U R B2 U2 R B' R' D2 F2 L D2  (11f)
U R B2 L2 F' L' D2 F L' B2 R'  (11f)
U R B2 L' B' U2 B' R' B L B'  (11f)
U R B2 L' B' R2 U2 R2 L B' R'  (11f)
U R B2 L' B' L F B' R2 F' R'  (11f)
U R B' U L' B2 L U' B R' U  (11f)
U R B' U B' R' L' B' U L B'  (11f)
U R B' R2 U2 R L' B L U2 B  (11f)
U R B' R' U2 B2 U2 L' B' L U2  (11f)
U R B' L B2 D2 F2 L F' R D2  (11f)
U R B' L' U2 R' B L B2 U2 B'  (11f)
U R B' L' U2 B2 L U2 B U2 R'  (11f)
U R B' L' F2 D2 F2 R' B' L U2  (11f)
U R2 U2 R2 F B' R U2 F' B R2  (11f)
U R2 U2 F R F' U2 R F R F'  (11f)
U R2 U2 F L F2 L' B' R' F' B  (11f)
U R2 U2 F L F2 B' R' B L' F'  (11f)
U R2 U2 F L2 B' R' D2 B L2 F'  (11f)
U R2 U2 F B' R' U2 R2 F' B U2  (11f)
U R2 U2 F B' R' F' B U2 R2 U2  (11f)
U R2 U2 F B' R' F' B D2 L2 D2  (11f)
U R2 U2 F B' R' D2 L2 F' B D2  (11f)
U R2 U2 F B' R' L2 F' B D2 L2  (11f)
U R2 U2 F B' R' L2 D2 L2 F' B  (11f)
U R2 U2 F B' L F2 R' L' F' B  (11f)
U R2 U2 L2 F B' R' D2 F' B L2  (11f)
U R2 U2 B' L2 F R' D2 F' L2 B  (11f)
U R2 F U B' R U' R2 F' U B  (11f)
U R2 F D2 F2 B L D2 F R2 B'  (11f)
U R2 F B U2 B2 R' U2 F' B R2  (11f)
U R2 F B D2 F2 L D2 F B' R2  (11f)
U R2 F B' U2 R U2 R2 U2 F' B  (11f)
U R2 F B' U2 R U2 F' B R2 U2  (11f)
U R2 F B' U2 R F' B R2 U2 R2  (11f)
U R2 F B' U2 R' U2 F B R2 F2  (11f)
U R2 F B' U2 R' U2 F' B' R2 B2  (11f)
U R2 F B' U2 R' F2 U2 F B R2  (11f)
U R2 F B' U2 R' B2 U2 F' B' R2  (11f)
U R2 F2 R L U2 F' U2 R L' F2  (11f)
U R2 F2 R' D2 L' B L D2 R' F2  (11f)
U R2 F2 R' L' D2 B D2 R' L F2  (11f)
U R2 F' D2 B L B' D2 F' R2 F2  (11f)
U R2 F' D2 B L' U2 L2 B' D2 F  (11f)
U R2 F' D2 B L' B' D2 F R2 U2  (11f)
U R2 F' L B D2 F L B R2 B2  (11f)
U R2 F' B D2 L F2 D2 F' B' R2  (11f)
U R2 F' B D2 L D2 F B R2 B2  (11f)
U R2 F' B D2 L D2 F' B' R2 F2  (11f)
U R2 F' B D2 L B2 D2 F B R2  (11f)
U R2 F' B D2 L' U2 L2 D2 F B'  (11f)
U R2 F' B D2 L' F B' R2 U2 L2  (11f)
U R2 F' B D2 L' D2 F B' R2 U2  (11f)
U R2 F' B' U2 F2 R' U2 F' B R2  (11f)
U R2 F' B' D2 B2 L D2 F B' R2  (11f)
U R2 D2 F' B R F2 R L F B'  (11f)
U R2 D2 F' B R2 L' U2 L2 F B'  (11f)
U R2 D2 F' B R2 L' F B' U2 L2  (11f)
U R2 D2 F' B L' U2 L2 F B' D2  (11f)
U R2 D2 F' B L' F B' U2 L2 D2  (11f)
U R2 D2 F' B L' F B' D2 R2 U2  (11f)
U R2 D2 F' B L' D2 R2 F B' U2  (11f)
U R2 L U2 F R' U2 R2 F' L' U2  (11f)
U R2 L F U2 R F' R2 U2 R2 L'  (11f)
U R2 L' U2 R2 B' R U2 B R2 L  (11f)
U R2 L' B L U2 B2 U2 R' B R'  (11f)
U R2 L' B2 L B R' U2 B' R' B2  (11f)
U R2 L' B' R' U2 B R' U2 L U2  (11f)
U R2 B D2 F' L F D2 B R2 B2  (11f)
U R2 B D2 F' L' U2 L2 F D2 B'  (11f)
U R2 B D2 F' L' F D2 B' R2 U2  (11f)
U R2 B L' F' D2 B' L' F R2 U2  (11f)
U R2 B2 R F L D2 R F L' B2  (11f)
U R2 B2 R D2 L F L' D2 R B2  (11f)
U R2 B2 R L D2 F D2 R L' B2  (11f)
U R2 B2 R' L' U2 B' U2 R' L B2  (11f)
U R2 B' R' U2 B' R F R2 F' B2  (11f)
U R2 B' R' B2 U2 B' R F R2 F'  (11f)
U R2 B' D2 F' B2 L D2 B' R2 F  (11f)
U R' U F U F2 U2 L F R L'  (11f)
U R' U2 R2 F R B' U2 F' R' B  (11f)
U R' U2 F U2 L F2 U2 L' F' R  (11f)
U R' U2 F' D2 L2 U2 L D2 F R  (11f)
U R' U2 F' D' L2 U2 L D F R  (11f)
U R' U2 D2 F' U2 L F L2 D2 R  (11f)
U R' U2 D2 F' L2 U2 L F D2 R  (11f)
U R' U2 L' F' L U2 L F R L  (11f)
U R' U2 B' R F R U2 B R F'  (11f)
U R' F U R' F' B' R' U R' B  (11f)
U R' F U2 D2 R' F' B' R2 B' L'  (11f)
U R' F U' L F2 L' U F' R U  (11f)
U R' F R U2 R' F R F U2 F  (11f)
U R' F R F U2 R' F R U2 F2  (11f)
U R' F R F2 R U2 R' L F' L'  (11f)
U R' F R L F' U2 F' U2 L' F'  (11f)
U R' F R B' R' U2 R' F' R2 B  (11f)
U R' F R2 F2 L U2 F' L' F2 R'  (11f)
U R' F R' U2 F2 U2 L F R2 L'  (11f)
U R' F L U2 F R F L' U2 F'  (11f)
U R' F B' R' U2 R' F' R2 B R  (11f)
U R' F2 U2 R' F' R U2 F2 R U2  (11f)
U R' F2 U2 R' F' R D2 B2 L' D2  (11f)
U R' F2 U2 F U2 F L F R L'  (11f)
U R' F2 R F L' U2 L2 F' L' F2  (11f)
U R' F2 L' B D2 L' B' L2 F2 R  (11f)
U R' F' U' F2 U2 R' F' R U R  (11f)
U R' F' R L' U2 L F2 L F L'  (11f)
U R' F' R2 D' L' D' B' D2 R' U2  (11f)
U R' F' R2 L U2 R2 F' L' F2 R  (11f)
U R' F' R2 B' D2 R' B2 L' B' U2  (11f)
U R' F' D R2 D L' B' D2 R' U2  (11f)
U R' F' D2 R2 L' B' R2 D2 R U2  (11f)
U R' F' L2 U2 L' F U2 R L2 U2  (11f)
U R' F' L' U2 L2 F L' U2 R U2  (11f)
U R' D F' L U2 F' L' F2 D' R  (11f)

computation stopped.

''';