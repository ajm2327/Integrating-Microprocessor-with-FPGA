//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab7
//Author: Adam Montano
//Module Name: Control Unit
//Module Function: The state Machine
//**************************************************************************************


module control (input logic clk, reset, nflg, zflg, 
					input logic [7:0] opcode,
					output logic [7:0] STATE,
					output logic fetch, ld_iru, ld_irl, ld_ac, ld_pc, incr_pc, store_mem);
					
					
		typedef enum logic [3:0] {start, prepu, fetchu, prepl, fetchl, exec, read, store, jump}statetype;
		statetype state, next_state; //each can take any of the above values
		

		//State Register 1:
		
		always_ff @(negedge clk, posedge reset) //async reset
			if(reset) state <= start; //Go to start state at reset
			else state <= next_state; //Else get next state
			 
			
			
		//Next state (comb logic) 2:
		//There are 5 classes of opcodes that have unique fetch execute cycles, below each cycle is defined based on each set of opcodes:
		always_comb
			if (opcode == 8'h04 || opcode == 8'h00) begin //Class 1 case
				case (state) //noOP or CLR
				start: next_state = prepu;
				prepu: next_state = fetchu;
				fetchu: next_state = exec;
				exec: next_state = prepu;
				default: next_state = start;
				endcase
			end
			
			else if (opcode == 8'h02|| opcode == 8'h06 || opcode == 8'h08 || opcode == 8'h0E|| opcode == 8'h0F) begin //class 2
				case (state) //LOADI ADDI SUBTI SHL and SHR
				start: next_state = prepu;
				prepu: next_state = fetchu;
				fetchu: next_state = prepl;
				prepl: next_state = fetchl;
				fetchl: next_state = exec;
				exec: next_state = prepu;
				default: next_state = start;
				endcase
			end
			
			else if (opcode == 8'h03) begin //class 4
				case (state) //store
				start: next_state = prepu;
				prepu: next_state = fetchu;
				fetchu: next_state = prepl;
				prepl: next_state = fetchl;
				fetchl: next_state = store;
				store: next_state = prepu;
				default: next_state = start;
				endcase
			end
			//The class 5 jump opcodes each have unique parameters and cannot be together in the same cycle
			else if (opcode == 8'h10) begin //class 5
				case (state) //jump
				start: next_state = prepu;
				prepu: next_state = fetchu;
				fetchu: next_state = prepl;
				prepl: next_state = fetchl;
				fetchl: next_state = jump;
				jump: next_state = prepu;
				default: next_state = start;
				endcase
			end
			
			
			else if (opcode == 8'h13 && zflg == 1) begin //class 5
				case (state) //jump if zero
				start: next_state = prepu;
				prepu: next_state = fetchu;
				fetchu: next_state = prepl;
				prepl: next_state = fetchl;
				fetchl: next_state = jump;
				jump: next_state = prepu;
				default: next_state = start;
				endcase
			end
			else if (opcode == 8'h11 && nflg == 1) begin //class 5
				case (state) //jump if negative
				start: next_state = prepu;
				prepu: next_state = fetchu;
				fetchu: next_state = prepl;
				prepl: next_state = fetchl;
				fetchl: next_state = jump;
				jump: next_state = prepu;
				default: next_state = start;
				endcase
			end
				
			else begin //class 3 (the rest)
				case (state) //all other instructions
				start: next_state = prepu;
				prepu: next_state = fetchu;
				fetchu: next_state = prepl;
				prepl: next_state = fetchl;
				fetchl: next_state = read;
				read: next_state = exec;
				exec: next_state = prepu;
				default: next_state = start;
				endcase
			end
			
			
		//Output combinational logic 3:
		assign STATE = state;
		assign fetch = (state == prepu || state == fetchu || state == prepl || state == fetchl);
		assign ld_iru = (state==fetchu);
		assign ld_irl = (state == fetchl);
		assign incr_pc = (state == fetchu || state == fetchl);
		assign ld_ac = (state == exec);
		assign ld_pc = (state == jump);
		assign store_mem = (state == store);
endmodule
		//This  module is the brain of a computer. 
		//Interprets opcode and arranges execution by instruction. 
			
