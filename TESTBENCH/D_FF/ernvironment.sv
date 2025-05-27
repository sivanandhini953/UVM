class env extends uvm_env;     //class creation
  
  `uvm_component_utils(env)    //factory registration
  
  agent agnt;                  //subclasses for environment  instantiation
  scoreboard sb;
  
  
  function new(string name="env",uvm_component parent=null);  //constructor
    super.new(name,parent);
    
  endfunction
  
  function  void build_phase(uvm_phase phase);    //build phase
    super.build_phase(phase);
    agnt=agent::type_id::create("agnt",this);   //subclass memory creation
    sb=scoreboard::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase); 
    agnt.mon.item_collect_port.connect(sb.item_collect_export);
  endfunction
endclass
