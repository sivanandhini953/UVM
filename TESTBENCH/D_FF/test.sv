`include "package.sv"
class test extends uvm_test;
   `uvm_component_utils(test)
  
  
  env env_o;
  seq1 s1;
  seq2 s2;
  seq3 s3;
 
  
  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_o = env::type_id::create("env_o", this);
    
   // env.scr.done = env.agnt.drv.done;
    
  endfunction
               
               
  task run_phase(uvm_phase phase);
    s1 = seq1::type_id::create("s1");
    s2 = seq2::type_id::create("s2");
    s3 = seq3::type_id::create("s3");
    
    phase.raise_objection(this);
   
    s1.start(env_o.agnt.seqr);
    #10;
    s2.start(env_o.agnt.seqr);
    #20;
    s3.start(env_o.agnt.seqr);
    
    phase.drop_objection(this);
    
  endtask
endclass
