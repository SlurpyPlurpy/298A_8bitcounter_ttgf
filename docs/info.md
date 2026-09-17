<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

**8-bit binary counter**
1. Asynchronous reset: when `rst_n` is LOW, the counter resets to 0. Reset is asynchronous because of the `negedge rst_n` condition in the main loop. 
2. Synchronous load: when `uio_in[0]` is HIGH, the counter is set to the value from `ui_in`
3. Tri-state outputs: the output `uo_out` is in a high-impedance state if `oe_signal` is LOW. Otherwise, it outputs the value of the counter.

## How to test

Verify that the features work and that the counter counts! 

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
