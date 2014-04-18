#
# Section 5.9 Exercise 2
#
# Visual perception of the melody.
#

from pylab import *

if __name__ == '__main__':
    melody = [
        [392, 1176, 1568],
        [1176, 1568, 1960],
        [880, 1320, 2200],
        [1482, 1976, 0],
        [392, 784, 1960],
        [494, 1482, 2470],
        [440, 1760, 2200],
        [1172, 1465, 0]
    ]
    xs = []
    ys = []
    for index, m in enumerate(melody):
        xs += [index] * len(m)
        ys += m
    plot(xs, ys, 'ro')
    show()
