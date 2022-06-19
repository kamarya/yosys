module top (input CLK, input RESETBTN, output LED1);
reg [27:0] counter;
reg clkout;

parameter sys_clk	= 100000000;				        // 100 MHz system clock
parameter clk_out	= 1;						            // 1 MHz clock output
parameter max		  = sys_clk / (2*clk_out);	  // max-counter size

always @(posedge clkout) begin
	if (RESETBTN == 0) begin
		LED1 <= 0;
	end else begin
		LED1 <= ~LED1;
	end
end



always@(posedge CLK) begin
	if (counter == max-1)
	begin
		counter <= 0;
		clkout <= ~clkout;
	end
	else
	begin
		counter <= counter + 1'd1;
	end
	clkout <= (counter == 5'd0);
end

endmodule
