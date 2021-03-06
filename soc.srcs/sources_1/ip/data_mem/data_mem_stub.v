// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Tue Sep 26 14:35:33 2017
// Host        : admin running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub F:/VivadoProject/soc/soc.srcs/sources_1/ip/data_mem/data_mem_stub.v
// Design      : data_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_1,Vivado 2015.4" *)
module data_mem(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[3:0],addra[13:0],dina[31:0],douta[31:0]" */;
  input clka;
  input [3:0]wea;
  input [13:0]addra;
  input [31:0]dina;
  output [31:0]douta;
endmodule
