part of '../revenge_algorithms.dart';

const _ufuburraw = '''
Cannot use any accelerator table.
computation started...

Searching depth 7

Searching depth 8

Searching depth 9

Searching depth 10

U R F D2 L U' B D2 R F  (10f*)
U R' U F' L' U' L U' F R  (10f*)
U R' F' U' F U' R B U B'  (10f*)
U F R U' B U' B' R' U F'  (10f*)
U L U2 L2 B U' L B2 U2 B  (10f*)
U L' U L F U' R U' R' F'  (10f*)
U2 R U' R' F L F2 L' U2 F'  (10f*)
U2 R U' R' F' U2 R' F2 R F  (10f*)
U2 R2 F R U' L F2 L' F' R  (10f*)
U2 R2 B' R' U L' B2 L B R'  (10f*)
U2 R' U R B U2 R B2 R' B'  (10f*)
U2 R' U R B' L' B2 L U2 B  (10f*)
U2 F R U' R2 L F2 L' F' R  (10f*)
U2 F L F2 L' U2 F' L' U' L  (10f*)
U2 F' U2 R' F2 R F L' U' L  (10f*)
U2 F' U2 L' U L F' R' F2 R  (10f*)
U2 L F2 L' F' R U R' U2 F'  (10f*)
U2 L F' R' F2 R U' L F L2  (10f*)
U2 L F' R' F2 R L2 U' L F  (10f*)
U2 L' B R B2 R' U L' B' L2  (10f*)
U2 L' B R B2 R' L2 U L' B'  (10f*)
U2 L' B2 L B R' U' R U2 B  (10f*)
U2 B U2 R B2 R' B' L U L'  (10f*)
U2 B U2 L U' L' B R B2 R'  (10f*)
U2 B' R' U R2 L' B2 L B R'  (10f*)
U2 B' L' B2 L U2 B L U L'  (10f*)
U' R U' B L U L' U B' R'  (10f*)
U' R B U B' U R' F' U' F  (10f*)
U' R' B' D2 L' U F' D2 R' B'  (10f*)
U' L U' L' B' U R' U R B  (10f*)
U' L' U2 L2 F' U L' F2 U2 F'  (10f*)
U' B' R' U F' U F R U' B  (10f*)
R U R' U F' L' U' L U' F  (10f*)
R U2 F U2 R2 F' R' L' U' L  (10f*)
R U2 L B U2 L B' R' U' L'  (10f*)
R U2 B U2 L2 B' R' L' U' L'  (10f*)
R U2 B' U R' L' B2 L U B  (10f*)
R U' R2 U' F U' R F2 U' F  (10f*)
R F U B' R2 F' R' B2 U B'  (10f*)
R F R2 U F' R' U F' U2 F  (10f*)
R F R2 U2 F' U2 R' L' U L  (10f*)
R F D2 B D2 R F' L U L'  (10f*)
R F L2 D2 B D2 R L U L  (10f*)
R F2 D2 B D2 F2 R' L U L'  (10f*)
R F2 D2 B' D2 F2 R' L U' L'  (10f*)
R D2 F D2 L2 B R L U L  (10f*)
R D2 B D2 R2 F R L U L'  (10f*)
R D' F D2 B D' R L U L'  (10f*)
R L U' L' B2 U' B' R' U B2  (10f*)
R B U' L U' L' B' U R' U  (10f*)
R B R2 D2 F D2 R L U L'  (10f*)
R B R2 L F D2 R F' U L'  (10f*)
R B R' L U2 L' B L U' L'  (10f*)
R B L2 U2 B' U2 R' L' U L'  (10f*)
R B2 U2 B U2 B2 R' L U L'  (10f*)
R B2 U2 B' U2 B2 R' L U' L'  (10f*)
R B2 R' B' L U L' U2 B' U2  (10f*)
R B' R' U2 B2 U2 B' L U' L'  (10f*)
R B' L' B2 R2 L U' R B U2  (10f*)
R B' L' B2 L U' R B R2 U2  (10f*)
R2 L F R F2 U2 F R U' L'  (10f*)
R2 L F D' R F' U R L' B  (10f*)
R2 L B' R' B2 U2 B' R' U L'  (10f*)
R2 L' F R F2 U2 F R U' L  (10f*)
R2 L' B' R' B2 U2 B' R' U L  (10f*)
R2 L' B' D R' B U' R' L F'  (10f*)
R' U R2 U B' U R' B2 U B'  (10f*)
R' U2 F U' R L F2 L' U' F'  (10f*)
R' U2 F' U2 L2 F R L U L  (10f*)
R' U2 L' F' U2 L' F R U L  (10f*)
R' U2 B' U2 R2 B R L U L'  (10f*)
R' U' R U' B L U L' U B'  (10f*)
R' F R U2 F2 U2 F L' U L  (10f*)
R' F L F2 R2 L' U R' F' U2  (10f*)
R' F L F2 L' U R' F' R2 U2  (10f*)
R' F2 U2 F U2 F2 R L' U L  (10f*)
R' F2 U2 F' U2 F2 R L' U' L  (10f*)
R' F2 R F L' U' L U2 F U2  (10f*)
R' F' U L' U L F U' R U'  (10f*)
R' F' R L' U2 L F' L' U L  (10f*)
R' F' R2 D2 B' D2 R' L' U' L  (10f*)
R' F' R2 L' B' D2 R' B U' L  (10f*)
R' F' L2 U2 F U2 R L U' L  (10f*)
R' D B' D2 F' D R' L' U' L  (10f*)
R' D2 F' D2 R2 B' R' L' U' L  (10f*)
R' D2 B' D2 L2 F' R' L' U' L'  (10f*)
R' L' U L F2 U F R U' F2  (10f*)
R' B2 D2 F D2 B2 R L' U L  (10f*)
R' B2 D2 F' D2 B2 R L' U' L  (10f*)
R' B' U' F R2 B R F2 U' F  (10f*)
R' B' R2 U2 B U2 R L U' L'  (10f*)
R' B' R2 U' B R U' B U2 B'  (10f*)
R' B' D2 F' D2 R' B L' U' L  (10f*)
R' B' L2 D2 F' D2 R' L' U' L'  (10f*)
F U L F2 R' L' U F' U2 R  (10f*)
F U2 R U' R' F L F2 L' U2  (10f*)
F U2 F2 L U' F L2 U2 L U  (10f*)
F U2 L F2 L' F' R U R' U2  (10f*)
F U' R B U B' U R' F' U'  (10f*)
F R U R' U F' L' U' L U'  (10f*)
F R L' U B' R D' B R2 L  (10f*)
F D R D L2 B L U L D2  (10f*)
F D R D B D2 F' L U L'  (10f*)
F L2 D R D B D2 L U L  (10f*)
F L' D2 R L' B L U D2 L  (10f*)
F2 U R' F' U' F2 L' U' R L  (10f*)
F2 U2 L F L' U2 F2 L' U L  (10f*)
F2 U2 L F' L' U2 F2 L' U' L  (10f*)
F2 R D2 B D2 R' F2 L U L'  (10f*)
F2 R D2 B' D2 R' F2 L U' L'  (10f*)
F2 D2 R B R' D2 F2 L U L'  (10f*)
F2 D2 R B' R' D2 F2 L U' L'  (10f*)
F' U R2 F2 R U F' U2 R F  (10f*)
F' U R' F2 R U' F L' U2 L  (10f*)
F' U F R U' B U' B' R' U  (10f*)
F' U F2 R' U F' U R2 U R'  (10f*)
F' U F2 R' B' R2 F' U B R  (10f*)
F' U L' U L F U' R U' R'  (10f*)
F' U2 F U' R F U' R2 F' R'  (10f*)
F' U2 L F' R' F2 R L2 U' L  (10f*)
F' R' U2 F U' R' F2 R2 U' F  (10f*)
F' R' F2 R U2 F R U R' U2  (10f*)
F' R' D2 B' U L' D2 F' R' U'  (10f*)
F' L2 U2 R' F R L F U' L  (10f*)
F' L2 U2 L F' R' F2 R U' L  (10f*)
F' L' U R' F2 R F L' U2 L2  (10f*)
F' L' U R' L2 F2 R F L' U2  (10f*)
D2 F D R D L2 B L U L  (10f*)
D2 L U L F L2 D R D B  (10f*)
D2 L' U' L' B' L2 D' R' D' F'  (10f*)
D2 B' D' R' D' L2 F' L' U' L'  (10f*)
L U R L F L2 D2 B D2 R  (10f*)
L U R L D2 F D2 L2 B R  (10f*)
L U R L B L2 U2 B' U2 R'  (10f*)
L U R L' F2 D2 B D2 F2 R'  (10f*)
L U R L' B2 U2 B U2 B2 R'  (10f*)
L U R B L' U2 B' L' U2 R'  (10f*)
L U R' F' U2 F2 R' F' R2 L'  (10f*)
L U R' L' U2 B' U2 R2 B R  (10f*)
L U D2 L F R L' D2 L' B  (10f*)
L U L F L2 D R D B D2  (10f*)
L U L D2 F D R D L2 B  (10f*)
L U L' F2 R D2 B D2 R' F2  (10f*)
L U L' F2 D2 R B R' D2 F2  (10f*)
L U L' B U2 B2 U2 R B R'  (10f*)
L U L' B2 U2 L' B L U2 B2  (10f*)
L U L' B' L U2 R L' B' R'  (10f*)
L U2 L' B U' R B2 R' U B'  (10f*)
L U' R L U2 B U2 L2 B' R'  (10f*)
L U' R L2 B2 R' B' L U2 B'  (10f*)
L U' R L' F2 D2 B' D2 F2 R'  (10f*)
L U' R L' B2 U2 B' U2 B2 R'  (10f*)
L U' R B U2 B2 R B R2 L'  (10f*)
L U' R B2 R' B' L U2 L2 B'  (10f*)
L U' R' L' F' R2 D2 B' D2 R'  (10f*)
L U' R' L' D B' D2 F' D R'  (10f*)
L U' R' L' D2 F' D2 R2 B' R'  (10f*)
L U' R' L' B' R2 U2 B U2 R  (10f*)
L U' F R' D2 F' R2 L' B' R'  (10f*)
L U' L' F R' D2 B' D2 F' R'  (10f*)
L U' L' F D2 B' D' R' D' F'  (10f*)
L U' L' F2 R D2 B' D2 R' F2  (10f*)
L U' L' F2 D2 R B' R' D2 F2  (10f*)
L U' L' B R B2 R' U2 B' U2  (10f*)
L U' L' B2 U2 L' B' L U2 B2  (10f*)
L U' L' B' U2 L' B2 L B U2  (10f*)
L U' B R L B R' U2 L2 B'  (10f*)
L2 U2 L F' R' F2 R U' L F  (10f*)
L2 U2 L' B R B2 R' U L' B'  (10f*)
L2 F' L' U R' F2 R F L' U2  (10f*)
L2 B L U' R B2 R' B' L U2  (10f*)
L' U R L F R2 U2 F' U2 R'  (10f*)
L' U R L D2 B D2 R2 F R  (10f*)
L' U R L D' F D2 B D' R  (10f*)
L' U R L B R2 D2 F D2 R  (10f*)
L' U R' F2 R F L' U2 L2 F  (10f*)
L' U R' F' U2 F2 R' F' R2 L  (10f*)
L' U R' L F2 U2 F U2 F2 R  (10f*)
L' U R' L B2 D2 F D2 B2 R  (10f*)
L' U R' L2 F2 R F L' U2 F  (10f*)
L' U R' L' U2 F' U2 L2 F R  (10f*)
L' U F' R' L' F' R U2 L2 F  (10f*)
L' U L F U2 L F2 L' F' U2  (10f*)
L' U L F2 U2 L F L' U2 F2  (10f*)
L' U L F' R' F2 R U2 F U2  (10f*)
L' U L B2 R' D2 F D2 R B2  (10f*)
L' U L B2 D2 R' F R D2 B2  (10f*)
L' U L B' R D2 F D2 B R  (10f*)
L' U L B' D2 F D R D B  (10f*)
L' U B' R D2 B R2 L F R  (10f*)
L' U2 L F' U R' F2 R U' F  (10f*)
L' U' R L U2 F U2 R2 F' R'  (10f*)
L' U' R B U2 B2 R B R2 L  (10f*)
L' U' R' F' L U2 F L U2 R  (10f*)
L' U' R' L F2 U2 F' U2 F2 R  (10f*)
L' U' R' L B2 D2 F' D2 B2 R  (10f*)
L' U' R' L' F' L2 U2 F U2 R  (10f*)
L' U' R' L' D2 B' D2 L2 F' R'  (10f*)
L' U' R' L' B' L2 D2 F' D2 R'  (10f*)
L' U' D2 L' B' R' L D2 L F'  (10f*)
L' U' L F L' U2 R' L F R  (10f*)
L' U' L F2 U2 L F' L' U2 F2  (10f*)
L' U' L F' U2 F2 U2 R' F' R  (10f*)
L' U' L B2 R' D2 F' D2 R B2  (10f*)
L' U' L B2 D2 R' F' R D2 B2  (10f*)
L' U' L' D2 B' D' R' D' L2 F'  (10f*)
L' U' L' B' L2 D' R' D' F' D2  (10f*)
B U2 L' B R B2 R' L2 U L'  (10f*)
B U2 B' U R' B' U R2 B R  (10f*)
B U' R B2 R' U B' L U2 L'  (10f*)
B U' R2 B2 R' U' B U2 R' B'  (10f*)
B U' L U' L' B' U R' U R  (10f*)
B U' B2 R U' B U' R2 U' R  (10f*)
B U' B2 R F R2 B U' F' R'  (10f*)
B U' B' R' U F' U F R U'  (10f*)
B R U2 B' U R B2 R2 U B'  (10f*)
B R D2 F U' L D2 B R U  (10f*)
B R B2 R' U2 B' R' U' R U2  (10f*)
B L U' R L2 B2 R' B' L U2  (10f*)
B L U' R B2 R' B' L U2 L2  (10f*)
B L2 U2 R B' R' L' B' U L'  (10f*)
B L2 U2 L' B R B2 R' U L'  (10f*)
B2 U2 L' B L U2 B2 L U L'  (10f*)
B2 U2 L' B' L U2 B2 L U' L'  (10f*)
B2 U' R B U B2 L U R' L'  (10f*)
B2 R' D2 F D2 R B2 L' U L  (10f*)
B2 R' D2 F' D2 R B2 L' U' L  (10f*)
B2 D2 R' F R D2 B2 L' U L  (10f*)
B2 D2 R' F' R D2 B2 L' U' L  (10f*)
B' U R' F' U' F U' R B U  (10f*)
B' U2 R' U R B' L' B2 L U2  (10f*)
B' U2 L' B2 L B R' U' R U2  (10f*)
B' U2 B2 L' U B' L2 U2 L' U'  (10f*)
B' U' L' B2 R L U' B U2 R'  (10f*)
B' R' U' R U' B L U L' U  (10f*)
B' R' L U' F R' D F' R2 L'  (10f*)
B' D' R' D' F' D2 B L' U' L  (10f*)
B' D' R' D' L2 F' L' U' L' D2  (10f*)
B' L D2 R' L F' L' U' D2 L'  (10f*)
B' L2 D' R' D' F' D2 L' U' L'  (10f*)
Searching depth 11

U R U B U' L U2 L' B' U R'  (11f)
U R U2 R2 F' U F U F R F'  (11f)
U R U' R' F' U L' U L F U2  (11f)
U R F R2 F' U2 R' F' U' F U  (11f)
U R F D' L U' D2 B R D' F  (11f)
U R F' U' F2 D B2 R B' D' F'  (11f)
U R D B2 U2 D B' L2 D2 R' F'  (11f)
U R D' F L U' D2 B D' R F  (11f)
U R L' B' U2 D B' D' R' B2 L  (11f)
U R B U' F B2 R2 F' R' B U  (11f)
U R2 U2 F' B' U F R U R2 B  (11f)
U R2 U2 B' R F' B U F U R2  (11f)
U R2 L' B' R' U' B2 U' B' R' L  (11f)
U R' U F R U R' F2 U2 F R  (11f)
U R' U L2 F' L U' L U' F R  (11f)
U R' U2 R B U' L U' L' U' B'  (11f)
U R' U2 R2 B' U R' B2 U2 B' U2  (11f)
U R' U2 F' U F R' B' R2 B U  (11f)
U R' U2 B' R2 U B R' F R2 F'  (11f)
U R' U2 B' R2 B R F' U' F U  (11f)
U R' F U F2 U2 D' F2 D R F'  (11f)
U R' F U2 R2 U R F' B' R2 B  (11f)
U R' F R U R U R' F2 U2 F  (11f)
U R' F D R2 U2 D' R2 U R F'  (11f)
U R' F2 U R U R' F U2 F2 R  (11f)
U R' F2 R F' L U F2 L' U2 F'  (11f)
U R' F' U2 F2 R' U' F2 U F R2  (11f)
U R' F' U' L U' L' F2 R' F' R2  (11f)
U R' F' D2 B2 L' U2 D L2 D F  (11f)
U R' F' B' U' B U' F2 R' F' R2  (11f)
U R' D' L' F L2 D R2 U' R' F  (11f)
U R' L2 D F D' L' U2 L' U R  (11f)
U F U B' U2 B' D' R D F' B2  (11f)
U F R U2 R2 F' U F R U F'  (11f)
U F R U' B U' B R' B2 U F'  (11f)
U F R2 U2 R F' U F U R2 F'  (11f)
U F R2 F' R' B U B' U2 R' U  (11f)
U F R' B' R2 F2 B U' F R U  (11f)
U F R' B' R2 B U' F R F2 U  (11f)
U F B' R2 F2 U' F R U R2 B  (11f)
U F2 U R U R' L F L' U2 F2  (11f)
U F2 R U R2 U' F' R2 U2 R' F'  (11f)
U F2 R' F' U' L U' R' L' F' R2  (11f)
U F2 R' F' R2 U' L U' R' L' F'  (11f)
U F2 R' F' R2 B' U' B U' R' F'  (11f)
U F2 R' F' B' U' B U' R' F' R2  (11f)
U F' U F U R U' B U2 B' R'  (11f)
U F' U L' B' U2 B U' L U F  (11f)
U F' L B L2 F2 B' U F' L' U  (11f)
U F' L B L2 B' U F' L' F2 U  (11f)
U F' L2 F L B' U' B U2 L U  (11f)
U F' L' U B' U B L U' F U2  (11f)
U F' L' U2 L U' F U R U R'  (11f)
U F' L' U' L2 U' F B L' B' L'  (11f)
U F' B L' U' L2 U' F' L' F2 B'  (11f)
U D2 L F D2 B2 R D L2 D' B  (11f)
U D2 L F D2 B2 D L2 D' R B  (11f)
U D2 L F D' B2 D L2 D2 R B  (11f)
U D2 L D' B2 D F L2 D2 R B  (11f)
U L U L' U B' R' U2 R U' B  (11f)
U L U2 F U' F' L B L2 B' U  (11f)
U L U2 B L2 B' L' F U F' U  (11f)
U L U' F U2 F' L' U B' U B  (11f)
U L U' F R U R' U F' L' U2  (11f)
U L F U F' U L' B' U' B U2  (11f)
U L F D2 B2 R D L2 D' B D2  (11f)
U L F D2 B2 D L2 D' R B D2  (11f)
U L F D' B2 D L2 D2 R B D2  (11f)
U L F2 U F R U R' L' U2 F2  (11f)
U L F2 U F R U' R2 F2 R L'  (11f)
U L F2 R' L' F U F2 U2 R F'  (11f)
U L D' B2 D F L2 D2 R B D2  (11f)
U L2 U' B L U' B L B2 U2 L2  (11f)
U L2 U' B L B2 U' B L U2 L2  (11f)
U L2 F D2 B R D B D F' L2  (11f)
U L' U' B' U' B U' L F U2 F'  (11f)
U L' F' D2 R' U B' D2 L' F' U2  (11f)
U L' F' L2 F U2 L F U F' U  (11f)
U L' B' U F' B2 L2 F L B' U  (11f)
U B U' B' R F R2 F' U2 R' U  (11f)
U B U' B' R' U2 B' R2 B R U  (11f)
U B L2 F' D' L' U2 D L' F B'  (11f)
U B2 U2 L2 B L U' B L U' B2  (11f)
U B2 U2 B L U' L2 B L U' B2  (11f)
U B2 R B U' F R2 F' R' B U  (11f)
U B2 R' D L D F L D2 R B2  (11f)
U B2 L' B' U F' L2 F L B' U  (11f)
U B' U B L U2 B L2 B' L' U  (11f)
U B' U B L' F' L2 F U2 L U  (11f)
U B' L' B' R L U' B2 U' B' R'  (11f)
U2 R U F R' F2 U2 F B' R B  (11f)
U2 R U F R' B' U2 F' R B R2  (11f)
U2 R U B2 R' D2 L F' D2 B2 R  (11f)
U2 R U2 L' U R' L2 F' L' U2 F  (11f)
U2 R U' R' F U2 F2 L' U2 L F  (11f)
U2 R U' R' F R U2 R' F2 U2 F  (11f)
U2 R U' R' L' F' L' U2 L' F L  (11f)
U2 R U' F R' U2 B' R' F' R' B  (11f)
U2 R U' F R' F' U2 F R' F' R'  (11f)
U2 R U' F R' B' U2 R' F' R' B  (11f)
U2 R U' F L F' R' F' L' U2 F'  (11f)
U2 R U' B2 R' D2 L F D2 B2 R  (11f)
U2 R U' B2 D2 L F D2 B R B  (11f)
U2 R F R F' U R2 U2 F R F'  (11f)
U2 R F R' U2 R' F' R' L' U' L  (11f)
U2 R L' B' R' U L' B2 L B L  (11f)
U2 R B R B2 R' U L' B' R' L  (11f)
U2 R B' R' L' B' U L' B2 L2 B  (11f)
U2 R2 U R2 U' F R U' F R F2  (11f)
U2 R2 U R2 U' F R F2 U' F R  (11f)
U2 R2 U' R2 U B' R' U B' R' B2  (11f)
U2 R2 U' R2 U B' R' B2 U B' R'  (11f)
U2 R2 F R U' L F R F L' F'  (11f)
U2 R2 F D B2 D' R U' F R F2  (11f)
U2 R2 F D B2 D' R F2 U' F R  (11f)
U2 R2 D B2 D' F R U' F R F2  (11f)
U2 R2 D B2 D' F R F2 U' F R  (11f)
U2 R2 D' F2 D B' R' U B' R' B2  (11f)
U2 R2 D' F2 D B' R' B2 U B' R'  (11f)
U2 R2 B' R' U L' B' R' B' L B  (11f)
U2 R2 B' D' F2 D R' U B' R' B2  (11f)
U2 R2 B' D' F2 D R' B2 U B' R'  (11f)
U2 R' U R L B L U2 L B' L'  (11f)
U2 R' U R B' U2 B2 L U2 L' B'  (11f)
U2 R' U R B' R' U2 R B2 U2 B'  (11f)
U2 R' U F2 R D2 L' B' D2 F2 R'  (11f)
U2 R' U F2 D2 L' B' D2 F' R' F'  (11f)
U2 R' U B' R U2 F R B R F'  (11f)
U2 R' U B' R F U2 R B R F'  (11f)
U2 R' U B' R B U2 B' R B R  (11f)
U2 R' U B' L' B R B L U2 B  (11f)
U2 R' U2 L U' R L2 B L U2 B'  (11f)
U2 R' U' F2 R D2 L' B D2 F2 R'  (11f)
U2 R' U' B' R F U2 B R' F' R2  (11f)
U2 R' U' B' R B2 U2 F B' R' F'  (11f)
U2 R' F R L F U' L F2 L2 F'  (11f)
U2 R' F' R' F2 R U' L F R L'  (11f)
U2 R' L F R U' L F2 L' F' L'  (11f)
U2 R' B' R U2 R B R L U L'  (11f)
U2 R' B' R' B U' R2 U2 B' R' B  (11f)
U2 F U R F2 U2 F2 U R2 F' R  (11f)
U2 F U R F2 U2 F2 R2 U F' R  (11f)
U2 F U B2 D' R' D B U F' B  (11f)
U2 F U B' U F D R' D' F2 B  (11f)
U2 F U2 R U' B2 R' B' U F' B'  (11f)
U2 F U2 R' F' R2 L' U R' U2 L  (11f)
U2 F U2 F2 L' U2 L F L' U' L  (11f)
U2 F U2 L' U2 R U' R2 L F R  (11f)
U2 F U2 B R U' B R' U F' B'  (11f)
U2 F U' R U B U B' U R' F'  (11f)
U2 F U' F' L' U B' U B L U  (11f)
U2 F R U R' U2 F' R' F2 R F2  (11f)
U2 F R U R' L' B L B' U2 F'  (11f)
U2 F R U L' B L B' R' U2 F'  (11f)
U2 F R U B' R' B R' U2 R F'  (11f)
U2 F R U2 R' F2 U2 F L' U' L  (11f)
U2 F R U' R2 L F R F L' F'  (11f)
U2 F R2 U R2 U' R U' F R F2  (11f)
U2 F R2 U R2 U' R F2 U' F R  (11f)
U2 F R2 L F R' L' U R' U2 F'  (11f)
U2 F D R U D' R' U2 F R F2  (11f)
U2 F L U' F2 L' F' U B' U2 B  (11f)
U2 F L F2 U' L' F' U B' U2 B  (11f)
U2 F L D2 B U' R D2 F L U'  (11f)
U2 F B U' F L F2 U L' U2 B'  (11f)
U2 F B U' L F' U L' F' U2 B'  (11f)
U2 F2 U R2 F' R U2 F U R F2  (11f)
U2 F2 R2 F' R U' L F2 L' F' R  (11f)
U2 F2 L U F U2 L F' L2 U F2  (11f)
U2 F2 L U' F L' U F2 B' U2 B  (11f)
U2 F2 L F U2 L' U D' L D F  (11f)
U2 F2 L F U' L U' L2 U L2 F  (11f)
U2 F2 L F U' L F U' L2 U L2  (11f)
U2 F2 L F U' L F D' B2 D L2  (11f)
U2 F2 L F U' L D' B2 D F L2  (11f)
U2 F2 L F2 L' F' U2 L' U L F  (11f)
U2 F2 B D' L' D F U B' U F  (11f)
U2 F' U R' D2 L' B' U D2 F' R'  (11f)
U2 F' U R' D2 B' L' U D2 F' R'  (11f)
U2 F' U L' B' U' B U' L F U'  (11f)
U2 F' U2 R' F' L' F' R F U' L  (11f)
U2 F' U2 F U' R' B' R2 U B R  (11f)
U2 F' U2 F U' B R U B2 R' B'  (11f)
U2 F' U2 F U' B R B2 U R' B'  (11f)
U2 F' U2 F B U' B2 R U B R'  (11f)
U2 F' U2 F B2 U' R B' U R' B2  (11f)
U2 F' U2 F2 R' U F' R2 U2 R' U  (11f)
U2 F' U2 L' U R' L' F R L2 F  (11f)
U2 F' U2 L' U F' R' F L F R  (11f)
U2 F' U2 L' B' R B R' U L F  (11f)
U2 F' U2 B' R B R' L' U L F  (11f)
U2 F' R2 F2 R U' F R L F L'  (11f)
U2 F' R' F L F R U' L F L2  (11f)
U2 F' R' F L F R L2 U' L F  (11f)
U2 F' L U2 L' B L' B' U L F  (11f)
U2 F' L F U2 L2 U F' L F L  (11f)
U2 F' L B L U2 F L B' U L'  (11f)
U2 F' L B L F U2 L B' U L'  (11f)
U2 F' L' U B' U B U L U' F  (11f)
U2 F' L' U' L U' F R U R' U'  (11f)
U2 F' L' F B' U2 B2 L B' U' L'  (11f)
U2 F' L' F' D2 B' R' D2 F2 U L'  (11f)
U2 F' B U B D L' D' B2 U F  (11f)
U2 F' B U' F' D' L D F2 U' B'  (11f)
U2 F' B2 D L D' B' U' F U' B'  (11f)
U2 F' B' U L' B U' L B U2 F  (11f)
U2 F' B' U B' L' B2 U' L U2 F  (11f)
U2 L U' R' L' U B' U2 R2 B R  (11f)
U2 L F U' R U' R' F' U L' U'  (11f)
U2 L F U' F2 L U' L2 U L2 F  (11f)
U2 L F U' F2 L F U' L2 U L2  (11f)
U2 L F U' F2 L F D' B2 D L2  (11f)
U2 L F U' F2 L D' B2 D F L2  (11f)
U2 L F R F L' F' U R' U2 F'  (11f)
U2 L F R L2 U' L U2 R' U2 F  (11f)
U2 L F' U L2 F2 U2 F2 L U F  (11f)
U2 L F' U' L' F2 U F' B' U2 B  (11f)
U2 L F' R' F2 R U' L F' L2 F2  (11f)
U2 L F' L2 U F2 U2 F2 L U F  (11f)
U2 L B U L2 B' L' U' F U2 F'  (11f)
U2 L B U' D2 R F D2 L U' B  (11f)
U2 L B U' D2 F R D2 L U' B  (11f)
U2 L B L B' U2 B L B' U L'  (11f)
U2 L B L2 U2 B' U R' L' U' R  (11f)
U2 L B2 D2 F R D2 L' B2 U' L  (11f)
U2 L B2 D2 F' R D2 L' B2 U L  (11f)
U2 L2 F' L' B U2 F L B' U' L'  (11f)
U2 L2 B L F' U2 B' L' F U L  (11f)
U2 L' U R L U' F U2 R2 F' R'  (11f)
U2 L' F2 D2 B R' D2 L F2 U' L'  (11f)
U2 L' F2 D2 B' R' D2 L F2 U L'  (11f)
U2 L' F' U D2 R' B' D2 L' U F'  (11f)
U2 L' F' U D2 B' R' D2 L' U F'  (11f)
U2 L' F' U' L2 F L U B' U2 B  (11f)
U2 L' F' L2 U2 F U' R L U R'  (11f)
U2 L' F' L' F U2 F' L' F U' L  (11f)
U2 L' B U L B2 U' F B U2 F'  (11f)
U2 L' B U' L2 B2 U2 B2 L' U' B'  (11f)
U2 L' B R B2 R' U L' B L2 B2  (11f)
U2 L' B L2 U' B2 U2 B2 L' U' B'  (11f)
U2 L' B' U R' U R B U' L U  (11f)
U2 L' B' U B2 L' U L2 U' L2 B'  (11f)
U2 L' B' U B2 L' D F2 D' B' L2  (11f)
U2 L' B' U B2 L' B' U L2 U' L2  (11f)
U2 L' B' U B2 L' B' D F2 D' L2  (11f)
U2 L' B' R' L2 U L' U2 R U2 B'  (11f)
U2 L' B' R' B' L B U' R U2 B  (11f)
U2 B U2 R B L B R' B' U L'  (11f)
U2 B U2 F R' F' R L U' L' B'  (11f)
U2 B U2 F2 B' U R' F U' R F2  (11f)
U2 B U2 F' B' U F2 R' U' F' R  (11f)
U2 B U2 L U' R L B' R' L2 B'  (11f)
U2 B U2 L U' B R B' L' B' R'  (11f)
U2 B U2 L F R' F' R U' L' B'  (11f)
U2 B U2 B2 R U' B R2 U2 R U'  (11f)
U2 B U2 B' U R F R2 U' F' R'  (11f)
U2 B U2 B' U F' R' U' F2 R F  (11f)
U2 B U2 B' U F' R' F2 U' R F  (11f)
U2 B U' R D2 F L U' D2 B R  (11f)
U2 B U' R D2 L F U' D2 B R  (11f)
U2 B U' L F U F' U L' B' U  (11f)

computation stopped.

''';