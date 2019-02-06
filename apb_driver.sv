`ifndef apb_driver
`define apb_driver

`include "uvm_macros.svh"
`include "apb_seq_item.sv"
`include "apb_sequencer.sv"

import uvm_pkg::*;
` define DRIV_IF intf.DRIVER.driver_cb

class apb_driver extends uvm_driver#(apb_seq_item);

`uvm_component_utils(apb_driver)
virtual apb_intf intf;


function new(string name, uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual apb_intf)::get(this,"","intf",intf))
`uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
endfunction


virtual task run_phase(uvm_phase phase);
 forever begin
 seq_item_port.get_next_item(req);
 drive();
 seq_item_port.item_done();
end
endtask

virtual task drive();
req.print();

@(posedge intf.DRIVER.clk);
`DRIV_IF.sysbus <= req.sysbus;
@(posedge intf.DRIVER.clk);
req.prdata = `DRIV_IF.prdata;
endtask
endclass
 `endif


