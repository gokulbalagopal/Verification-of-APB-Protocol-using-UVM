`ifndef apb_sequencer
`define sequencer

`include"uvm_macros.svh"
`include"apb_seq_item.sv"
`include"apb_sequence.sv"

import uvm_pkg::*;

class apb_sequencer extends uvm_sequencer#(apb_seq_item);

`uvm_sequencer_utils(apb_sequencer)

function new(string name="apb_sequencer",uvm_component parent);
super.new(name,parent);
endfunction
endclass
`endif
