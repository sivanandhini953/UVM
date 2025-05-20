class scoreboard extends uvm_scoreboard;
 `uvm_component_utils(scoreboard)

  uvm_analysis_imp #(seq_item, scoreboard) recv;

seq_item tr;



  function new(string name = "scoreboard", uvm_component parent=null);
    super.new(name,parent);
 recv = new("Read", this);
 endfunction



virtual function void build_phase(uvm_phase phase);
super.build_phase (phase);
  tr=seq_item::type_id::create("tr");
 endfunction



  virtual function void write(seq_item t);
tr = t;
    `uvm_info ("SCO", $sformatf("Data rcvd from Monitor d: %0d and q: %0d", tr.d, tr.q), UVM_NONE);

    if(t.q == t.d) begin

      `uvm_info("SCo", "Test Passed", UVM_NONE);end
 else begin
   `uvm_info ("SCO", "Test Failed", UVM_NONE);end
 endfunction
  
 
 endclass
