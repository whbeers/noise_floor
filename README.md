# Noise Floor interface board collection

This is set of interface boards to speed effect pedal development, continuing my efforts to learn PCB design with [KiCAD](https://www.kicad.org/).

The first board is an IO (mono audio) and 9VDC center negative power board designed to fit in a 125B standard enclosure.

The second board simplifies effect bypass via a 3PDT switch adapter.

Boards are connected using four-circuit Molex PicoBlade connectors. Current and future pedal designs will be updated to utilize the dual PicoBlade IO connectors instead instead of soldered wires.

![Front render](renders/front.png)
![Back render](renders/back.png)

[Schematic](hardware/NoiseFloor_schematic_v0.01.pdf)

## Credit

The idea and specific bypass circuit is inspired by many manufacturers of utility PCBs and well-known circuits for 3PDT-based effect bypass, notable [PedalPCB's 3PDT breakout](https://www.pedalpcb.com/product/3pdt/), augmented to suit my needs.

## Versioning

My pcb designs utilize the following versioning scheme (I'll add to this as I produce more revisions):
 - v0.0XX: A candidate design that has not yet been produced and tested.
 - v0.XX: A design that has been produced, tested, and any initial errors addressed.

The current version of the  Noise Floor interface board is v0.01.

## Name
*The name Noise Floor is a reflection of the function of the board (a substrate for pedals and bypass circuit) and security nerdery.*
