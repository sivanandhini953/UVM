class driver extends uvm_driver #(seq_item);
  
  `uvm_component_utils(driver)
  
  seq_item tr;
  virtual intf vif;
  
  function new(string name="driver",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  task reset_dut();
    vif.reset <= 1;
    vif.d <= 0;
    repeat(10) @(posedge vif.clk)
      
      vif.reset <= 0;
    `uvm_info("DRV","reset done",UVM_NONE);
  endtask
  
  virtual function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    tr=seq_item::type_id::create("data");
    
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
      `uvm_fatal("DRV","unable to access interface")
      endfunction
      
      
      virtual task run_phase(uvm_phase phase);
    
    reset_dut();
    
    forever begin
      
      seq_item_port.get_next_item(tr);
      vif.d <= tr.d;
      
      seq_item_port.item_done();
      `uvm_info("DRV", $sformatf("Trigger DUT d: %0d",tr.d),UVM_NONE);
               @(posedge vif.clk);
              @(posedge vif.clk);
      @(posedge vif.clk);
               
               end
               endtask
               endclass
               
      
      
  
  
