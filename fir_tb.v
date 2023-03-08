`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2023 09:44:21
// Design Name: 
// Module Name: fir_tb
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


module fir_tb;
parameter N=16;
reg clk,reset;
reg [N-1:0]data_in;
wire [N-1:0]data_out;
fir_filter dut(clk,reset,data_in,data_out);
initial
$readmemb("signal.data",RAMM);
reg [N-1:0] RAMM [31:0];
initial
clk=0;
always
#10 clk=~clk;
always@(posedge clk)
data_in<=RAMM[Address];
reg [4:0]Address;
initial
Address=1;
always@(posedge clk)
begin
if(Address==31)
Address=0;
else
Address=Address+1;
end
endmodule
