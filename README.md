# Integrating-Microprocessor-with-FPGA
This is a class project which contains my code files which work together to implement a microprocessor using the Intel DE0-CV FPGA board  
The first building block in implementing the microprocessor is setting up the display, the first file is seg7.sv which is a decoder that contains an always_comb block of hexidecimal numbers 0 through F. The decoder converts binary values into hexadecimal.    
Dual_seg7.sv calls the seg7 module twice because on the DE0-CV FPGA board there are 6 separate hex displays which are divided into three pairs to have a "one's" place and a "sixteen's" place. The dualseg7_tb.sv file is the testbench which calls dual_seg7 three times in order to create three pairs of hex displays.  
Below is the table of values for the decoder along with a diagram of how the decoder turns on each segment:  
<img width="452" alt="image" src="https://user-images.githubusercontent.com/72291395/226743240-0a694c8b-6d79-4fce-bfae-cabe34ee971b.png">
<img width="359" alt="image" src="https://user-images.githubusercontent.com/72291395/226744507-ae9b4040-27a3-4517-b4f2-aa0efd588246.png">  
The dualseg7 display modules are the main component and important to have working correctly in order for the rest of the modules to correctly display their outputs. The 7 segment displays are active low which is why the table and the decoder use zeros to turn on each segment. The diagram above has the bits flipped and is an example for an active high decoder.  
  
The next modules for implementing the microprocessor are the registers: Accumulator, Instruction Register, and Program Counter, the files included above for each register are ac.sv, ir.sv, and pc.sv respectively. The Program Counter is used to hold the memory address of the current/next instruction, the Accumulator holds values (operands) from the ALU for performing operations, and the Instruction Register holds current instructions fetched from memory.  
The testbench files (<>_tb.sv) for each register is meant for individually testing each register on the FPGA board and are not necessary for the microprocessor to function.  
  
The Arithmetic Logic Unit is necessary to interpret opcodes from the MDR and utilizes the previous registers modules in order to function. Below is the table of opcodes which this microprocessor is capable of performing:  
<img width="290" alt="image" src="https://user-images.githubusercontent.com/72291395/226756791-bacd09f1-f8f3-43f5-8e02-3dedfdb04d5a.png">  
Additionally this is a diagram of how the AC and IR are integrated with the ALU in order to perform operations based on Opcodes. My ALU.sv module listed above also integrated the PC module but is not accurate to the actual structure of the Arithmetic Logic Unit.  
<img width="277" alt="image" src="https://user-images.githubusercontent.com/72291395/226757159-542f4c81-8154-49e6-98ed-1d69ef754354.png">  
In my alu.sv file there are comments where PC and address were added to the module in order to perform the jump opcode, but the ALU is incapable of actually performing the jump opcodes.




