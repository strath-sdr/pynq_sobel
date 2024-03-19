#include "axi_stream_sobel_filter.h"
#ifndef __linux__
int axi_stream_sobel_filter_CfgInitialize(axi_stream_sobel_filter *InstancePtr, axi_stream_sobel_filter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->axi_stream_sobel_filter_BaseAddress = ConfigPtr->axi_stream_sobel_filter_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
void axi_stream_sobel_filter_thresh_reg_write(axi_stream_sobel_filter *InstancePtr, u32 Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    axi_stream_sobel_filter_WriteReg(InstancePtr->axi_stream_sobel_filter_BaseAddress, 0, Data);
}
u32 axi_stream_sobel_filter_thresh_reg_read(axi_stream_sobel_filter *InstancePtr) {

    u32 Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = axi_stream_sobel_filter_ReadReg(InstancePtr->axi_stream_sobel_filter_BaseAddress, 0);
    return Data;
}
