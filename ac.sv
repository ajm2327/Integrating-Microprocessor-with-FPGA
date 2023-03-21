//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: ac
//Module Function: accumulator
//**************************************************************************************


module ac(input logic signed [7:0] Z,  
				input logic clk, LOAD_AC,
				output logic signed [7:0] AC);
				
// always block? no reset

always_ff @(posedge clk)

	if(LOAD_AC) AC <= Z; //idk I'm trying to do active high for LOAD_AC and there is no reset
	//else AC <= 0;
	

endmodule 