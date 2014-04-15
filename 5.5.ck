/*
 * Section 5.5
 *
 * A rhythmic analogy of the perceptual fact that multiple
 * harmonics having a whole-number relation make up one
 * perceived pitch.
 */
 
[1,2,3,4,5] @=> int N[];
120 => float tempo;

for (0 => int i; i < N.cap(); i++) {
    spork ~ tap(N[i]);
}

fun void tap (int divider) {
    ModalBar b => dac;
    3 => b.preset;
    while (true) {
        1 => b.noteOn;
        (60/tempo/divider)::second => now;
    }
}

while (true) 1::second => now;