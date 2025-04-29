`include "uvm_macros.svh";
import uvm_pkg::*;

class my_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(my_seq_item);
  
  rand bit [3:0]a;
  
  constraint c{a>5;}
  
  
  function new(string name="my_seq_item");
    
    super.new(name);
    
    `uvm_info("NEW","randomising under process",UVM_LOW);
    
  endfunction
  
  
  function void display();
    
    //for(int i=0;i<10;i++)begin
      
      //a.randomize();
      
      `uvm_info("RANDOMIZED",$sformatf("value of a:%0d",a),UVM_LOW);
      
   // end
    
  endfunction
  
  
endclass


module tb();
  
  my_seq_item s;
  
  initial begin
    s=my_seq_item::type_id::create("s");
    repeat(10)begin
    void'(s.randomize);
    
    s.display();
    end
    
  end
endmodule


UVM_INFO testbench.sv(17) @ 0: reporter@@s [NEW] randomising under process
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:9
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:14
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:9
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:13
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:13
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:15
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:11
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:15
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:12
UVM_INFO testbench.sv(28) @ 0: reporter@@s [RANDOMIZED] value of a:7
      
  
  
