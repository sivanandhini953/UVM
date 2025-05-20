`include "seq_item.sv"
`include "sequence.sv"
//`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"

class test extends uvm_test;
  `uvm_component_utils(test)

  seq sq;
  env en;

  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sq = seq::type_id::create("sq", this);
    en = env::type_id::create("en", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    sq.start(en.agnt.seqr);  // assuming env -> agent -> sequencer hierarchy

    #60;
    phase.drop_objection(this);
  endtask

endclass
