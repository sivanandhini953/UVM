// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "test.sv"




module dff_tb();

  intf dif();

initial begin
dif.clk = 0;
dif.reset = 0;
end

always #10 dif.clk = ~dif.clk;

  dff dut (.d(dif.d), .q(dif.q), .clk(dif.clk),.reset(dif.reset));

initial begin
$dumpfile("dump.vcd");
$dumpvars;
end

initial begin
  uvm_config_db #(virtual intf):: set(null, "*", "vif", dif);
end
  initial begin 
run_test("test");
end

endmodule
