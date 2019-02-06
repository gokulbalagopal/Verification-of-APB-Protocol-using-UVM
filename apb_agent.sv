`ifndef apb_agent
`define apb_agent

`include"uvm_macros.svh"

`include"apb_driver.sv"
`include"apb_monitor.sv"

class apb_agent extends uvm_agent;

apb_sequencer sequencer;
apb_driver driver;
apb_monitor monitor;

`uvm_component_utils(apb_agent)

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
 monitor = apb_monitor::type_id::create("monitor", this);


    if(get_is_active() == UVM_ACTIVE) begin
      driver    = apb_driver::type_id::create("driver", this);
      sequencer = apb_sequencer::type_id::create("sequencer", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction

endclass 
`endif
