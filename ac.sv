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

	if(LOAD_AC) AC <= Z; //if the Load ac bit goes high, then AC gets Z
	//else AC <= 0; <- This line is commented out because in future modules it'll force AC to zero when it shouldn't
	

endmodule 
