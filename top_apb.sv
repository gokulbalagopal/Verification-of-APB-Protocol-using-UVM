module top_apb(clk,rst,sysbus,prdata);
input clk,rst;
output reg [7:0] prdata;
input [20:0] sysbus;


wire psel,penable,pwrite;
wire [7:0] paddr;
wire [7:0] pwdata;

bridge_apb DUT1( .psel(psel),// select signals
             .penable(penable),      // enable signal
              .pwrite(pwrite), // write signal
               .paddr(paddr),  // 8-bit address
              .pwdata(pwdata), // 8-bit data                    	
               .clk(clk),   // clock signal
                .rst(rst), // negedge reset
		.system_bus(sysbus),       
	         .prdata(prdata)    
                    );


slave_apb DUT2( .prdata(prdata), //dataout from slave 
               .penable(penable),// to enable read or write
               .pwrite(pwrite), // control signal 
                .psel(psel),  // select signal
                .clk(clk),   // posedge clk
                 .rst(rst), // negedge reset              
                 .paddr(paddr),  // 8-bit address            
                  .pwdata(pwdata)  // 8-bit write data
                    );

endmodule

  
