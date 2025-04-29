`include "uvm_macros.svh";
import uvm_pkg::* ;

class my_obj extends uvm_object;
  
  rand bit [3:0]a;
  rand bit [3:0]b;
  
  `uvm_object_utils_begin(my_obj);
  `uvm_field_int(a,UVM_DEFAULT);
  `uvm_field_int(b,UVM_DEFAULT);
  `uvm_object_utils_end
  
  function new(string name = "my_obj");
    
    super.new(name);
  endfunction
  
endclass

class sample;
  
  
  
  my_obj obj1,obj2;
  
  
  
  function void create();
    
    obj1=my_obj::type_id::create("obj1");
    obj2=my_obj::type_id::create("obj2");
    
  endfunction
  
  function void randomization();
    
    void'(obj1.randomize() with {a inside {7,8,9,10,3,4};});
    void'(obj2.randomize() with {a inside {1,2,3,4,5,6,7,8,9};});
    
  endfunction
  
  
  function void compare();
    
    if(obj1.compare(obj2))
      
      begin
        
        `uvm_info("RESULT","obj_1 matching with obj_2",UVM_LOW) 
          obj1.print();
      obj2.print();
    end
    else
    begin
      `uvm_error("v","obj_1 is not matching with obj_2")
      obj1.print();
      obj2.print();
    end
  endfunction
  
  function void copy();
    obj2.copy(obj1);
  endfunction
  
  
endclass


module top;
  
  sample s=new;
  
  initial begin
    
   // s=sample::type_id::create("s",null);
    
    s.create();
    s.randomization();
    s.compare();
    s.copy();
    s.compare();
    
  end
endmodule
  
  
  
  
