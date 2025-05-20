class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  
  uvm_analysis_port #(seq_item) send;
  seq_item tr;
  virtual intf vif;
  
  
  function new(string name="monitor",uvm_component parent=null);
    super.new(name,parent);
    send=new("write",this);
    tr = seq_item:: type_id::create ("tr");
  endfunction
  
  
  
  
  virtual function void build_phase (uvm_phase phase);
  
  super.build_phase(phase);
    
    if(!uvm_config_db #(virtual intf):: get(this, "", "vif", vif))
      `uvm_error ("MON", "Unable to access uvm_config_db");
  endfunction
  
  
 virtual task run_phase (uvm_phase phase);
   
   wait(!vif.reset);
          
       @(posedge vif.clk);
     tr.d <= vif.d;
     tr.q <= vif.q;
     tr.reset <= vif.reset;
     tr.clk <= vif.clk;
     
     `uvm_info("MON", $sformatf("Data send to Scoreboard d: %0d and q: %0d", tr.d, tr.q), UVM_NONE);
     send.write(tr);
     
   
 endtask
endclass
       
