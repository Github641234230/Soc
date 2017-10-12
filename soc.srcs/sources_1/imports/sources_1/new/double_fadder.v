`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/30 19:51:58
// Design Name: 
// Module Name: double_fadder
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


module double_fadder (a, b, sub, rm, clk, clrn, e, s);

    input [63:0] a, b;
    input sub; // 0 : add; 1 : sub
    input [1:0] rm; // round mode
    input clk, clrn, e;
    output [63:0] s;
    
    // alignment stage
    wire a_is_inf_nan;
    wire [51:0] a_inf_nan_frac;
    wire a_sign;
    wire [10:0] a_exp;
    wire a_op_sub;
    wire [52:0] a_large_frac;
    wire [55:0] a_small_frac;
    double_add_align alignment (a, b, sub, a_is_inf_nan, a_inf_nan_frac, a_sign, a_exp, a_op_sub, a_large_frac, a_small_frac);
    
    // reg between alignment and calculation
    wire [1:0] c_rm;
    wire c_is_inf_nan;
    wire [51:0] c_inf_nan_frac;
    wire c_sign;
    wire [10:0] c_exp;
    wire c_op_sub;
    wire [52:0] c_large_frac;
    wire [55:0] c_small_frac;
    double_reg_align_cal reg_ac (rm, a_is_inf_nan, a_inf_nan_frac, a_sign, a_exp, a_op_sub, a_large_frac, a_small_frac,
                          clk, clrn, e,
                          c_rm, c_is_inf_nan, c_inf_nan_frac, c_sign, c_exp, c_op_sub, c_large_frac, c_small_frac);
    
    // calculation stage
    wire [56:0] c_frac;
    double_fadd_cal calculation (c_op_sub, c_large_frac, c_small_frac, c_frac);
    
    // reg between calculation and normalization
    wire [1:0] n_rm;
    wire n_is_inf_nan;
    wire [51:0] n_inf_nan_frac;
    wire n_sign;
    wire [10:0] n_exp;
    wire [56:0] n_frac;
    double_reg_cal_norm reg_cn (c_rm, c_is_inf_nan, c_inf_nan_frac, c_sign, c_exp, c_frac,
                         clk, clrn, e,
                         n_rm, n_is_inf_nan, n_inf_nan_frac, n_sign, n_exp, n_frac);
    
    // normalization stage
    double_add_norm normalization (n_rm, n_is_inf_nan, n_inf_nan_frac, n_sign, n_exp, n_frac, s);

endmodule
