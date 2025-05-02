`include "uvm_macros.svh";
import uvm_pkg::* ;


class env extends uvm_env;
  
  `uvm_component_utils(env);
  int c,d;
  function new(string name="env",uvm_component parent);
    
    super.new(name,parent);
    
  endfunction 
  
  virtual function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    uvm_resource_db#(int)::set("top.env","apple",33);
    uvm_resource_db#(int)::set_default("top.env","orange");
    uvm_resource_db#(string)::set_anonymous("top.env","mango");
    uvm_resource_db#(int)::set_anonymous("top.env",77);
    $display("a=%p",uvm_resource_db#(string)::get_by_type("top.env"));
    $display("a=%p",uvm_resource_db#(int)::get_by_name("top.env","apple",1));
    $display("a=%p",uvm_resource_db#(int)::get_by_name("top.env","appl",0));
    $display("a=%p",uvm_resource_db#(int)::get_by_name("top.env","pomo",1));
    $display (uvm_resource_db#(int)::read_by_type("top.env",c));
    $display("%0d",c);
    $display (uvm_resource_db#(int)::read_by_name("top.env","orange",d));
    $display("%0d",d);
    uvm_resource_db#(int)::write_by_type("top.env",55);
    $display("a=%p",uvm_resource_db#(int)::get_by_type("top.env"));
    uvm_resource_db#(int)::write_by_name("top.env","apple",88,null);
    uvm_resource_db#(int)::write_by_name("top.env","orange",66,null);
    uvm_resource_db#(int)::write_by_type("top.env",44);
    
    
    uvm_resource_db#(int)::dump();
    
    
  endfunction
  
endclass

module top;
  
  env e;
  initial begin
    
    run_test("env");
    
  end
endmodule
