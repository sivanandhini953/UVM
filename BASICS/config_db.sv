module top;
  import uvm_pkg::*; `include "uvm_macros.svh"

  initial begin
    // Set configuration at top-level
    
    run_test("driver");
  end
endmodule

class driver extends uvm_component;
  `uvm_component_utils(driver)

  int threshold;
  string driver_name;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(int)::set(this,"", "threshold", 42);
    uvm_config_db#(string)::set(this, "", "driver_name", "alpha_driver");


    if (uvm_config_db#(int)::exists(this, "", "threshold"))
      if (!uvm_config_db#(int)::get(this, "", "threshold", threshold))
        `uvm_error(get_type_name(), "Failed to get threshold")

    if (!uvm_config_db#(string)::get(this, "", "driver_name", driver_name))
      `uvm_error(get_type_name(), "Failed to get driver_name")

    `uvm_info(get_type_name(), $sformatf("Driver Threshold: %0d, Name: %s", threshold, driver_name), UVM_LOW)
  endfunction
endclass
      
      


      UVM_INFO testbench.sv(34) @ 0: uvm_test_top [driver] Driver Threshold: 42, Name: alpha_driver
