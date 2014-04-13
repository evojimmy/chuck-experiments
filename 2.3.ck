/* 
 * Section 2.3
 * Perception of the repetition rate
 *
 * With tempo being 180 bpm, two streams of pulses different in timbre will always
 * be perceived with a rate of 3/sec, wherever the right pulse is placed between
 * two left pulses.
 *
 * But if the two streams share a same timbre, the offset between two streams 
 * plays a vital role that determines perceived repetition rate. 
 * With offset=0.5 (every right pulse is exactly placed at the center between 
 * two left pulses) the rate is perceived as 6/sec. A deviation in offset about 
 * 0.06 (offset=0.44 or 0.56) sounds ambiguous -- we hardly decide whether the
 * rate is 3/sec or 6/sec. With larger deviation the repetition rate is perceived
 * 3/sec.
 *
 *
 * Section 2.4
 * Octave jump
 *
 * Change the tempo to 440*60 to create a sense of pitch (A-440). And let the two streams
 * of pulses have the same timbre. With offset=0 we definitely perceive the pitch 440Hz,
 * and with offset=0.5 we perceive 880Hz. Try offset with 0.5087 and 0.5088 -- a sudden
 * change in pitch will take place. The principle is similar to perception of
 * repetition rate described above, but the mis-centering range should be extremely
 * narrow to be perceived as 880Hz.
 */

440*60 => float tempo;
0.5088 => float offset;
7 => int left_preset; // tin can
8 => int right_preset; // wood

///////////////////////////////

Gain master => dac;
ModalBar left => master;
ModalBar right => master;

left_preset => left.preset;
right_preset => right.preset;

spork ~ tap(left);
offset*(60.0/tempo)::second => now;
spork ~ tap(right);

fun void tap (ModalBar b) {
    (60.0/tempo)::second => dur d;
    while (true) {
        1 => b.noteOn;
        d => now;
    }
}

while (true) 1::second => now;