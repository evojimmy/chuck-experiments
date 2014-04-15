/*
 * Section 5.3
 *
 * According to Table 5.1 Frequencies of a Set of Church Bells,
 * we simulate the bells' sound coarsely in ChucK by diminishing
 * sinusoids.
 *
 * Figure 5.7 in Section 5.6 plots the frequencies on a line graph,
 * which would help perceive the sounds.
 *
 * Furthermore, changing amplitudes of frequency components does 
 * not affect pitch perception of the bells.
 */


// Select bell (1~5):
1 => int bell;
[1.0, 1.0, 1.0, 1.0, 1.0] @=> float amplitude[];


[
 [278, 467, 620, 786, 1046],
 [286, 458, 590, 832, 982],
 [267, 532, 641, 764, 1071],
 [275, 512, 620, 796, 1026],
 [272, 544, 622, 819, 1033]
] @=> int B[][];


ADSR env => Gain master => dac;
(0.05::second, 0.1::second, 0.8, 2.2::second) => env.set;
0.1 => master.gain;

bell - 1 => int b;

for (0 => int i; i < B[b].cap(); i++) {
    SinOsc s => Gain g => env;
    B[b][i] => s.freq;
    amplitude[i] => g.gain;
}

while (true) {
    1 => env.keyOn;
    0.2::second => now;
    1 => env.keyOff;
    2.0::second => now;
}