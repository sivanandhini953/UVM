class base_seq extends uvm_sequence#(seq_item);
  seq_item seq;
  
  `uvm_object_utils(base_seq)
  
  function new(string name="base_seq");
    super.new(name);
  endfunction
  
  
  task body();
    `uvm_info(get_type_name(),"base_seq:inside_body",UVM_LOW);
    
    `uvm_do(seq);
  endtask 
endclass
