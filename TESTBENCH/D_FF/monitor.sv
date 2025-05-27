  class monitor extends uvm_monitor;
   `uvm_component_utils(monitor)
    
  virtual intf vif;
  
  uvm_analysis_port #(seq_item) item_collect_port;
  
  seq_item trans;
  
 
  
  function new(string name="monitor",uvm_component parent=null);
    super.new(name,parent);
    
    item_collect_port=new("item_collect_port",this);
    
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    trans=seq_item::type_id::create("trans");
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
    `uvm_fatal(get_type_name(),"not set at top level");
  endfunction
  
    task run_phase(uvm_phase phase);
      
      forever begin 
        
        repeat(2) @(posedge vif.clk);
       
        trans.reset = vif.reset;
        trans.d = vif.d;
        trans.q = vif.q;
      `uvm_info("mon",$sformatf("monitor to scoreboard reset=%b , d:%b,  q:%b",trans.reset,trans.d,trans.q),UVM_NONE);
      item_collect_port.write(trans);
        
      end
      
endtask
endclass
