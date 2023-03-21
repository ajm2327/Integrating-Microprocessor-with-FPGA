//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: ir
//Module Function: instruction register
//**************************************************************************************

module ir(input logic [7:0] MDR, 
				input logic clk, reset, LOAD_IRU, LOAD_IRL,
				output logic [7:0] IRL, 
				output logic [7:0] IRU );
	
//always block, active high reset	
		always_ff @(posedge clk, posedge reset)
	
			if (reset) begin
				IRU <= 0;
				IRL <= 0;
				end
			else if (LOAD_IRU & ~LOAD_IRL) IRU <= MDR;// having the ~ means that it only works when one is on.
			else if (LOAD_IRL & ~LOAD_IRU) IRL <= MDR;// this is so there doesn't have to be another if statement for both being on.
						
endmodule