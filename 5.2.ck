/*
 * Section 5.2
 *
 * Simulate the sound of tower bells using ModalBar with preset=1.
 * Six frequencies are assigned to six tower bells. When the bells
 * are striked simultaneously, we hear an ambiguous pitch -- some
 * people assign the pitch to between F3 and F#3, but some assign
 * to C5.
 */
 
Gain master =>  dac;

[8, 180, 525, 530, 1064, 1772] @=> int F[];

for (0 => int i; i < F.cap(); i++) {
    ModalBar b => master;
    F[i] => b.freq;
    1 => b.preset;
    spork ~ start(b);
}

fun void start (ModalBar b) {
    while (true) {
        1 => b.noteOn;
        1::second => now;
    }
}

while (true) 1::second => now;