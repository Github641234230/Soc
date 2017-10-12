`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/30 19:53:13
// Design Name: 
// Module Name: double_fadd_cal
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module double_fadd_cal (c_op_sub, c_large_frac, c_small_frac, c_frac);

    input c_op_sub;
    input [52:0] c_large_frac;
    input [55:0] c_small_frac;
    output [56:0] c_frac;
    
    wire [56:0] aligned_large_frac = {1'b0, c_large_frac, 3'b000};
    wire [56:0] aligned_small_frac = {1'b0, c_small_frac};
    
    assign c_frac = c_op_sub ?
                    aligned_large_frac - aligned_small_frac :
                    aligned_large_frac + aligned_small_frac;

endmodule
