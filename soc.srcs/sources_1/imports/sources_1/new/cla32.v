`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/29 16:46:32
// Design Name: 
// Module Name: cla32
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

module cla32 (a, b, ci, s, co);
  input [31:0] a, b;
  input ci;
  output [31:0] s;
  output co;
  wire g_out, p_out;
  cla_32 cla (a, b, ci, g_out, p_out, s);
  assign co = g_out | p_out & ci;
endmodule