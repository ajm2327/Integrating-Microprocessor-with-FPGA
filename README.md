# Integrating-Microprocessor-with-FPGA
This is a class project which contains my code files which work together to implement a microprocessor using the Intel DE0-CV FPGA board  
The first building block in implementing the microprocessor is setting up the display, the first file is seg7.sv which is a decoder that contains an always_comb block of hexidecimal numbers 0 through F. The decoder converts binary values into hexadecimal.    
Dual_seg7.sv calls the seg7 module twice because on the DE0-CV FPGA board there are 6 separate hex displays which are divided into three pairs to have a "one's" place and a "sixteen's" place. The dualseg7_tb.sv file is the testbench which calls dual_seg7 three times in order to create three pairs of hex displays.  
Below is the table of values for the decoder along with a diagram of how the decoder turns on each segment:  
<img width="452" alt="image" src="https://user-images.githubusercontent.com/72291395/226743240-0a694c8b-6d79-4fce-bfae-cabe34ee971b.png">
<img width="359" alt="image" src="https://user-images.githubusercontent.com/72291395/226744507-ae9b4040-27a3-4517-b4f2-aa0efd588246.png">  
The dualseg7 display modules are the main component and important to have working correctly in order for the rest of the modules to correctly display their outputs. The 7 segment displays are active low which is why the table and the decoder use zeros to turn on each segment. The diagram above has the bits flipped and is an example for an active high decoder.  



