class agent extends uvm_agent;
  
  `uvm_component_utils(agent)
  
  driver drv;
  monitor mon;
  seqncr seqr;
  
  function new(string name="agent",uvm_component parent=null);
    super.new(name,parent);
     
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    drv=driver::type_id::create("drv",this);
    seqr=seqncr::type_id::create("seqr",this);
    mon=monitor::type_id::create("mon",this);
  endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
   drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
  
endclass
