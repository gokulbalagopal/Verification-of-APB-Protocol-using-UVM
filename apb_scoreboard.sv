`ifndef apb_scoreboard
`define apb_scoreboard

`include "apb_agent.sv"
`include"uvm_macros.svh"

import uvm_pkg::*;

class apb_scoreboard extends uvm_scoreboard;
`uvm_component_utils(apb_scoreboard)
endclass

`endif
