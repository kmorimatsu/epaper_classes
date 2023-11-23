/*

	This file was copied from Pi Pico examples and modified by Katsumi.

/**
 * Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <stdio.h>
#include "pico/stdlib.h"
#include "machikania.h"
#include "e-Paper/EPD_2in13_V2.h"
#include "e-Paper/EPD_2in13_V3.h"
#include "e-Paper/EPD_2in13_V4.h"
#include "e-Paper/EPD_2in13b_V3.h"
#include "e-Paper/EPD_2in13b_V4.h"
#include "e-Paper/EPD_2in13bc.h"
#include "e-Paper/EPD_2in13d.h"
#include "e-Paper/EPD_2in66.h"
#include "e-Paper/EPD_2in66b.h"
#include "e-Paper/EPD_2in7.h"
#include "e-Paper/EPD_2in7_V2.h"
#include "e-Paper/EPD_2in9_V2.h"
#include "e-Paper/EPD_2in9b_V3.h"
#include "e-Paper/EPD_2in9bc.h"
#include "e-Paper/EPD_2in9d.h"
#include "e-Paper/EPD_3in7.h"
#include "e-Paper/EPD_4in2.h"
#include "e-Paper/EPD_4in2_V2.h"
#include "e-Paper/EPD_4in2b_V2.h"
#include "e-Paper/EPD_5in65f.h"
#include "e-Paper/EPD_5in83_V2.h"
#include "e-Paper/EPD_5in83b_V2.h"
#include "e-Paper/EPD_7in5_V2.h"
#include "e-Paper/EPD_7in5b_V2.h"

int main() {
	int i;
	machikania_init();
	
	DEV_Module_Init();
	DEV_Module_Exit();
	
	UBYTE Mode;
	UBYTE *Image;
	UBYTE *blackimage;
	UBYTE *ryimage;
	UBYTE *blackImage;
	UBYTE *redImage;
	UBYTE *ImageBlack;
	UBYTE*ImageRed;
	UBYTE color;
	UWORD Xstart;
	UWORD Ystart;
	UWORD Xend;
	UWORD Yende;
	UWORD Yend;
	UWORD X_start;
	UWORD Y_start;
	UWORD X_end;
	UWORD Y_end;
	UBYTE *image;
	UWORD xstart;
	UWORD ystart;
	UWORD image_width;
	UWORD image_heigh;
	EPD_2IN13_V2_Init(Mode);
	EPD_2IN13_V2_Clear();
	EPD_2IN13_V2_Display(Image);
	EPD_2IN13_V2_DisplayPart(Image);
	EPD_2IN13_V2_DisplayPartBaseImage(Image);
	EPD_2IN13_V2_Sleep();
	EPD_2in13_V3_Init();
	EPD_2in13_V3_Clear();
	EPD_2in13_V3_Display(Image);
	EPD_2in13_V3_Display_Base(Image);
	EPD_2in13_V3_Display_Partial(Image);
	EPD_2in13_V3_Sleep();
	EPD_2in13_V4_Init();
	EPD_2in13_V4_Init_Fast();
	EPD_2in13_V4_Clear();
	EPD_2in13_V4_Clear_Black();
	EPD_2in13_V4_Display(Image);
	EPD_2in13_V4_Display_Fast(Image);
	EPD_2in13_V4_Display_Base(Image);
	EPD_2in13_V4_Display_Partial(Image);
	EPD_2in13_V4_Sleep();
	EPD_2IN13B_V3_Init();
	EPD_2IN13B_V3_Clear();
	EPD_2IN13B_V3_Display(blackimage, ryimage);
	EPD_2IN13B_V3_Sleep();
	EPD_2IN13B_V4_Init();
	EPD_2IN13B_V4_Clear();
	EPD_2IN13B_V4_Display(blackImage, redImage);
	EPD_2IN13B_V4_Sleep();
	EPD_2IN13BC_Init();
	EPD_2IN13BC_Clear();
	EPD_2IN13BC_Display(blackimage, ryimage);
	EPD_2IN13BC_Sleep();
	EPD_2IN13D_Init();
	EPD_2IN13D_Clear();
	EPD_2IN13D_Display(Image);
	EPD_2IN13D_DisplayPart(Image);
	EPD_2IN13D_Sleep();
	EPD_2IN66_Init();
	EPD_2IN66_Init_Partial();
	EPD_2IN66_Clear();
	EPD_2IN66_Display(Image);
	EPD_2IN66_Sleep();
	EPD_2IN66B_Init();
	EPD_2IN66B_Display(ImageBlack, ImageRed);
	EPD_2IN66B_Clear();
	EPD_2IN66B_Sleep();
	EPD_2IN7_Init();
	EPD_2IN7_Clear();
	EPD_2IN7_Display(Image);
	EPD_2IN7_Sleep();
	EPD_2IN7_Init_4Gray();
	EPD_2IN7_4GrayDisplay(Image);
	EPD_2IN7_V2_Init();
	EPD_2IN7_V2_Init_Fast();
	EPD_2IN7_V2_Init_4GRAY();
	EPD_2IN7_V2_Clear();
	EPD_2IN7_V2_Display(Image);
	EPD_2IN7_V2_Display_Fast(Image);
	EPD_2IN7_V2_Display_Base(Image);
	EPD_2IN7_V2_Display_Base_color(color);
	EPD_2IN7_V2_Display_Partial(Image, Xstart, Ystart, Xend, Yende);
	EPD_2IN7_V2_4GrayDisplay(Image);
	EPD_2IN7_V2_Sleep();
	EPD_2IN9_V2_Init();
	EPD_2IN9_V2_Gray4_Init();
	EPD_2IN9_V2_Clear();
	EPD_2IN9_V2_Display(Image);
	EPD_2IN9_V2_Display_Base(Image);
	EPD_2IN9_V2_4GrayDisplay(Image);
	EPD_2IN9_V2_Display_Partial(Image);
	EPD_2IN9_V2_Sleep();
	EPD_2IN9B_V3_Init();
	EPD_2IN9B_V3_Clear();
	EPD_2IN9B_V3_Display(blackimage, ryimage);
	EPD_2IN9B_V3_Sleep();
	EPD_2IN9BC_Init();
	EPD_2IN9BC_Clear();
	EPD_2IN9BC_Display(blackimage, ryimage);
	EPD_2IN9BC_Sleep();
	EPD_2IN9D_Init();
	EPD_2IN9D_Clear();
	EPD_2IN9D_Display(Image);
	EPD_2IN9D_DisplayPart(Image);
	EPD_2IN9D_Sleep();
	EPD_3IN7_4Gray_Clear();
	EPD_3IN7_4Gray_Init();
	EPD_3IN7_4Gray_Display(Image);
	EPD_3IN7_1Gray_Clear();
	EPD_3IN7_1Gray_Init();
	EPD_3IN7_1Gray_Display(Image);
	EPD_3IN7_1Gray_Display_Part(Image, Xstart, Ystart, Xend, Yend);
	EPD_3IN7_Sleep();
	EPD_4IN2_Init_Fast();
	EPD_4IN2_Init_Partial();
	EPD_4IN2_Clear();
	EPD_4IN2_Display(Image);
	EPD_4IN2_Sleep();
	EPD_4IN2_PartialDisplay(X_start,Y_start,X_end,Y_end, Image);
	EPD_4IN2_Init_4Gray();
	EPD_4IN2_4GrayDisplay(Image);
	EPD_4IN2_V2_Init();
	EPD_4IN2_V2_Init_Fast(Mode);
	EPD_4IN2_V2_Init_4Gray();
	EPD_4IN2_V2_Clear();
	EPD_4IN2_V2_Display(Image);
	EPD_4IN2_V2_Display_Fast(Image);
	EPD_4IN2_V2_Display_4Gray(Image);
	EPD_4IN2_V2_PartialDisplay(Image, Xstart, Ystart, Xend, Yend);
	EPD_4IN2_V2_Sleep();
	EPD_4IN2B_V2_Init();
	EPD_4IN2B_V2_Clear();
	EPD_4IN2B_V2_Display(blackimage, ryimage);
	EPD_4IN2B_V2_Sleep();
	EPD_5IN65F_Clear(color);
	EPD_5IN65F_Sleep();
	EPD_5IN65F_Display(image);
	EPD_5IN65F_Init();
	EPD_5IN65F_Display_part(image, xstart, ystart, image_width, image_heigh);
	EPD_5in83_V2_Init();
	EPD_5in83_V2_Clear();
	EPD_5in83_V2_Display(Image);
	EPD_5in83_V2_Sleep();
	EPD_5IN83B_V2_Init();
	EPD_5IN83B_V2_Clear();
	EPD_5IN83B_V2_Display(blackimage, ryimage);
	EPD_5IN83B_V2_Sleep();
	EPD_7IN5_V2_Init();
	EPD_7IN5_V2_Clear();
	EPD_7IN5_V2_ClearBlack();
	EPD_7IN5_V2_Display(blackimage);
	EPD_7IN5_V2_Sleep();
	EPD_7IN5B_V2_Init();
	EPD_7IN5B_V2_Clear();
	EPD_7IN5B_V2_ClearRed();
	EPD_7IN5B_V2_ClearBlack();
	EPD_7IN5B_V2_Display(blackimage, ryimage);
	EPD_7IN5B_V2_Sleep();
	
	return 0;
}
