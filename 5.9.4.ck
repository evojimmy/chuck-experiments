/* 
 * Section 5.9 Exercise 4
 *
 * Simulate the popping sound of flute using three harmonics.
 *
 */


// Simulate flute sound
[349, 349*2, 349*3] @=> int flute_consonant[];
[349, 705, 1058] @=> int flute_popping[];
[0.12, 0.03, 0.1] @=> float gains[];

Gain master => dac;
0.4 => master.gain;

SinOsc ss[gains.cap()];
float step[gains.cap()];
50 => int steps;

for (0 => int i; i < gains.cap(); i++) {
    ss[i] => Gain g => master;
    flute_consonant[i] => ss[i].freq;
    gains[i] => g.gain;
    (flute_popping[i] - flute_consonant[i]) / (steps + 0.0) => step[i];
}


while (true) {
    2::second => now;
    for (0 => int i; i < steps; i++) {
        for (0 => int j; j < gains.cap(); j++) {
            (ss[j].freq() + step[j]) => ss[j].freq;
            <<< ss[1].freq() >>>;
        }
        (1.0/steps)::second => now;
    }
    2::second => now;
    for (0 => int i; i < steps; i++) {
        for (0 => int j; j < gains.cap(); j++) {
            (ss[j].freq() - step[j]) => ss[j].freq;
            <<< ss[1].freq() >>>;
        }
        (1.0/steps)::second => now;
    }
}