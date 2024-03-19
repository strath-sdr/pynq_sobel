proc generate {drv_handle} {
    xdefine_include_file $drv_handle "xparameters.h" "axi_stream_sobel_filter" "NUM_INSTANCES" "DEVICE_ID" "C_AXI_STREAM_SOBEL_FILTER_S_AXI_BASEADDR" "C_AXI_STREAM_SOBEL_FILTER_S_AXI_HIGHADDR" 
    xdefine_config_file $drv_handle "axi_stream_sobel_filter_g.c" "axi_stream_sobel_filter" "DEVICE_ID" "C_AXI_STREAM_SOBEL_FILTER_S_AXI_BASEADDR" 
    xdefine_canonical_xpars $drv_handle "xparameters.h" "axi_stream_sobel_filter" "DEVICE_ID" "C_AXI_STREAM_SOBEL_FILTER_S_AXI_BASEADDR" "C_AXI_STREAM_SOBEL_FILTER_S_AXI_HIGHADDR" 

}