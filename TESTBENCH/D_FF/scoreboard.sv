class scoreboard extends uvm_scoreboard;
  event done;
  seq_item data;
  `uvm_component_utils(scoreboard)

  uvm_analysis_imp #(seq_item, scoreboard) item_collect_export;

  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
    
    item_collect_export = new("item_collect_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    data=seq_item::type_id::create("data");
  endfunction

  function void write(input seq_item t);
    
    if (t.reset) begin
      `uvm_info("SCOREBOARD", " Reset active - skipping check", UVM_NONE);
    end 
    else begin
      if (t.d == t.q)begin
        `uvm_info("SCOREBOARD", "Test PASSED: Q matches D", UVM_NONE);
      end
      else begin
        `uvm_error("SCOREBOARD", $sformatf(" Test FAILED: D = %0d, Q = %0d", t.d, t.q));
    end
    end
    //-> done;
  endfunction
endclass
