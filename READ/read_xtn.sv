/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   read_xtn.sv

Description			:	  Read transaction class for Router 1x3
  
Author Name	 	  :   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
class read_xtn extends uvm_sequence_item;

   //....................FACTORY REGISTRATION.....................//
   `uvm_object_utils(read_xtn)

   //..................VARIABLES DECLARATION......................//
  
   bit [7:0]header;
   bit [7:0]payload_data[];
   bit [7:0]parity;
   rand bit [5:0]no_of_cycles;
 
   //..............CONSTRAINTS..........................//
   //constraint RD{no_of_cycles inside {[1:25]};}

   //.........................METHODS.............................//
   extern function new(string name ="read_xtn");
   extern function void do_print(uvm_printer printer);
endclass

//.......................CONSTRUCTOR........................//
function read_xtn::new(string name = "read_xtn");
 	 super.new(name);
endfunction

//-----------------  do_print method  -------------------//
function void  read_xtn::do_print (uvm_printer printer);
   super.do_print(printer); 
   //                   string name   			    bitstream value        	size       radix for printing
   printer.print_field( "header", 				this.header, 	   	  8,		 UVM_HEX	);
   foreach(payload_data[i])
      printer.print_field( $sformatf(" payload_data[%0d]",i),	this.payload_data[i], 	  8,		 UVM_HEX	);
   printer.print_field( "parity", 				this.parity, 	  	  8,		 UVM_HEX	);
	 printer.print_field( "no_of_cycles", 				this.no_of_cycles, 	   	  6,		 UVM_DEC	);

endfunction



