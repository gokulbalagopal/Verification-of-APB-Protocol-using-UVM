`ifndef apb_monitor
`define apb_monitor


`include "uvm_macros.svh"
`include "apb_driver.sv"

import uvm_pkg::*;

class apb_monitor extends uvm_monitor;

virtual apb_intf intf;
uvm_analysis_port#(apb_seq_item) item_collected_port;

apb_seq_item trans_collected;

`uvm_component_utils(apb_monitor)

function new(string name,uvm_component parent);
super.new(name,parent);
trans_collected=new();
item_collected_port=new("item_collected_port",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual apb_intf)::get(this,"","intf",intf))
`uvm_fatal("No interface",{"virtual interface must be set for: ",get_full_name(),".intf"});
endfunction

virtual task run_phase(uvm_phase phase);
forever begin
 @(posedge intf.MONITOR.clk);
 trans_collected.sysbus=intf.monitor_cb.sysbus;
 @(posedge intf.MONITOR.clk);
 trans_collected.prdata=intf.monitor_cb.prdata;
 item_collected_port.write(trans_collected);
end
endtask
endclass

`endif


	

