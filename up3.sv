//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab7
//Author: Adam Montano
//Module Name: up3
//Module Function: Everything except the Control Unit
//**************************************************************************************


module up3(input logic clk, reset, store_mem, fetch,
										load_pc, incr_pc,
										load_iru, load_irl,
										load_ac,
				output logic [7:0] mdr, opcode, value);
				
	//internal lines
	logic [7:0] Z;
	logic [7:0] ADDR;
	logic [7:0] PC;
	logic [7:0] AC;
	
	ramup3 ram7(.address(ADDR), .data(AC), .wren(store_mem), .clock(clk), .q(mdr));
	alu alup(.mdr(mdr), .ac(AC), .opcode(opcode), .value(value), .zout(Z)); 
	ac acup (.Z(Z), .LOAD_AC(load_ac), .clk(clk), .AC(AC)); 
	pc pcup (.ADDR(value), .reset(reset), .LOAD_PC(load_pc), .INCR_PC(incr_pc), .clk(clk), .PC(PC)); 
	ir irup (.MDR(mdr), .LOAD_IRU(load_iru), .LOAD_IRL(load_irl), .clk(clk), .reset(reset), .IRU(opcode), .IRL(value));
	mux2by1 fetch_mux (.sel(fetch), .in1(PC), .in0(value), .out(ADDR));
	
	endmodule
	
	
	//define mux2by1
	module mux2by1 (input logic sel,
							input logic [7:0] in0, in1,
							output logic [7:0] out);
			assign out = sel? in1:in0;
	endmodule
	