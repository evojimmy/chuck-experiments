/*
 * Section 5.9 Exercise 2
 *
 * The acoustic perception of 8 composite sounds.
 *
 */
 
[
 [392, 1176, 1568],
 [1176, 1568, 1960],
 [880, 1320, 2200],
 [1482, 1976, 0],
 [392, 784, 1960],
 [494, 1482, 2470],
 [440, 1760, 2200],
 [1172, 1465, 0]
] @=> int melody[][];

Gain master => dac;
SinOsc b1 => master;
SinOsc b2 => master;
SinOsc b3 => master;

0.3 => master.gain;

for (0 => int i; i < melody.cap(); i++) {
    melody[i][0] => b1.freq;
    melody[i][1] => b2.freq;
    melody[i][2] => b3.freq;
    1::second => now;
}