class seq_item extends uvm_sequence_item;
  
  rand bit [3:0]in1,in2;
  bit [4:0]out;
  //bit reset;
  //bit clk;
  
  function new(string name="seq_item");
    super.new(name);
  endfunction
  
  
  `uvm_object_utils_begin(seq_item);
  `uvm_field_int(in1,UVM_ALL_ON);
  `uvm_field_int(in2,UVM_ALL_ON);
  `uvm_object_utils_end
  
  constraint c1{in1<100;in2<100;}
  

endclass
