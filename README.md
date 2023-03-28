# Noise Floor interface board collection

This is set of interface boards to speed effect pedal development, continuing my efforts to learn PCB design with [KiCAD](https://www.kicad.org/).

### IO PCB
The first board is an audio input and power board, featuring:
  - Switched DC barrel jack supporting either a 9VDC center negative supply or 9V battery
  - Mono audio jacks w/ switched input circuit (ring/ground shorted to sleeve on insertion)
  - Basic power input protection

The IO PCB is designed to fit in a standard 125B enclosure.

### Switch PCB
The second board simplifies effect bypass via a 3PDT switch adapter with an LED indicator.

### UX PCB (experimental)
The third and newest (experimental) board, intended to connect to an effects board using two 25-position [Amphenol "Conan Lite"](https://www.amphenol-cs.com/product-series/conan-lite-1-00mm.html) board-to-board connectors, providing a standard superset of potentiometers and switches. 

The current UX board supports six potentiometers and three SPDT switches. Each potentiometer can also be adjusted using optional parallel resistors (SMD 1206) to  tweak the taper and total resistance.

### Connectivity (cabled)
IO, Effect, and Switch boards are connected using four-circuit [Molex PicoBlade](https://www.molex.com/molex/products/family/picoblade?parentKey=wire_to_board_connectors) connectors.

Headers are labelled symmetrically from the perspective of the IO board:
 - **S**1 on IO Board <-> **S**1 on **S**witch Board
 - **S**2 on IO Board <-> **S**2 on **S**witch Board
 - **E**1 on IO Board <-> **E**1 on **E**ffect Board

### Connectivity (board-to-board)
The effect and UX boards are connected using [Amphenol "Conan Lite"](https://www.amphenol-cs.com/product-series/conan-lite-1-00mm.html) board-to-board connectors. Only a single UX board variety currently exists, supporting a superset of six potentiometers and three SPDT switches. As the UX board is in the experimental/proof-of-concept phase, the pin assignment should be considered preliminary and subject to change.

Current connector allocation:
 - 6x Potentiometers x 3 (CCW, Wiper, CW) = 18
 - 3x SPDT switches x 3 (NO, COM, NC) = 9
 - 4x Reserved for ground
 - Total used: 31
 - Remaining for expansion: 19
 
Ideas for expansion:
 - Allocate connector positions for a single DPDT switch (+3, reusing 3 from an existing SPDT)
 - Incorporate linear potentiometers into an alternate IO board
 - Allocate at least 12 positions for "flexible use" (enough to support a 4PDT switch)
 - Allocate positions to drive (RGB?) LEDs with standardized current-limiting resistors

![Front render](renders/front.png)
![Back render](renders/back.png)
![Schematic SVG](schematics/noise_floor-latest.svg)
[Schematic PDF](schematics/noise_floor-latest.pdf)

## Credit

The original idea and specific bypass circuit is inspired by many manufacturers of utility PCBs and well-known circuits for 3PDT-based effect bypass, notably [PedalPCB's 3PDT breakout](https://www.pedalpcb.com/product/3pdt/), augmented to suit my needs.

Thanks as always to the folks on the [freestompboxes.org](https://www.freestompboxes.org/) forum for feedback and suggestions.

Potentiometer, 3PDT footswitch, and DC barrel jack 3D models courtesy [Vasily Kashirin](https://grabcad.com/vasily.kashirin-1).

SPDT toggle switch 3D model courtesy [Stephanie Schwecke](https://grabcad.com/stephanie.schwecke-1).

Conan Lite footprints adapted from the 51-position footprints available from SnapEDA: [Header](https://www.snapeda.com/parts/10162582-1134151LF/Amphenol%20ICC%20(FCI)/view-part/), [Receptacle](https://www.snapeda.com/parts/10162581-3134151LF/Amphenol%20ICC%20(FCI)/view-part/).([Additional license details](hardware/SnapEDA_Licensing.txt)). 3D models courtesy Amphenol.

*I am not affiliated with any of the brands, sites, or products named in this overview.*

## Future plans

 - Build an IO board that includes a TRS expression pedal input (started this way, but found it hard to fit in a 125B enclosure)
 - Support stereo operation via relays, optoisolators, or a "millenium" switch

## Versioning

My pcb designs utilize the following versioning scheme (I'll add to this as I produce more revisions):
 - v0.0XX: A candidate design that has not yet been produced and tested.
 - v0.XX: A design that has been produced, tested, and any initial errors addressed.

## Name
*The name Noise Floor is a reflection of the function of the board (a substrate for pedals and bypass circuit) and security nerdery.*
