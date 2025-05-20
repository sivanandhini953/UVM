class seq extends uvm_sequence #(seq_item);
  
  `uvm_object_utils(seq)
  
  seq_item tr;
  
  function new(string name="seq");
    super.new(name);
  endfunction
  
  
  virtual task body();
    
    tr=seq_item::type_id::create("tr");
    
    repeat(10)
      begin
        
        wait_for_grant();
        void'(tr.randomize());
        send_request(tr);
      wait_for_item_done();
        
        `uvm_info("GEN",$sformatf("data to DRV: d=%0d",tr.d),UVM_NONE);
        
      end
  endtask
endclass
