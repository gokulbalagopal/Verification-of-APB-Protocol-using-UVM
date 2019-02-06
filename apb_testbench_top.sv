
`include "top_apb.sv"
`include "apb_test.sv"

//---------------------------------------------------------------

module apb_testbench_top;

 
  bit clk;
  bit rst;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    rst = 1;
    #5 rst =0;
  end
  
  //---------------------------------------
  //interface instance
  //---------------------------------------
  apb_intf intf(clk,rst);
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------
  top_apb DUT (
    .clk(intf.clk),
    .rst(intf.rst),
    .sysbus(intf.sysbus),
    .prdata(intf.rdata)
   );
  
  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method 
  //and enabling the wave dump
  //---------------------------------------
  initial begin 
    uvm_config_db#(virtual apb_intf)::set(uvm_root::get(),"*","intf",intf);
    //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test();
  end
  
endmodule
