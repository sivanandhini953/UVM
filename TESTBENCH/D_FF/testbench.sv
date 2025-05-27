`include "uvm_macros.svh"
import uvm_pkg::*;


`include "interface.sv"
`include "test.sv"

module tb_top;
  
   intf intff();
  
      d_ff DUT(
    .clk(intff.clk),
    .reset(intff.reset),
    .d(intff.d),
    .q(intff.q)
  );
  
  initial begin 
    intff.clk=0;
    uvm_config_db #(virtual intf)::set(uvm_root::get(), "*", "vif", intff);
     run_test("test");
  end
  
  always #5 intff.clk=~intff.clk;
  
  initial begin
    //$monitor($time, "clk = %d", intff.clk);
  #500 $finish;
  end
   initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  end
 endmodule
