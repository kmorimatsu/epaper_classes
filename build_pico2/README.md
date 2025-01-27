# epaper_classes
MachiKania ePaper classes

## C files
The C source code files in "../c" directory are used to construct C binary. The objects must be build here as files, "epaper.hex", "epaper.dis" and "epaper.elf.map".  See "../c_convert.php" source code ("configclass" class).

## How to compile
cmake and make. Add "-DPICO_BOARD=pico2 -DPICO_PLATFORM=rp2350-arm-s" parameters to execute cmake, then execute make.
