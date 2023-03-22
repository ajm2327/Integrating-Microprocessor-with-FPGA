//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab8
//Author: Adam Montano
//Module Name: up3
//Module Function: Microprocessor Hardware test
//**************************************************************************************


module up3tb(input logic [3:0] KEY,
				 output logic [9:0] LEDR,
				 output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);	
	
	
	
	
	logic [6:0] LOAD; //internal line for single bit load data variables (load_iru, load_pc etc)
	logic [7:0] PC, AC, STA, MDR, OPC, VAL, ADDR; //variables for respective registers, STA is for state. 
	logic [7:0] L, M, R; // left middle and right
	
	//Call up3 module
			up3 call(.clk(KEY[0]), .reset(~KEY[1]), .store_mem(LOAD[0]), .fetch(LOAD[1]), .load_pc(LOAD[3]), .incr_pc(LOAD[2]), 
				 .load_iru(LOAD[5]), .load_irl(LOAD[4]), .load_ac(LOAD[6]), .pc(PC), .ac(AC), .state(STA), .mdr(MDR),
				 .opcode(OPC), .value(VAL), .address(ADDR));

//Always comb for mode select, LED9 on for mode1 and off for mode0
always_comb begin
	//Mode 1 displays PC, Address/MAR, and MDR on the 7seg displays
	//As well as the load data variables are displayed on the LEDs
				if (~KEY[3]) begin//mode1	
					LEDR[6:0] = LOAD[6:0];
					LEDR[8:7] = 0;
					LEDR[9] = 1;
					L = PC;
					M = ADDR;
					R = MDR;	
				end
	//Mode 0 displays opcode (IRU), Value/Address(IRL), and AC
	//LEDs display the State that the cycle is currently in, there are 8 states
				else begin //mode0
					LEDR[7:0] = STA;
					LEDR[9:8] = 0;
					L = OPC;
					M = VAL;
					R = AC;
					end
				end
					
	//Output respective results to left middle and right 7seg displays based off of current mode:				
				dual_seg7 L_out(.blank(0), .test(0), .data(L), .segments1(HEX5), .segments2(HEX4));//Left, PC or Opcode
				dual_seg7 M_out(.blank(0), .test(0), .data(M), .segments1(HEX3), .segments2(HEX2));//Middle, Address or Value
				dual_seg7 R_out(.blank(0), .test(0), .data(R), .segments1(HEX1), .segments2(HEX0));//RIght, AC or MDR
				
				
endmodule
