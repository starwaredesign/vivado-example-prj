

/***************************** Include Files *******************************/
#include "systemversion.h"

/************************** Function Definitions ***************************/

/****************************************************************************/
/**
*
* This function returns board type.
*
* @param    BaseAddress is the base address of the system version device.
* @return	Board type.
*
* @note		None.
*
*****************************************************************************/
u32 SystemVersion_GetBoardType(u32 BaseAddress)
{
	u32 RegValue;

	
	RegValue = SystemVersion_ReadReg(BaseAddress, 
		(u32)SYSTEMVERSION_BOARD_VERSION_OFFSET);

	return (RegValue & SYSTEMVERSION_BOARD_TYPE_MASK) >> 
		SYSTEMVERSION_BOARD_TYPE_OFFSET;
}

/****************************************************************************/
/**
*
* This function returns board revision.
*
* @param    BaseAddress is the base address of the system version device.
* @return	Board revision.
*
* @note		None.
*
*****************************************************************************/
u32 SystemVersion_GetBoardRevision(u32 BaseAddress)
{
	u32 RegValue;

	
	RegValue = SystemVersion_ReadReg(BaseAddress, 
		(u32)SYSTEMVERSION_BOARD_VERSION_OFFSET);

	return (RegValue & SYSTEMVERSION_BOARD_REV_MASK) >> 
		SYSTEMVERSION_BOARD_REV_OFFSET;
}

/****************************************************************************/
/**
*
* This function returns FPGA major revision.
*
* @param    BaseAddress is the base address of the system version device.
* @return	FPGA major revision.
*
* @note		None.
*
*****************************************************************************/
u32 SystemVersion_GetFpgaVersionMajor(u32 BaseAddress)
{
	u32 RegValue;

	
	RegValue = SystemVersion_ReadReg(BaseAddress, 
		(u32)SYSTEMVERSION_FPGA_VERSION_OFFSET);

	return (RegValue & SYSTEMVERSION_FPGA_VERSION_MAJ_MASK) >> 
		SYSTEMVERSION_FPGA_VERSION_MAJ_OFFSET;
}

/****************************************************************************/
/**
*
* This function returns FPGA minor revision.
*
* @param    BaseAddress is the base address of the system version device.
* @return	FPGA minor revision.
*
* @note		None.
*
*****************************************************************************/
u32 SystemVersion_GetFpgaVersionMinor(u32 BaseAddress)
{
	u32 RegValue;

	
	RegValue = SystemVersion_ReadReg(BaseAddress, 
		(u32)SYSTEMVERSION_FPGA_VERSION_OFFSET);

	return (RegValue & SYSTEMVERSION_FPGA_VERSION_MIN_MASK) >> 
		SYSTEMVERSION_FPGA_VERSION_MIN_OFFSET;
}

/****************************************************************************/
/**
*
* This function returns FPGA build number.
*
* @param    BaseAddress is the base address of the system version device.
* @return	FPGA build number.
*
* @note		None.
*
*****************************************************************************/
u32 SystemVersion_GetFpgaVersionBuild(u32 BaseAddress)
{
	u32 RegValue;

	
	RegValue = SystemVersion_ReadReg(BaseAddress, 
		(u32)SYSTEMVERSION_FPGA_VERSION_OFFSET);

	return (RegValue & SYSTEMVERSION_FPGA_VERSION_BUILD_MASK) >> 
		SYSTEMVERSION_FPGA_VERSION_BUILD_OFFSET;
}

