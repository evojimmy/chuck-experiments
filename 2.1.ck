/*
 *  Table 2.1
 *  Relation between Repetition Rate and Perceived Sound
 *  |----------------------------|---------------------------
 *  | Impulse Repetition Rate    |     Perceived Sound
 *  |----------------------------|---------------------------
 *  | Less then about 20/sec     |   Separate impulses having slow to fast tempo
 *  | Roughly 20/sec to 150/sec  |   Buzz
 *  | Above about 100/sec        |   Tone of progressively higher pitch
 *  |---------------------------------------------------------
 */

100::ms => dur repetition_rate;

///////////////////////////////

ModalBar b => Gain g => dac;
3 => b.preset;

float freq;
spork ~ random_freq(2::second);

while (true) {
    freq => b.freq;
    1.0 => b.noteOn;
    
    repetition_rate => now;
}

fun void random_freq (dur my_time) {
    while (true) {
        Math.random2f(200.0, 1000.0) => freq;
        <<< freq >>>;
        my_time => now;
    }
}