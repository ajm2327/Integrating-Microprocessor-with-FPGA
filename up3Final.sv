//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab8
//Author: Adam Montano
//Module Name: up3
//Module Function: Everything
//**************************************************************************************


module up3(input logic clk, reset, 
				output logic store_mem, fetch, load_pc, incr_pc, load_iru, load_irl, load_ac,
				output logic [7:0] pc, ac, state, mdr, opcode, value, address);
				
	//internal lines
	logic [7:0] Z;
	logic ZFLG, NFLG;
		
		
	control unit(.opcode(opcode), .nflg(NFLG), .zflg(ZFLG), .reset(reset), .clk(clk), .STATE(state), 
					.ld_ac(load_ac), .ld_iru(load_iru), .ld_irl(load_irl), .ld_pc(load_pc), 
					.incr_pc(incr_pc), .fetch(fetch), .store_mem(store_mem));
	
	ramup3 ram7(.address(address), .data(ac), .wren(store_mem), .clock(clk), .q(mdr));
	alu alup(.mdr(mdr), .ac(ac), .opcode(opcode), .value(value), .pc(pc), .addr(address), .nflg(NFLG), .zflg(ZFLG), .zout(Z)); 
	ac acup (.Z(Z), .LOAD_AC(load_ac), .clk(clk), .AC(ac)); 
	pc pcup (.ADDR(value), .reset(reset), .LOAD_PC(load_pc), .INCR_PC(incr_pc), .clk(clk), .PC(pc)); 
	ir irup (.MDR(mdr), .LOAD_IRU(load_iru), .LOAD_IRL(load_irl), .clk(clk), .reset(reset), .IRU(opcode), .IRL(value));
	mux2by1 fetch_mux (.sel(fetch), .in1(pc), .in0(value), .out(address));
	
	endmodule
	
	
	//define mux2by1
	module mux2by1 (input logic sel,
							input logic [7:0] in0, in1,
							output logic [7:0] out);
			assign out = sel? in1:in0;
	endmodule
