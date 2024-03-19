-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Coordinate Counter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_coordinate_counter is
  port (
    valid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    x_value : out std_logic_vector( 11-1 downto 0 );
    y_value : out std_logic_vector( 11-1 downto 0 )
  );
end axi_stream_sobel_filter_coordinate_counter;
architecture structural of axi_stream_sobel_filter_coordinate_counter is 
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal y_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal x_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal constant_op_net : std_logic_vector( 11-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
begin
  x_value <= x_counter_op_net;
  y_value <= y_counter_op_net;
  delay1_q_net <= valid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_b20c9911ca 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  relational : entity xil_defaultlib.sysgen_relational_006657e038 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => x_counter_op_net,
    op => relational_op_net
  );
  x_counter : entity xil_defaultlib.axi_stream_sobel_filter_xlcounter_limit 
  generic map (
    cnt_15_0 => 1921,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "axi_stream_sobel_filter_c_counter_binary_v12_0_i0",
    count_limited => 1,
    op_arith => xlUnsigned,
    op_width => 11
  )
  port map (
    rst => "0",
    clr => '0',
    en => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    op => x_counter_op_net
  );
  y_counter : entity xil_defaultlib.axi_stream_sobel_filter_xlcounter_limit 
  generic map (
    cnt_15_0 => 1081,
    cnt_31_16 => 0,
    cnt_47_32 => 0,
    cnt_63_48 => 0,
    core_name0 => "axi_stream_sobel_filter_c_counter_binary_v12_0_i0",
    count_limited => 1,
    op_arith => xlUnsigned,
    op_width => 11
  )
  port map (
    rst => "0",
    clr => '0',
    en => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    op => y_counter_op_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/RGB To Greyscale
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_rgb_to_greyscale is
  port (
    rgb : in std_logic_vector( 24-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    y : out std_logic_vector( 8-1 downto 0 )
  );
end axi_stream_sobel_filter_rgb_to_greyscale;
architecture structural of axi_stream_sobel_filter_rgb_to_greyscale is 
  signal tdata_slice_y_net : std_logic_vector( 24-1 downto 0 );
  signal delay_q_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal red_y_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
begin
  y <= delay_q_net;
  tdata_slice_y_net <= rgb;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.axi_stream_sobel_filter_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 8
  )
  port map (
    en => '1',
    rst => '0',
    d => red_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  red : entity xil_defaultlib.axi_stream_sobel_filter_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 23,
    x_width => 24,
    y_width => 8
  )
  port map (
    x => tdata_slice_y_net,
    y => red_y_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Signal Correction
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_signal_correction is
  port (
    x_value : in std_logic_vector( 11-1 downto 0 );
    y_value : in std_logic_vector( 11-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid : out std_logic_vector( 1-1 downto 0 );
    last : out std_logic_vector( 1-1 downto 0 )
  );
end axi_stream_sobel_filter_signal_correction;
architecture structural of axi_stream_sobel_filter_signal_correction is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal y_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 11-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational2_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 11-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 11-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 11-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal x_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal register2_q_net : std_logic_vector( 11-1 downto 0 );
  signal register3_q_net : std_logic_vector( 11-1 downto 0 );
  signal relational4_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational3_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational5_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical3_y_net : std_logic_vector( 1-1 downto 0 );
begin
  valid <= register_q_net;
  last <= register1_q_net;
  x_counter_op_net <= x_value;
  y_counter_op_net <= y_value;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_e1a3d9a173 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_e1a3d9a173 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_5aa39aef3a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_46b95e700d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_16f3f6d7a7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational_op_net,
    d1 => relational2_op_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_16f3f6d7a7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational1_op_net,
    d1 => relational3_op_net,
    y => logical1_y_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_16f3f6d7a7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => logical_y_net,
    d1 => logical1_y_net,
    y => logical2_y_net
  );
  logical3 : entity xil_defaultlib.sysgen_logical_16f3f6d7a7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => relational4_op_net,
    d1 => relational5_op_net,
    y => logical3_y_net
  );
  register_x0 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 1,
    init_value => b"0"
  )
  port map (
    en => "1",
    rst => "0",
    d => logical3_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 11,
    init_value => b"00000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => x_counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 11,
    init_value => b"00000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => y_counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
  relational : entity xil_defaultlib.sysgen_relational_17d36efd5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register2_q_net,
    b => constant_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_17d36efd5e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register3_q_net,
    b => constant1_op_net,
    op => relational1_op_net
  );
  relational2 : entity xil_defaultlib.sysgen_relational_06a89cfeb9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register2_q_net,
    b => constant2_op_net,
    op => relational2_op_net
  );
  relational3 : entity xil_defaultlib.sysgen_relational_06a89cfeb9 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register3_q_net,
    b => constant3_op_net,
    op => relational3_op_net
  );
  relational4 : entity xil_defaultlib.sysgen_relational_006657e038 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register3_q_net,
    b => constant3_op_net,
    op => relational4_op_net
  );
  relational5 : entity xil_defaultlib.sysgen_relational_006657e038 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => register2_q_net,
    b => constant2_op_net,
    op => relational5_op_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Sobel Edge Filter/Filter Function/Gx Operation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_gx_operation is
  port (
    w00 : in std_logic_vector( 8-1 downto 0 );
    w02 : in std_logic_vector( 8-1 downto 0 );
    w10 : in std_logic_vector( 8-1 downto 0 );
    w12 : in std_logic_vector( 8-1 downto 0 );
    w20 : in std_logic_vector( 8-1 downto 0 );
    w22 : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gx : out std_logic_vector( 12-1 downto 0 )
  );
end axi_stream_sobel_filter_gx_operation;
architecture structural of axi_stream_sobel_filter_gx_operation is 
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 9-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 11-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 10-1 downto 0 );
  signal addsub2_s_net : std_logic_vector( 9-1 downto 0 );
  signal addsub3_s_net : std_logic_vector( 10-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 10-1 downto 0 );
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
begin
  gx <= addsub4_s_net;
  register6_q_net <= w00;
  register9_q_net <= w02;
  register4_q_net <= w10;
  register7_q_net <= w12;
  register2_q_net <= w20;
  register8_q_net <= w22;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register9_q_net,
    b => register6_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 10,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 11,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 11,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 11
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult1_p_net,
    b => cmult_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register8_q_net,
    b => register2_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 9,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 9,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 10,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 10,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 10
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 12,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 12,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 12
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  cmult : entity xil_defaultlib.axi_stream_sobel_filter_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "axi_stream_sobel_filter_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register4_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.axi_stream_sobel_filter_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "axi_stream_sobel_filter_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register7_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult1_p_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Sobel Edge Filter/Filter Function/Gy Operation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_gy_operation is
  port (
    w00 : in std_logic_vector( 8-1 downto 0 );
    w01 : in std_logic_vector( 8-1 downto 0 );
    w02 : in std_logic_vector( 8-1 downto 0 );
    w20 : in std_logic_vector( 8-1 downto 0 );
    w21 : in std_logic_vector( 8-1 downto 0 );
    w22 : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gy : out std_logic_vector( 12-1 downto 0 )
  );
end axi_stream_sobel_filter_gy_operation;
architecture structural of axi_stream_sobel_filter_gy_operation is 
  signal addsub3_s_net : std_logic_vector( 10-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal ce_net : std_logic;
  signal addsub2_s_net : std_logic_vector( 9-1 downto 0 );
  signal cmult_p_net : std_logic_vector( 10-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 11-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 9-1 downto 0 );
  signal cmult1_p_net : std_logic_vector( 10-1 downto 0 );
begin
  gy <= addsub4_s_net;
  register6_q_net <= w00;
  register5_q_net <= w01;
  register9_q_net <= w02;
  register2_q_net <= w20;
  register1_q_net <= w21;
  register8_q_net <= w22;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addsub : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register2_q_net,
    b => register6_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 10,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 11,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i3",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 11,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 11
  )
  port map (
    clr => '0',
    en => "1",
    a => cmult1_p_net,
    b => cmult_p_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub1_s_net
  );
  addsub2 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 8,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 9,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i2",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 9,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 9
  )
  port map (
    clr => '0',
    en => "1",
    a => register8_q_net,
    b => register9_q_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub2_s_net
  );
  addsub3 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 9,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 9,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 10,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i4",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 10,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 10
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub_s_net,
    b => addsub2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub3_s_net
  );
  addsub4 : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 10,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 11,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 12,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i5",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 12,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 12
  )
  port map (
    clr => '0',
    en => "1",
    a => addsub3_s_net,
    b => addsub1_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub4_s_net
  );
  cmult : entity xil_defaultlib.axi_stream_sobel_filter_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "axi_stream_sobel_filter_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register5_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult_p_net
  );
  cmult1 : entity xil_defaultlib.axi_stream_sobel_filter_xlcmult 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 8,
    b_bin_pt => 0,
    c_a_type => 1,
    c_a_width => 8,
    c_b_type => 1,
    c_b_width => 2,
    c_output_width => 10,
    core_name0 => "axi_stream_sobel_filter_mult_gen_v12_0_i3",
    extra_registers => 1,
    multsign => 1,
    overflow => 1,
    p_arith => xlUnsigned,
    p_bin_pt => 0,
    p_width => 10,
    quantization => 1,
    zero_const => 0
  )
  port map (
    clr => '0',
    core_clr => '1',
    en => "1",
    rst => "0",
    a => register1_q_net,
    clk => clk_net,
    ce => ce_net,
    core_clk => clk_net,
    core_ce => ce_net,
    p => cmult1_p_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Sobel Edge Filter/Filter Function
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_filter_function is
  port (
    w00 : in std_logic_vector( 8-1 downto 0 );
    w01 : in std_logic_vector( 8-1 downto 0 );
    w02 : in std_logic_vector( 8-1 downto 0 );
    w10 : in std_logic_vector( 8-1 downto 0 );
    w11 : in std_logic_vector( 8-1 downto 0 );
    w12 : in std_logic_vector( 8-1 downto 0 );
    w20 : in std_logic_vector( 8-1 downto 0 );
    w21 : in std_logic_vector( 8-1 downto 0 );
    w22 : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gx : out std_logic_vector( 12-1 downto 0 );
    gy : out std_logic_vector( 12-1 downto 0 )
  );
end axi_stream_sobel_filter_filter_function;
architecture structural of axi_stream_sobel_filter_filter_function is 
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub4_s_net_x0 : std_logic_vector( 12-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal ce_net : std_logic;
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal register3_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
begin
  gx <= addsub4_s_net_x0;
  gy <= addsub4_s_net;
  register6_q_net <= w00;
  register5_q_net <= w01;
  register9_q_net <= w02;
  register4_q_net <= w10;
  register3_q_net <= w11;
  register7_q_net <= w12;
  register2_q_net <= w20;
  register1_q_net <= w21;
  register8_q_net <= w22;
  clk_net <= clk_1;
  ce_net <= ce_1;
  gx_operation : entity xil_defaultlib.axi_stream_sobel_filter_gx_operation 
  port map (
    w00 => register6_q_net,
    w02 => register9_q_net,
    w10 => register4_q_net,
    w12 => register7_q_net,
    w20 => register2_q_net,
    w22 => register8_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gx => addsub4_s_net_x0
  );
  gy_operation : entity xil_defaultlib.axi_stream_sobel_filter_gy_operation 
  port map (
    w00 => register6_q_net,
    w01 => register5_q_net,
    w02 => register9_q_net,
    w20 => register2_q_net,
    w21 => register1_q_net,
    w22 => register8_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gy => addsub4_s_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Sobel Edge Filter/Filter Window
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_filter_window is
  port (
    pixel : in std_logic_vector( 8-1 downto 0 );
    valid : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    w00 : out std_logic_vector( 8-1 downto 0 );
    w01 : out std_logic_vector( 8-1 downto 0 );
    w02 : out std_logic_vector( 8-1 downto 0 );
    w10 : out std_logic_vector( 8-1 downto 0 );
    w11 : out std_logic_vector( 8-1 downto 0 );
    w12 : out std_logic_vector( 8-1 downto 0 );
    w20 : out std_logic_vector( 8-1 downto 0 );
    w21 : out std_logic_vector( 8-1 downto 0 );
    w22 : out std_logic_vector( 8-1 downto 0 )
  );
end axi_stream_sobel_filter_filter_window;
architecture structural of axi_stream_sobel_filter_filter_window is 
  signal clk_net : std_logic;
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal delay_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal delay_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal register3_q_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal row_buffer_q_net : std_logic_vector( 8-1 downto 0 );
  signal row_buffer1_q_net : std_logic_vector( 8-1 downto 0 );
begin
  w00 <= register6_q_net;
  w01 <= register5_q_net;
  w02 <= register9_q_net;
  w10 <= register4_q_net;
  w11 <= register3_q_net;
  w12 <= register7_q_net;
  w20 <= register2_q_net;
  w21 <= register1_q_net;
  w22 <= register8_q_net;
  delay_q_net <= pixel;
  delay_q_net_x0 <= valid;
  clk_net <= clk_1;
  ce_net <= ce_1;
  register1 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register8_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register1_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register7_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register3_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register9_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register5_q_net
  );
  register6 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => register5_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register6_q_net
  );
  register7 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => row_buffer_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register7_q_net
  );
  register8 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => delay_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register8_q_net
  );
  register9 : entity xil_defaultlib.axi_stream_sobel_filter_xlregister 
  generic map (
    d_width => 8,
    init_value => b"00000000"
  )
  port map (
    rst => "0",
    d => row_buffer1_q_net,
    en => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => register9_q_net
  );
  row_buffer : entity xil_defaultlib.axi_stream_sobel_filter_xldelay 
  generic map (
    latency => 1922,
    reg_retiming => 0,
    reset => 0,
    width => 8
  )
  port map (
    rst => '0',
    d => delay_q_net,
    en => delay_q_net_x0(0),
    clk => clk_net,
    ce => ce_net,
    q => row_buffer_q_net
  );
  row_buffer1 : entity xil_defaultlib.axi_stream_sobel_filter_xldelay 
  generic map (
    latency => 1922,
    reg_retiming => 0,
    reset => 0,
    width => 8
  )
  port map (
    rst => '0',
    d => delay_q_net,
    en => delay_q_net_x0(0),
    clk => clk_net,
    ce => ce_net,
    q => row_buffer1_q_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Sobel Edge Filter/Gradient Approximation
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_gradient_approximation is
  port (
    gx : in std_logic_vector( 12-1 downto 0 );
    gy : in std_logic_vector( 12-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gmag : out std_logic_vector( 8-1 downto 0 )
  );
end axi_stream_sobel_filter_gradient_approximation;
architecture structural of axi_stream_sobel_filter_gradient_approximation is 
  signal addsub4_s_net_x0 : std_logic_vector( 12-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 8-1 downto 0 );
  signal absolute1_op_net : std_logic_vector( 13-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 14-1 downto 0 );
  signal ce_net : std_logic;
  signal absolute_op_net : std_logic_vector( 13-1 downto 0 );
begin
  gmag <= shift_op_net;
  addsub4_s_net_x0 <= gx;
  addsub4_s_net <= gy;
  clk_net <= clk_1;
  ce_net <= ce_1;
  absolute : entity xil_defaultlib.sysgen_abs_16f91e5f7e 
  port map (
    clr => '0',
    a => addsub4_s_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => absolute_op_net
  );
  absolute1 : entity xil_defaultlib.sysgen_abs_16f91e5f7e 
  port map (
    clr => '0',
    a => addsub4_s_net,
    clk => clk_net,
    ce => ce_net,
    op => absolute1_op_net
  );
  addsub : entity xil_defaultlib.axi_stream_sobel_filter_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 0,
    a_width => 13,
    b_arith => xlSigned,
    b_bin_pt => 0,
    b_width => 13,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 14,
    core_name0 => "axi_stream_sobel_filter_c_addsub_v12_0_i6",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 14,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 0,
    s_width => 14
  )
  port map (
    clr => '0',
    en => "1",
    a => absolute_op_net,
    b => absolute1_op_net,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  shift : entity xil_defaultlib.sysgen_shift_dc23a72ef1 
  port map (
    clr => '0',
    ip => addsub_s_net,
    clk => clk_net,
    ce => ce_net,
    op => shift_op_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Sobel Edge Filter/Thresholding
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_thresholding is
  port (
    threshold : in std_logic_vector( 8-1 downto 0 );
    gmag : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    edge : out std_logic_vector( 8-1 downto 0 )
  );
end axi_stream_sobel_filter_thresholding;
architecture structural of axi_stream_sobel_filter_thresholding is 
  signal clk_net : std_logic;
  signal shift_op_net : std_logic_vector( 8-1 downto 0 );
  signal constant_op_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
begin
  edge <= mux_y_net;
  slice_y_net <= threshold;
  shift_op_net <= gmag;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_5c9402d45e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_1e107ab680 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  mux : entity xil_defaultlib.sysgen_mux_e616ea7f02 
  port map (
    clr => '0',
    sel => relational_op_net,
    d0 => constant1_op_net,
    d1 => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_368e04f223 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => shift_op_net,
    b => slice_y_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm/Sobel Edge Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_sobel_edge_filter is
  port (
    threshold : in std_logic_vector( 8-1 downto 0 );
    valid : in std_logic_vector( 1-1 downto 0 );
    y : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    edge : out std_logic_vector( 8-1 downto 0 )
  );
end axi_stream_sobel_filter_sobel_edge_filter;
architecture structural of axi_stream_sobel_filter_sobel_edge_filter is 
  signal register6_q_net : std_logic_vector( 8-1 downto 0 );
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 8-1 downto 0 );
  signal addsub4_s_net : std_logic_vector( 12-1 downto 0 );
  signal register9_q_net : std_logic_vector( 8-1 downto 0 );
  signal register4_q_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal delay_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal addsub4_s_net_x0 : std_logic_vector( 12-1 downto 0 );
  signal register5_q_net : std_logic_vector( 8-1 downto 0 );
  signal shift_op_net : std_logic_vector( 8-1 downto 0 );
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 8-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal register2_q_net : std_logic_vector( 8-1 downto 0 );
  signal register8_q_net : std_logic_vector( 8-1 downto 0 );
  signal register7_q_net : std_logic_vector( 8-1 downto 0 );
  signal register3_q_net : std_logic_vector( 8-1 downto 0 );
begin
  edge <= mux_y_net;
  slice_y_net <= threshold;
  delay_q_net_x0 <= valid;
  delay_q_net <= y;
  clk_net <= clk_1;
  ce_net <= ce_1;
  filter_function : entity xil_defaultlib.axi_stream_sobel_filter_filter_function 
  port map (
    w00 => register6_q_net,
    w01 => register5_q_net,
    w02 => register9_q_net,
    w10 => register4_q_net,
    w11 => register3_q_net,
    w12 => register7_q_net,
    w20 => register2_q_net,
    w21 => register1_q_net,
    w22 => register8_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gx => addsub4_s_net_x0,
    gy => addsub4_s_net
  );
  filter_window : entity xil_defaultlib.axi_stream_sobel_filter_filter_window 
  port map (
    pixel => delay_q_net,
    valid => delay_q_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    w00 => register6_q_net,
    w01 => register5_q_net,
    w02 => register9_q_net,
    w10 => register4_q_net,
    w11 => register3_q_net,
    w12 => register7_q_net,
    w20 => register2_q_net,
    w21 => register1_q_net,
    w22 => register8_q_net
  );
  gradient_approximation : entity xil_defaultlib.axi_stream_sobel_filter_gradient_approximation 
  port map (
    gx => addsub4_s_net_x0,
    gy => addsub4_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gmag => shift_op_net
  );
  thresholding : entity xil_defaultlib.axi_stream_sobel_filter_thresholding 
  port map (
    threshold => slice_y_net,
    gmag => shift_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    edge => mux_y_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Algorithm
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_algorithm is
  port (
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 24-1 downto 0 );
    axi_lite_threshold : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 )
  );
end axi_stream_sobel_filter_algorithm;
architecture structural of axi_stream_sobel_filter_algorithm is 
  signal delay_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal delay_q_net : std_logic_vector( 8-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal thresh_reg_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal y_counter_op_net : std_logic_vector( 11-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal tdata_slice_y_net : std_logic_vector( 24-1 downto 0 );
  signal x_counter_op_net : std_logic_vector( 11-1 downto 0 );
begin
  m_axis_tvalid <= register_q_net;
  m_axis_tdata <= mux_y_net;
  m_axis_tlast <= register1_q_net;
  logical_y_net <= s_axis_tvalid;
  tdata_slice_y_net <= s_axis_tdata;
  thresh_reg_net <= axi_lite_threshold;
  clk_net <= clk_1;
  ce_net <= ce_1;
  coordinate_counter : entity xil_defaultlib.axi_stream_sobel_filter_coordinate_counter 
  port map (
    valid => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    x_value => x_counter_op_net,
    y_value => y_counter_op_net
  );
  rgb_to_greyscale : entity xil_defaultlib.axi_stream_sobel_filter_rgb_to_greyscale 
  port map (
    rgb => tdata_slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    y => delay_q_net
  );
  signal_correction : entity xil_defaultlib.axi_stream_sobel_filter_signal_correction 
  port map (
    x_value => x_counter_op_net,
    y_value => y_counter_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid => register_q_net,
    last => register1_q_net
  );
  sobel_edge_filter : entity xil_defaultlib.axi_stream_sobel_filter_sobel_edge_filter 
  port map (
    threshold => slice_y_net,
    valid => delay_q_net_x0,
    y => delay_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    edge => mux_y_net
  );
  delay : entity xil_defaultlib.axi_stream_sobel_filter_xldelay 
  generic map (
    latency => 3,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net_x0
  );
  delay1 : entity xil_defaultlib.axi_stream_sobel_filter_xldelay 
  generic map (
    latency => 7,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => delay_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  slice : entity xil_defaultlib.axi_stream_sobel_filter_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 7,
    x_width => 32,
    y_width => 8
  )
  port map (
    x => thresh_reg_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Master FIFO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_master_fifo is
  port (
    tvalid_out : in std_logic_vector( 1-1 downto 0 );
    tdata_out : in std_logic_vector( 8-1 downto 0 );
    tlast_out : in std_logic_vector( 1-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 8-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    tready_out : out std_logic_vector( 1-1 downto 0 )
  );
end axi_stream_sobel_filter_master_fifo;
architecture structural of axi_stream_sobel_filter_master_fifo is 
  signal fifo_full_net : std_logic;
  signal fifo_dout_net : std_logic_vector( 9-1 downto 0 );
  signal fifo_af_net : std_logic;
  signal fifo_empty_net : std_logic;
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal concat1_y_net : std_logic_vector( 9-1 downto 0 );
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal tlast_slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal tdata_slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
begin
  m_axis_tvalid <= inverter4_op_net;
  m_axis_tdata <= tdata_slice_y_net;
  m_axis_tlast <= tlast_slice_y_net;
  tready_out <= inverter2_op_net;
  register_q_net <= tvalid_out;
  mux_y_net <= tdata_out;
  register1_q_net <= tlast_out;
  m_axis_tready_net <= m_axis_tready;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat1 : entity xil_defaultlib.sysgen_concat_8a047224b3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => mux_y_net,
    in1 => register1_q_net,
    y => concat1_y_net
  );
  fifo : entity xil_defaultlib.axi_stream_sobel_filter_xlfifogen_u 
  generic map (
    core_name0 => "axi_stream_sobel_filter_fifo_generator_i0",
    data_count_width => 11,
    data_width => 9,
    extra_registers => 0,
    has_ae => 0,
    has_af => 1,
    has_rst => false,
    ignore_din_for_gcd => false,
    percent_full_width => 1
  )
  port map (
    en => '1',
    rst => '0',
    din => concat1_y_net,
    we => register_q_net(0),
    re => m_axis_tready_net(0),
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_dout_net,
    empty => fifo_empty_net,
    full => fifo_full_net,
    af => fifo_af_net
  );
  inverter2 : entity xil_defaultlib.sysgen_inverter_2a5ed4eea9 
  port map (
    clr => '0',
    ip(0) => fifo_af_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  inverter4 : entity xil_defaultlib.sysgen_inverter_2a5ed4eea9 
  port map (
    clr => '0',
    ip(0) => fifo_empty_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter4_op_net
  );
  tdata_slice : entity xil_defaultlib.axi_stream_sobel_filter_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 8,
    x_width => 9,
    y_width => 8
  )
  port map (
    x => fifo_dout_net,
    y => tdata_slice_y_net
  );
  tlast_slice : entity xil_defaultlib.axi_stream_sobel_filter_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 9,
    y_width => 1
  )
  port map (
    x => fifo_dout_net,
    y => tlast_slice_y_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT/Slave FIFO
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_slave_fifo is
  port (
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 24-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    tready_in : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tvalid_in : out std_logic_vector( 1-1 downto 0 );
    tdata_in : out std_logic_vector( 24-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end axi_stream_sobel_filter_slave_fifo;
architecture structural of axi_stream_sobel_filter_slave_fifo is 
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 24-1 downto 0 );
  signal inverter2_op_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal tdata_slice_y_net : std_logic_vector( 24-1 downto 0 );
  signal concat_y_net : std_logic_vector( 25-1 downto 0 );
  signal ce_net : std_logic;
  signal fifo_dout_net : std_logic_vector( 25-1 downto 0 );
  signal fifo_empty_net : std_logic;
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal fifo_full_net : std_logic;
begin
  tvalid_in <= logical_y_net;
  tdata_in <= tdata_slice_y_net;
  s_axis_tready <= inverter1_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  convert1_dout_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  inverter2_op_net_x0 <= tready_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_6de099e6bb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => convert1_dout_net,
    in1 => s_axis_tlast_net,
    y => concat_y_net
  );
  fifo : entity xil_defaultlib.axi_stream_sobel_filter_xlfifogen_u 
  generic map (
    core_name0 => "axi_stream_sobel_filter_fifo_generator_i1",
    data_count_width => 11,
    data_width => 25,
    extra_registers => 0,
    has_ae => 0,
    has_af => 0,
    has_rst => false,
    ignore_din_for_gcd => false,
    percent_full_width => 1
  )
  port map (
    en => '1',
    rst => '0',
    din => concat_y_net,
    we => s_axis_tvalid_net(0),
    re => inverter2_op_net_x0(0),
    clk => clk_net,
    ce => ce_net,
    we_ce => ce_net,
    re_ce => ce_net,
    dout => fifo_dout_net,
    empty => fifo_empty_net,
    full => fifo_full_net
  );
  inverter1 : entity xil_defaultlib.sysgen_inverter_2a5ed4eea9 
  port map (
    clr => '0',
    ip(0) => fifo_full_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter1_op_net
  );
  inverter2 : entity xil_defaultlib.sysgen_inverter_2a5ed4eea9 
  port map (
    clr => '0',
    ip(0) => fifo_empty_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter2_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_16f3f6d7a7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter2_op_net,
    d1 => inverter2_op_net_x0,
    y => logical_y_net
  );
  tdata_slice : entity xil_defaultlib.axi_stream_sobel_filter_xlslice 
  generic map (
    new_lsb => 1,
    new_msb => 24,
    x_width => 25,
    y_width => 24
  )
  port map (
    x => fifo_dout_net,
    y => tdata_slice_y_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter/DUT
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_dut is
  port (
    axi_lite_threshold : in std_logic_vector( 32-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end axi_stream_sobel_filter_dut;
architecture structural of axi_stream_sobel_filter_dut is 
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal thresh_reg_net : std_logic_vector( 32-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 32-1 downto 0 );
  signal tlast_slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal inverter2_op_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net : std_logic;
  signal register1_q_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal tdata_slice_y_net_x0 : std_logic_vector( 24-1 downto 0 );
  signal tdata_slice_y_net : std_logic_vector( 8-1 downto 0 );
  signal register_q_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 8-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 24-1 downto 0 );
begin
  m_axis_tvalid <= inverter4_op_net;
  m_axis_tdata <= convert_dout_net;
  m_axis_tlast <= tlast_slice_y_net;
  s_axis_tready <= inverter1_op_net;
  thresh_reg_net <= axi_lite_threshold;
  s_axis_tvalid_net <= s_axis_tvalid;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  m_axis_tready_net <= m_axis_tready;
  clk_net <= clk_1;
  ce_net <= ce_1;
  algorithm : entity xil_defaultlib.axi_stream_sobel_filter_algorithm 
  port map (
    s_axis_tvalid => logical_y_net,
    s_axis_tdata => tdata_slice_y_net_x0,
    axi_lite_threshold => thresh_reg_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tvalid => register_q_net,
    m_axis_tdata => mux_y_net,
    m_axis_tlast => register1_q_net
  );
  master_fifo : entity xil_defaultlib.axi_stream_sobel_filter_master_fifo 
  port map (
    tvalid_out => register_q_net,
    tdata_out => mux_y_net,
    tlast_out => register1_q_net,
    m_axis_tready => m_axis_tready_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tvalid => inverter4_op_net,
    m_axis_tdata => tdata_slice_y_net,
    m_axis_tlast => tlast_slice_y_net,
    tready_out => inverter2_op_net
  );
  slave_fifo : entity xil_defaultlib.axi_stream_sobel_filter_slave_fifo 
  port map (
    s_axis_tvalid => s_axis_tvalid_net,
    s_axis_tdata => convert1_dout_net,
    s_axis_tlast => s_axis_tlast_net,
    tready_in => inverter2_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tvalid_in => logical_y_net,
    tdata_in => tdata_slice_y_net_x0,
    s_axis_tready => inverter1_op_net
  );
  convert : entity xil_defaultlib.axi_stream_sobel_filter_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 8,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => tdata_slice_y_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.axi_stream_sobel_filter_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 32,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 24,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => s_axis_tdata_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
end structural;
-- Generated from Simulink block axi_stream_sobel_filter_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_struct is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    thresh_reg : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 )
  );
end axi_stream_sobel_filter_struct;
architecture structural of axi_stream_sobel_filter_struct is 
  signal s_axis_tdata_net : std_logic_vector( 32-1 downto 0 );
  signal m_axis_tready_net : std_logic_vector( 1-1 downto 0 );
  signal inverter4_op_net : std_logic_vector( 1-1 downto 0 );
  signal thresh_reg_net : std_logic_vector( 32-1 downto 0 );
  signal tlast_slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal ce_net : std_logic;
  signal s_axis_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal s_axis_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal inverter1_op_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 32-1 downto 0 );
begin
  m_axis_tdata <= convert_dout_net;
  m_axis_tlast <= tlast_slice_y_net;
  m_axis_tready_net <= m_axis_tready;
  m_axis_tvalid <= inverter4_op_net;
  s_axis_tdata_net <= s_axis_tdata;
  s_axis_tlast_net <= s_axis_tlast;
  s_axis_tready <= inverter1_op_net;
  s_axis_tvalid_net <= s_axis_tvalid;
  thresh_reg_net <= thresh_reg;
  clk_net <= clk_1;
  ce_net <= ce_1;
  dut : entity xil_defaultlib.axi_stream_sobel_filter_dut 
  port map (
    axi_lite_threshold => thresh_reg_net,
    s_axis_tvalid => s_axis_tvalid_net,
    s_axis_tdata => s_axis_tdata_net,
    s_axis_tlast => s_axis_tlast_net,
    m_axis_tready => m_axis_tready_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    m_axis_tvalid => inverter4_op_net,
    m_axis_tdata => convert_dout_net,
    m_axis_tlast => tlast_slice_y_net,
    s_axis_tready => inverter1_op_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter_default_clock_driver is
  port (
    axi_stream_sobel_filter_sysclk : in std_logic;
    axi_stream_sobel_filter_sysce : in std_logic;
    axi_stream_sobel_filter_sysclr : in std_logic;
    axi_stream_sobel_filter_clk1 : out std_logic;
    axi_stream_sobel_filter_ce1 : out std_logic
  );
end axi_stream_sobel_filter_default_clock_driver;
architecture structural of axi_stream_sobel_filter_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => axi_stream_sobel_filter_sysclk,
    sysce => axi_stream_sobel_filter_sysce,
    sysclr => axi_stream_sobel_filter_sysclr,
    clk => axi_stream_sobel_filter_clk1,
    ce => axi_stream_sobel_filter_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity axi_stream_sobel_filter is
  port (
    m_axis_tready : in std_logic_vector( 1-1 downto 0 );
    s_axis_tdata : in std_logic_vector( 32-1 downto 0 );
    s_axis_tlast : in std_logic_vector( 1-1 downto 0 );
    s_axis_tvalid : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    axi_stream_sobel_filter_aresetn : in std_logic;
    axi_stream_sobel_filter_s_axi_awaddr : in std_logic;
    axi_stream_sobel_filter_s_axi_awvalid : in std_logic;
    axi_stream_sobel_filter_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    axi_stream_sobel_filter_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    axi_stream_sobel_filter_s_axi_wvalid : in std_logic;
    axi_stream_sobel_filter_s_axi_bready : in std_logic;
    axi_stream_sobel_filter_s_axi_araddr : in std_logic;
    axi_stream_sobel_filter_s_axi_arvalid : in std_logic;
    axi_stream_sobel_filter_s_axi_rready : in std_logic;
    m_axis_tdata : out std_logic_vector( 32-1 downto 0 );
    m_axis_tlast : out std_logic_vector( 1-1 downto 0 );
    m_axis_tvalid : out std_logic_vector( 1-1 downto 0 );
    s_axis_tready : out std_logic_vector( 1-1 downto 0 );
    axi_stream_sobel_filter_s_axi_awready : out std_logic;
    axi_stream_sobel_filter_s_axi_wready : out std_logic;
    axi_stream_sobel_filter_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    axi_stream_sobel_filter_s_axi_bvalid : out std_logic;
    axi_stream_sobel_filter_s_axi_arready : out std_logic;
    axi_stream_sobel_filter_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    axi_stream_sobel_filter_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    axi_stream_sobel_filter_s_axi_rvalid : out std_logic
  );
end axi_stream_sobel_filter;
architecture structural of axi_stream_sobel_filter is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "axi_stream_sobel_filter,sysgen_core_2020_2,{,compilation=IP Catalog,block_icon_display=Default,family=zynq,part=xc7z020,speed=-1,package=clg400,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=10,system_simulink_period=1e-08,waveform_viewer=0,axilite_interface=1,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.0208525,abs=2,addsub=13,cmult=7,concat=2,constant=7,convert=2,counter=2,delay=5,fifo=2,inv=4,logical=5,mux=1,register=14,relational=8,shift=1,slice=8,}";
  signal thresh_reg : std_logic_vector( 32-1 downto 0 );
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
  signal clk_net : std_logic;
begin
  axi_stream_sobel_filter_axi_lite_interface : entity xil_defaultlib.axi_stream_sobel_filter_axi_lite_interface 
  port map (
    axi_stream_sobel_filter_s_axi_awaddr => axi_stream_sobel_filter_s_axi_awaddr,
    axi_stream_sobel_filter_s_axi_awvalid => axi_stream_sobel_filter_s_axi_awvalid,
    axi_stream_sobel_filter_s_axi_wdata => axi_stream_sobel_filter_s_axi_wdata,
    axi_stream_sobel_filter_s_axi_wstrb => axi_stream_sobel_filter_s_axi_wstrb,
    axi_stream_sobel_filter_s_axi_wvalid => axi_stream_sobel_filter_s_axi_wvalid,
    axi_stream_sobel_filter_s_axi_bready => axi_stream_sobel_filter_s_axi_bready,
    axi_stream_sobel_filter_s_axi_araddr => axi_stream_sobel_filter_s_axi_araddr,
    axi_stream_sobel_filter_s_axi_arvalid => axi_stream_sobel_filter_s_axi_arvalid,
    axi_stream_sobel_filter_s_axi_rready => axi_stream_sobel_filter_s_axi_rready,
    axi_stream_sobel_filter_aresetn => axi_stream_sobel_filter_aresetn,
    axi_stream_sobel_filter_aclk => clk,
    thresh_reg => thresh_reg,
    axi_stream_sobel_filter_s_axi_awready => axi_stream_sobel_filter_s_axi_awready,
    axi_stream_sobel_filter_s_axi_wready => axi_stream_sobel_filter_s_axi_wready,
    axi_stream_sobel_filter_s_axi_bresp => axi_stream_sobel_filter_s_axi_bresp,
    axi_stream_sobel_filter_s_axi_bvalid => axi_stream_sobel_filter_s_axi_bvalid,
    axi_stream_sobel_filter_s_axi_arready => axi_stream_sobel_filter_s_axi_arready,
    axi_stream_sobel_filter_s_axi_rdata => axi_stream_sobel_filter_s_axi_rdata,
    axi_stream_sobel_filter_s_axi_rresp => axi_stream_sobel_filter_s_axi_rresp,
    axi_stream_sobel_filter_s_axi_rvalid => axi_stream_sobel_filter_s_axi_rvalid,
    clk => clk_net
  );
  axi_stream_sobel_filter_default_clock_driver : entity xil_defaultlib.axi_stream_sobel_filter_default_clock_driver 
  port map (
    axi_stream_sobel_filter_sysclk => clk_net,
    axi_stream_sobel_filter_sysce => '1',
    axi_stream_sobel_filter_sysclr => '0',
    axi_stream_sobel_filter_clk1 => clk_1_net,
    axi_stream_sobel_filter_ce1 => ce_1_net
  );
  axi_stream_sobel_filter_struct : entity xil_defaultlib.axi_stream_sobel_filter_struct 
  port map (
    m_axis_tready => m_axis_tready,
    s_axis_tdata => s_axis_tdata,
    s_axis_tlast => s_axis_tlast,
    s_axis_tvalid => s_axis_tvalid,
    thresh_reg => thresh_reg,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    m_axis_tdata => m_axis_tdata,
    m_axis_tlast => m_axis_tlast,
    m_axis_tvalid => m_axis_tvalid,
    s_axis_tready => s_axis_tready
  );
end structural;
