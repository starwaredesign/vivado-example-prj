
#ifndef SYSTEMVERSION_H
#define SYSTEMVERSION_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xil_io.h"
#include "xstatus.h"

#define SYSTEMVERSION_FPGA_VERSION_OFFSET  0
#define SYSTEMVERSION_BOARD_VERSION_OFFSET 4

#define SYSTEMVERSION_BOARD_TYPE_OFFSET    		 16
#define SYSTEMVERSION_BOARD_TYPE_MASK      		 0xFFFF0000U 
#define SYSTEMVERSION_BOARD_REV_OFFSET      	 0
#define SYSTEMVERSION_BOARD_REV_MASK       		 0x0000FFFFU 

#define SYSTEMVERSION_FPGA_VERSION_MAJ_OFFSET    24
#define SYSTEMVERSION_FPGA_VERSION_MAJ_MASK      0xFF000000U 	
#define SYSTEMVERSION_FPGA_VERSION_MIN_OFFSET    16
#define SYSTEMVERSION_FPGA_VERSION_MIN_MASK      0x00FF0000U 	
#define SYSTEMVERSION_FPGA_VERSION_BUILD_OFFSET  0
#define SYSTEMVERSION_FPGA_VERSION_BUILD_MASK    0x0000FFFFU 	

/**
 *
 * Read a value from a system version register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the system version device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 SYSTEMVERSION_ReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define SystemVersion_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes *****************************/

u32 SystemVersion_GetBoardType(u32 BaseAddress);

u32 SystemVersion_GetBoardRevision(u32 BaseAddress);

u32 SystemVersion_GetFpgaVersionMajor(u32 BaseAddress);

u32 SystemVersion_GetFpgaVersionMinor(u32 BaseAddress);

u32 SystemVersion_GetFpgaVersionBuild(u32 BaseAddress);

#endif // SYSTEMVERSION_H
