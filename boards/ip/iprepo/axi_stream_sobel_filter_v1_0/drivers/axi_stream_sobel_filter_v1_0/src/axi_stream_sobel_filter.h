#ifndef AXI_STREAM_SOBEL_FILTER__H
#define AXI_STREAM_SOBEL_FILTER__H
#ifdef __cplusplus
extern "C" {
#endif
/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "axi_stream_sobel_filter_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 axi_stream_sobel_filter_BaseAddress;
} axi_stream_sobel_filter_Config;
#endif
/**
* The axi_stream_sobel_filter driver instance data. The user is required to
* allocate a variable of this type for every axi_stream_sobel_filter device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 axi_stream_sobel_filter_BaseAddress;
    u32 IsReady;
} axi_stream_sobel_filter;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define axi_stream_sobel_filter_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define axi_stream_sobel_filter_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define axi_stream_sobel_filter_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define axi_stream_sobel_filter_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif
/************************** Function Prototypes *****************************/
#ifndef __linux__
int axi_stream_sobel_filter_Initialize(axi_stream_sobel_filter *InstancePtr, u16 DeviceId);
axi_stream_sobel_filter_Config* axi_stream_sobel_filter_LookupConfig(u16 DeviceId);
int axi_stream_sobel_filter_CfgInitialize(axi_stream_sobel_filter *InstancePtr, axi_stream_sobel_filter_Config *ConfigPtr);
#else
int axi_stream_sobel_filter_Initialize(axi_stream_sobel_filter *InstancePtr, const char* InstanceName);
int axi_stream_sobel_filter_Release(axi_stream_sobel_filter *InstancePtr);
#endif
/**
* Write to thresh_reg gateway of axi_stream_sobel_filter. Assignments are LSB-justified.
*
* @param	InstancePtr is the thresh_reg instance to operate on.
* @param	Data is value to be written to gateway thresh_reg.
*
* @return	None.
*
* @note    .
*
*/
void axi_stream_sobel_filter_thresh_reg_write(axi_stream_sobel_filter *InstancePtr, u32 Data);
/**
* Read from thresh_reg gateway of axi_stream_sobel_filter. Assignments are LSB-justified.
*
* @param	InstancePtr is the thresh_reg instance to operate on.
*
* @return	u32
*
* @note    .
*
*/
u32 axi_stream_sobel_filter_thresh_reg_read(axi_stream_sobel_filter *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
