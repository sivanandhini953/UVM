

`include "uvm_macros.svh"
import uvm_pkg::*;


class test extends uvm_test;


`uvm_component_utils(test)


function new(string name,uvm_component parent);
super.new(name, parent);


`uvm_fatal(get_name(), "A fatal error has occurred") 
`uvm_warning("TEST", "Warning occured");
`uvm_info("TEST","inoformation severity--1 (info_none)", UVM_NONE);
`uvm_info("TEST","information severity--2 (info_medium)", UVM_MEDIUM);
`uvm_info("TEST","information severity--3 (info_low)", UVM_LOW);
`uvm_error("TEST", "Error 1"); 
`uvm_error("TEST", "Error 2");
  
  
endfunction

endclass

module tb;
initial 
begin
  run_test("test");
end
endmodule
