# Integrating-Microprocessor-with-FPGA
This is a class project which contains my code files which work together to implement a microprocessor using the Intel DE0-CV FPGA board  
The first building block in implementing the microprocessor is setting up the display, the first file is seg7.sv which is a decoder that contains an always_comb block of hexidecimal numbers 0 through F. The decoder converts binary values into hexadecimal.    
Dual_seg7.sv calls the seg7 module twice because on the DE0-CV FPGA board there are 6 separate hex displays which are divided into three pairs to have a "one's" place and a "sixteen's" place.  
Below is the table of values for the decoder:  
<img width="452" alt="image" src="https://user-images.githubusercontent.com/72291395/226743240-0a694c8b-6d79-4fce-bfae-cabe34ee971b.png">

