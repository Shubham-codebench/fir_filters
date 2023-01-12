`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2023 12:06:14
// Design Name: 
// Module Name: fir_filter
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
/////////////////////////////////////////////////////////////////////////////////
module fir_filter(clk,rst,data_in,data_out);
input clk,rst;
input [15:0]data_in;
output reg [15:0]data_out;
wire [5:0] b0=6'b100000;
wire [5:0] b1=6'b100000;
wire [5:0] b2=6'b100000;
wire [5:0] b3=6'b100000;
wire [15:0] x1,x2,x3;
Dff Dff0(clk,rst,data_in,x1);
Dff Dff1(clk,rst,x1,x2);
Dff Dff2(clk,rst,x2,x3);
wire [15:0] s0,s1,s2,s3;
assign s0=(data_in)&b0;
assign s1=(x1&b1);
assign s2=(x2&b2);
assign s3=(x3&b3);
wire [15:0] addfinal;
assign addfinal=s0|s1|s2|s3;
always@(posedge clk)
data_out<=addfinal;
endmodule
module Dff(clk,rst,data_in,data_delayed);
input clk,rst;
input [15:0]data_in;
output reg [15:0]data_delayed;
always@(posedge clk,posedge rst)
begin
if(rst)
data_delayed<=0;
else
data_delayed<=data_in;
end
endmodule

