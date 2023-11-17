cmake_minimum_required(VERSION 3.12)

# Pull in SDK (must be before project)
include(pico_sdk_import.cmake)

project(lcd-lib C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize the SDK
pico_sdk_init()

add_definitions(-O0)

if (TARGET tinyusb_device)
	add_executable(epaper
			main.c
			machikania.c
			machikania_spi.c
			e-Paper/DEV_Config.c
			e-Paper/EPD_2in13_V2.c
			e-Paper/EPD_2in13_V3.c
			e-Paper/EPD_2in13_V4.c
			e-Paper/EPD_2in13b_V3.c
			e-Paper/EPD_2in13b_V4.c
			e-Paper/EPD_2in13bc.c
			e-Paper/EPD_2in13d.c
			e-Paper/EPD_2in66.c
			e-Paper/EPD_2in66b.c
			e-Paper/EPD_2in7.c
			e-Paper/EPD_2in7_V2.c
			e-Paper/EPD_2in9_V2.c
			e-Paper/EPD_2in9b_V3.c
			e-Paper/EPD_2in9bc.c
			e-Paper/EPD_2in9d.c
			e-Paper/EPD_3in7.c
			e-Paper/EPD_4in2.c
			e-Paper/EPD_4in2_V2.c
			e-Paper/EPD_4in2b_V2.c
			e-Paper/EPD_5in65f.c
			e-Paper/EPD_5in83_V2.c
			e-Paper/EPD_5in83b_V2.c
			e-Paper/EPD_7in5_V2.c
			e-Paper/EPD_7in5b_V2.c
		)

	# Pull in our pico_stdlib which aggregates commonly used features
	target_link_libraries(epaper 
		pico_stdlib
		hardware_spi
	)

	# enable usb output, disable uart output
	#pico_enable_stdio_usb(epaper 1)
	pico_enable_stdio_usb(epaper 0)
	pico_enable_stdio_uart(epaper 0)

	# create map/bin/hex/uf2 file etc.
	pico_add_extra_outputs(epaper)

elseif(PICO_ON_DEVICE)
	message(WARNING "not building hello_usb because TinyUSB submodule is not initialized in the SDK")
endif()
