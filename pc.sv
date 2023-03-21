//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: pc
//Module Function: (poppycock) program counter
//**************************************************************************************


module pc( input logic clk, reset, LOAD_PC, INCR_PC,
				input logic [7:0] ADDR,
				output logic [7:0] PC);
				
// da instruction fetch cycle
	always_ff @(posedge clk, posedge reset)
		
		if (reset) PC <= 0; // clear PC when reset
		else if (LOAD_PC) PC <= ADDR; //PC gets the address/value	
		else if (INCR_PC & ~LOAD_PC) PC += 1; //increment PC
		
endmodule