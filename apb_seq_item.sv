`ifndef APB_SEQ_ITEM
`define APB_SEQ_ITEM

`include "uvm_macros.svh"

import uvm_pkg::*;



class apb_seq_item extends uvm_sequence_item;

rand bit [20:0] sysbus;
bit [7:0] prdata;
`uvm_object_utils_begin(apb_seq_item)
`uvm_field_int(sysbus,UVM_ALL_ON)
`uvm_object_utils_end


function new(string name= "apb_seq_item");
super.new(name);
endfunction

endclass


`endif 
