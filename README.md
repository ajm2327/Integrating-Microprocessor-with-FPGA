# Integrating-Microprocessor-with-FPGA
This repository is for the purpose of building a portfolio. Use of these files for school assignments is plagiarism and academically dishonest.  

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
The ramlpm.v and ramlpm_tb.sv files are for initializing and demonstrating ram/memory on the FPGA board, this was done following a tutorial in Quartus using the megafunction wizard tool. The microprocessor will utilize a .mif (memory initialization file) which will contain the opcodes to perform basic operations. Initializing ram on the FPGA board is necessary in order for the FPGA board to "read" the mif file.  
  
The next module is the control unit which will create the fetch-execute cycle. Below is a table showing the flow of the control unit:    
<img width="484" alt="image" src="https://user-images.githubusercontent.com/72291395/226760921-955ed913-5a28-4f77-be16-251c18cd72c4.png">  
<img width="487" alt="image" src="https://user-images.githubusercontent.com/72291395/226761031-8605edfe-a52d-4220-b9f3-368e8b23dff5.png">  

up3.sv is the module which calls to the previous modules: ramlpm, alu, ac, ir, and pc. The module control.sv is the state machine which implements the flow of the control unit shown in the table above, this module identifies each opcode by class and arranges the execution based on those opcodes. The comments in the control.sv file shows what opcodes are part of each class and their following cycle. 

the up3_cu.sv file wraps both up3.sv and control.sv together, the up3cu_tb.sv file is the test bench file which demonstrates this step in the process, in order for the fpga to demonstrate the program, it needs a mif file which contains the opcodes and address/values that the fpga will perform.  
The final product uses the files up3Final.sv and up3tbFinal.sv which fully demonstrates a microprocessor. The testbench for the FPGA hardware includes a mode select function using a push button on account of the FPGA board not being capable of displaying every single output, the commented file shows how the mode select functions and which values are displayed in each mode.  
  
To demonstrate the FPGA board, a mif file is required, a sample mif file up3.mif is included which was a project to demonstrate the state machine with fully functioning jump opcodes.  
Below is a table explaining the mif file which contains the machine code for calculating the area of a triangle:  
<img width="403" alt="image" src="https://user-images.githubusercontent.com/72291395/226770404-a981bc31-a066-4092-804f-27dcce913459.png">  
Additionally this is how the mif file appears when viewed in Quartus:  
<img width="176" alt="image" src="https://user-images.githubusercontent.com/72291395/226770563-b60fadc0-6ce4-44aa-b033-7ead2d652314.png">  
Address F0, F1, and F5 are used as constants to store the values used for calculation.  
This processor is big endian, so the higher bite contains the opcode, and the lower bite contains the argument that the operation is performed on. 
