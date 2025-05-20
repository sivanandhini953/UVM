class env extends uvm_env;
  `uvm_component_utils(env)

  function new(string name = "env", uvm_component parent=null);
    super.new(name,parent);
endfunction

scoreboard sco;
 agent agnt;

 virtual function void build_phase(uvm_phase phase);
 super.build_phase (phase);
   sco = scoreboard:: type_id::create("sco", this);
   agnt = agent:: type_id:: create ("agnt", this);
 endfunction


 virtual function void connect_phase (uvm_phase phase);
super.connect_phase (phase);
   agnt.mon.send.connect(sco.recv);
 endfunction

 endclass
