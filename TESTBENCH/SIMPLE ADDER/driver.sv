class driver extends uvm_driver#(seq_item);
  
  virtual intf vif;
  
  `uvm_component_utils(driver)
  
  function new(string name="driver",uvm_component parent=null);
    
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
    `uvm_fatal(get_type_name(),"not set at top level");
    
  endfunction
  
  task run_phase(uvm_phase phase);
    seq_item seq;
    forever begin
      
      seq_item_port.get_next_item(seq);
      `uvm_info(get_type_name,$sformatf("in1=%0d | in2=%0d",seq.in1,seq.in2),UVM_LOW);
      
      vif.in1 <= seq.in1;
      vif.in2 <= seq.in2;
      
      seq_item_port.item_done();
    end
  endtask
endclass
      
    
