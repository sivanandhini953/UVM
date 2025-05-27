class seq2 extends uvm_sequence#(seq_item);
  `uvm_object_utils(seq2)
  
 
    
  
  function new(string name="seq2");
    super.new(name);
   // `uvm_info("sequence_CLASS","constructor",UVM_MEDIUM);
  endfunction
  
  
 virtual task body();
   
   req= seq_item::type_id::create("req");
   
   
    //repeat(10) begin
       
       start_item(req);
       void'(req.randomize());
       req.reset=0;
   `uvm_info("SEQ2","reset=0",UVM_NONE);
       req.print();
       finish_item(req);
       
    /*wait_for_grant();
       
      void'(seqi.randomize());
       `uvm_info("SEQUENCE",$sformatf("Randomized input d:%b",seqi.d),UVM_NONE);
       send_request(seqi);
      wait_for_item_done();
       get_response(seqi);
       `uvm_info("SEQUENCE","sequence completed",UVM_NONE);*/
   // end 
  endtask 
endclass
