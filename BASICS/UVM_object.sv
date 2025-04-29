// Code your testbench here
// or browse Examples


`include "uvm_macros.svh";
import uvm_pkg::*;

typedef enum {RED,GREEN,BLUE,YELLOW}colour_type;

class my_object extends uvm_object;
  
  `uvm_object_utils(my_object);
  
  colour_type c;
  
  function new(string name= "my_object");
    super.new(name);
    `uvm_info("NEW","creating my_object",UVM_LOW);
  endfunction
  
  function void display();
    
    for(int i=0;i<4;i++)begin
    
      `uvm_info("my_object_created",$sformatf("colour=%s",c.name()),UVM_LOW)
              `uvm_info("ID",$sformatf("id=%d",c),UVM_LOW)
     c=c.next();
                        
      end
      endfunction 
                        
     endclass
                        
       module tb();
         
         my_object mb;
                          
    initial begin
               
      mb=my_object::type_id::create("mb");
      
      mb.display();
      
    end
       endmodule
                        
                        
              
    
  
  
