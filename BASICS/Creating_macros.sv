`define calculate(val1,val2,result,expression) \
result = val1 expression val2;  

module macro;  
int a=15,b=7;  
  int c;
  initial begin  
    `calculate(a,b,c,+) 
    $display("result is %d",c);
  end    
endmodule
