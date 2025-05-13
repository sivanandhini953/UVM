`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "test.sv"

module tb_top;
  bit clk;
  bit reset;
  always #2 clk = ~clk;
  
  initial begin
    //clk = 0;
    reset = 1;
    #5; 
    reset = 0;
  end
  intf vif(clk, reset);
  
  adder DUT(.clk(vif.clk),.reset(vif.reset),.in1(vif.in1),.in2(vif.in2),.out(vif.out));
  
  initial begin
   
    uvm_config_db #(virtual intf)::set(uvm_root::get(), "*", "vif", vif);
  end
  initial begin
    run_test("base_test");
  end
endmodule
