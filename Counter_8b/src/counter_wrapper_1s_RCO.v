// inputs:
// MAX10_CLK1_50 Master clock
// Counter wrapper using Master Clock
// Enable signal for the counter_simple is provided by cont_1s
// SW0: active low reset
//
// outputs:
//	HEX0: hex segment display
module counter_wrapper_1s_RCO (MAX10_CLK1_50, SW, HEX1, HEX0, LEDR);
	input   MAX10_CLK1_50;
	input  [0:0] SW ;
	output [0:6] HEX1, HEX0;
	//////////// LED //////////
	output [9:0]		LEDR;
	
	parameter WIDTH = 8;
	
	wire Clock = MAX10_CLK1_50 ;
	wire Resetn = SW[0];
	wire Enable;
	// 4-bit counter based on T-flip flops
	wire [WIDTH-1:0] Count;

	// Counter Instantiation
	 counter_simple # (.WIDTH(WIDTH)) counter (.Enable(Enable), .Clk(Clock), .Clr(Resetn), .Q(Count));
	
	cont_1s_RCO Clk_1s_RCO ( .mclk(MAX10_CLK1_50), .reset(Resetn), .RCO(Enable) );  // RCO generation for Enable other counters

	// drive the displays
	hex7seg digit1 (Count[3:0], HEX0);
	hex7seg digit0 (Count[7:4], HEX1);
	// drive the LEDs
	assign LEDR ={Count,Enable,SW};  //Display Count, Enable (RCO) and Reset 
endmodule