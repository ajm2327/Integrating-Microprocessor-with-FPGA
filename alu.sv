//EE 310 Fundamentals of Computer Engineering
//Assignment: lab4
//Author: Adam Montano
//Module Name: alu
//Module Function: arithmetic logic unit
//**************************************************************************************

//module declaration

module alu(input logic signed [7:0] mdr, ac, value, pc, addr,
				input logic [7:0] opcode,
				output logic nflg, zflg,
				output logic signed [7:0] zout);
				
		assign nflg = ac[7];
		assign zflg = (ac==0)?1:0;
		always_comb
			case(opcode)
			8'h01: zout = mdr;
			8'h02: zout = value;
			8'h03: zout = mdr <= ac;
			8'h05: zout = ac + mdr;
			8'h06: zout = ac + value;
			8'h07: zout = ac - mdr;
			8'h08: zout = ac - value;
			8'h09: zout = -mdr;
			8'h0A: zout = ~mdr;
			8'h0B: zout = ac & mdr;
			8'h0C: zout = ac | mdr;
			8'h0D: zout = ac ^ mdr;
			8'h0E: zout = ac << value[2:0];
			8'h0F: zout = ac >> value[2:0];
			8'h10: zout = pc <= addr;
			//8'h11: if(ac[7]) pc <= addr;
			//8'h12: if(ac >= 0) pc <= addr;
			//8'h13: if(zflg) pc <= addr;
			//8'h14: if(ac != 0) pc <= addr;
			default: zout = 8'h00;//we skip cases 0, 3, and 4 because they go to default
			endcase
			
endmodule