# epaper_classes
MachiKania ePaper classes

## classes directory
The "classes" directory contains EPD classes for MachiKania.

## images directory
The "images" directory contains image classes for MachiKania.

## example
Following is an example code for using Pico-ePaper-2.13-B:
```console
useclass E2_13bV4,i2in13b4
e=new(E2_13bV4,0,3,1,2): rem DC, CS, RST, and BUSY pins
e.EPD_2IN13B_V4_INIT()
e.EPD_2IN13B_V4_CLEAR()
b=i2in13b4::gImage_2in13b_V4b()
r=i2in13b4::gImage_2in13b_V4r()
e.EPD_2IN13B_V4_DISPLAY(b,r)
```
Note that you need to assign DC, CS, RST, and BUSY pins as parameters of NEW function.

## C files
The C source code files in "c" directory are used to construct C binary. The objects must be constructed in "build" directory as files, "epaper.hex", "epaper.dis" and "epaper.elf.map".  See c_convert.php source code ("configclass" class).

## PHP files
The PHP files in this directory are used to construct MachiKania classes in "classes" directory.

## Licenses
The licenses of files are described in each files. The license is either LGPL 2.1, BSD-3-Clause, or Waveshare license.