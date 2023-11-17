#include "machikania.h"

#define LIB_SPI_SPI 1
#define LIB_SPI_SPIREAD 2
#define LIB_SPI_SPIWRITE 3
#define LIB_SPI_SPIREADDATA 4
#define LIB_SPI_SPIWRITEDATA 5
#define LIB_SPI_SPISWAPDATA 6

void machikania_DEV_SPI_WriteByte(unsigned char Value){
	unsigned int r1[1];
	r1[0]=Value;
	machikania_lib(1,(int)&r1[0],LIB_SPI_SPIWRITE,LIB_SPI);
}

void machikania_DEV_SPI_Write_nByte(unsigned char* pData, unsigned int Len){
	unsigned int r1[2];
	r1[0]=(int)pData;
	r1[1]=Len;
	machikania_lib(2,(int)&r1[0],LIB_SPI_SPIWRITEDATA,LIB_SPI);	
}
