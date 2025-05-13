class scoreboard extends uvm_scoreboard;
  
  uvm_analysis_imp #(seq_item,scoreboard) item_collect_export;
  
  seq_item item_q[$];
  `uvm_component_utils(scoreboard)
  
  function new(string name="scoreboard",uvm_component parent =null);
    super.new(name,parent);
    item_collect_export=new("item collect export",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  function  void write(seq_item seq);
    item_q.push_back(seq);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    seq_item sb_item;
    
    forever begin
    
    wait(item_q.size>0);
    
    if(item_q.size>0)begin
      sb_item=item_q.pop_front();
      
      $display("--------------------------------------");
      
      if(sb_item.in1+sb_item.in2==sb_item.out)begin
        
        `uvm_info(get_type_name,$sformatf("MATCHED: in1=%0d | in2=%0d | out=%0d",sb_item.in1,sb_item.in2,sb_item.out),UVM_LOW);
      end
        else begin
           
          `uvm_error(get_name(), $sformatf("NOT MATCHED: in1=%0d | in2=%0d | out=%0d", sb_item.in1, sb_item.in2, sb_item.out));

        end
     $display("--------------------------------------");
      
      end
    end
    endtask
      endclass
