class monitor extends uvm_monitor;
  
  virtual intf vif;
  
  uvm_analysis_port #(seq_item) item_collect_port;
  
  seq_item mon_item;
  
  `uvm_component_utils(monitor)
  
  function new(string name="monitor",uvm_component parent=null);
    super.new(name,parent);
    item_collect_port=new("item_collect_port",this);
    mon_item=new();
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual intf)::get(this,"","vif",vif))
    `uvm_fatal(get_type_name(),"not set at top level");
  endfunction
  
    task run_phase(uvm_phase phase);
      forever begin 
        
        wait(!vif.reset);
        @(posedge vif.clk);
        mon_item.in1 = vif.in1;
        mon_item.in2 = vif.in2;
        `uvm_info(get_type_name,$sformatf("in1=%0d,in2=%0d",mon_item.in1,mon_item.in2),UVM_LOW);
        @(posedge vif.clk);
         mon_item.out = vif.out;          
        
                  item_collect_port.write(mon_item);
                  end
                  endtask
                  endclass
