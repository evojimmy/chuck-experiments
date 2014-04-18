/* 
 * Section 5.9 Exercise 3
 *
 * Vary the strengths of odd-numbered harmonics of flute.
 *
 */
 
// Simulate flute sound
[0.12, 0.03, 0.1, 0.01, 0.01, 0.002] @=> float freqs[];

440 => int base_freq;
Gain flute_gain[freqs.cap()];
Gain master => dac;
Gain odd => master;
Gain even => master;
2 => master.gain;

for (0 => int i; i < freqs.cap(); i++) {
    SinOsc s => flute_gain[i];
    if (i % 2 == 0) flute_gain[i] => odd; else flute_gain[i] => even;
    base_freq * i => s.freq;
    freqs[i] => flute_gain[i].gain;
}

while (true) {
    2::second => now;
    while (odd.gain() > 0) {
        (odd.gain()-0.02) => odd.gain;
        <<< odd.gain() >>>;
        0.05::second => now;
    }   
    2::second => now;
    while (odd.gain() < 1) {
        (odd.gain()+0.02) => odd.gain;
        <<< odd.gain() >>>;
        0.05::second => now;
    }
}