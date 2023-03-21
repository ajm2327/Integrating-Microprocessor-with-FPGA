//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab7
//Author: Adam Montano
//Module Name: up3_cu
//Module Function: up3_cu
//**************************************************************************************


module up3_cu (input logic clk, reset, 
					output logic [2:0] state,
					output logic [7:0] pc, opcode, value,
					output logic load_ac, load_iru, load_irl, load_pc, incr_pc, fetch, store_mem);
					
					
		logic [7:0] AC, MDR, Z, ADDR;
		logic ZFLG, NFLG;
		
		
		control unit(.opcode(opcode), .nflg(NFLG), .zflg(ZFLG), .reset(reset), .clk(clk), .STATE(state), 
							.ld_ac(load_ac), .ld_iru(load_iru), .ld_irl(load_irl), .ld_pc(load_pc), 
							.incr_pc(incr_pc), .fetch(fetch), .store_mem(store_mem));
							
		
		ramup3 up3ram(.address(ADDR), .clock(clk), .data(AC), .wren(store_mem), .q(MDR));
		
		ac ac1(.Z(Z), .clk(clk), .LOAD_AC(load_ac), .AC(AC));

		ir ir1(.MDR(MDR), .clk(clk), .reset(reset), .LOAD_IRU(load_iru), .LOAD_IRL(load_irl), .IRL(value), .IRU(opcode));

		pc pc1(.clk(clk), .reset(reset), .LOAD_PC(load_pc), .INCR_PC(incr_pc), .ADDR(ADDR), .PC(pc)); 

		alu alu1(.mdr(pc), .ac(AC), .value(value), .opcode(opcode), .nflg(NFLG), .zflg(ZFLG), .zout(Z));
		
		mux2by1 fetch_mux (.sel(fetch), .in1(pc), .in0(value), .out(ADDR));
		
		
endmodule
