 class driver extends uvm_driver#(seq_item);
   `uvm_component_utils(driver)
   event done;
  virtual intf vif;
  
  
  
  function new(string name="driver",uvm_component parent=null);

   super.new(name,parent);
    
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    req=seq_item::type_id::create("req");
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
    `uvm_fatal(get_type_name(),"not set at top level");
    
  endfunction
  
  task run_phase(uvm_phase phase);
    
    forever begin
     
       seq_item_port.get_next_item(req);
       
    
       
   	vif.reset = req.reset;
      vif.d = req.d;
       
      
      
       `uvm_info("drv",$sformatf("Driver to vif reset=%b , d:%b,  q:%b",vif.reset,vif.d,vif.q),UVM_NONE);
      seq_item_port.item_done();
       
       repeat(2) @(posedge vif.clk);
       
       //@ done;
    end
  endtask
endclass
      
    
