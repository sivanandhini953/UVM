class seq_item extends uvm_sequence_item;
  
  rand bit d;
  bit clk;
  bit reset;
  bit q;
  
  
  function new(string name="seq_item");
    super.new(name);
    endfunction 
  
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(d,UVM_DEFAULT);
  `uvm_field_int(q,UVM_DEFAULT);
  `uvm_object_utils_end
  
  
endclass
  
