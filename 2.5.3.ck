/*
 * Exercise 2.5.3
 * An apparent Waltz rhythm with SAME_SOURCE == 0
 * but not with SAME_SOURCE == 1
 */
 
1 => int SAME_SOURCE; 

///////////////////////////////

ModalBar left => dac;
ModalBar right => dac;

if (SAME_SOURCE) {
    3 => left.preset => right.preset;
} else {
    7 => left.preset;
    3 => right.preset;
}

180 => float tempo;
spork ~ tap(left);
(60.0/tempo/3.0)::second => now;
spork ~ tap(right);
(60.0/tempo/3.0)::second => now;
spork ~ tap(right);


fun void tap (ModalBar b) {
    (60.0/tempo)::second => dur d;
    while (true) {
        1 => b.noteOn;
        d => now;
    }
}

while (true) 1::second => now;