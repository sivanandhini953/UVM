class seq_item extends uvm_sequence_item;
 
  
  rand bit reset;
  rand bit d;
  bit q;
  
   `uvm_object_utils_begin(seq_item)
  `uvm_field_int(reset,UVM_DEFAULT)
  `uvm_field_int(d,UVM_DEFAULT)
  `uvm_field_int(q,UVM_DEFAULT)
  `uvm_object_utils_end
  
  function new(string name="seq_item");
    super.new(name);
    
  endfunction
 
  constraint c1{reset dist {1:=1,0:=99};}
  constraint c2{d dist {0:=50,1:=50};}
  

endclass
