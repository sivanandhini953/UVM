`include "uvm_macros.svh"
import uvm_pkg::*;

class my_component extends uvm_component;
  `uvm_component_utils(my_component);
  
  bit [3:0]a;

  function new(string name = "my_component",uvm_component parent);
    super.new(name,parent);
      `uvm_info("NEW", "creating my_object class", UVM_LOW)
   endfunction

   function void display();
     for(int i=0;i<10;i++)begin
       `uvm_info("randomising",$sformatf("a:%0d",a),UVM_LOW);
     `uvm_info("STATUS","SUCCESS",UVM_LOW);
     a=$urandom();
     end
   endfunction:display

endclass:my_component

module tb();

   my_component mc;
  
   initial begin

     mc = my_component::type_id::create("mc",null);
      mc.display();
     
     
  
   end

endmodule
