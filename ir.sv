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
	
			if (reset) begin //If reset both Opcode(IRU) and Value(IRL) get zero
				IRU <= 0;
				IRL <= 0;
				end
			//Either LOAD_IRU or LOAD_IRL can be on, both cannot be on at the same time
			else if (LOAD_IRU & ~LOAD_IRL) IRU <= MDR; // Opcode (IRU) gets the value stored in MDR
			else if (LOAD_IRL & ~LOAD_IRU) IRL <= MDR; // Value (IRL) gets the value from MDR
						
endmodule
