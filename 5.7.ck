/*
 * Section 5.7
 *
 * Remove some harmonics from a composite sound.
 *
 * Removing high harmonics does not affect the pitch perception.
 *
 * Removing low harmonics does neither affect pitch perception.
 * Even the 5th and 6th harmonics are left, there is still a
 * sense of original pitch.
 */

[1, 2, 3, 4, 5, 6] @=> int harmonics[];
// First, remove high harmonics by commenting the line above and
// uncommenting the following lines in order:
//[1, 2, 3, 4, 5] @=> int harmonics[];
//[1, 2, 3, 4] @=> int harmonics[];
//[1, 2, 3] @=> int harmonics[];
//[1, 2] @=> int harmonics[];


// Then remove low harmonics:
//[2, 3, 4, 5, 6] @=> int harmonics[];
//[3, 4, 5, 6] @=> int harmonics[];
//[4, 5, 6] @=> int harmonics[];
//[5, 6] @=> int harmonics[];


Gain master => dac;
0.1 => master.gain;

220 => int fundamental_freq;

for (0 => int i; i < harmonics.cap(); i++) {
    SinOsc s => master;
    fundamental_freq * harmonics[i] => s.freq;
}

while (true) 1::second => now;
