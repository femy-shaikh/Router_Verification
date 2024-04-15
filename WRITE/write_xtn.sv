/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename					:   write_xtn.sv

Description				:		Write transaction class for Router 1x3
  
Author Name				:   Shanthi V A

Support e-mail		: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version						:		1.0

************************************************************************/
class write_xtn extends uvm_sequence_item;

   //....................FACTORY REGISTRATION.....................//
   `uvm_object_utils(write_xtn)

   //..................VARIABLES DECLARATION......................//
   rand bit [7:0] header;
   rand bit [7:0] payload_data[];
   bit [7:0]parity;
   bit err;
   //........................CONSTRAINTS..........................//
   constraint C1{header[1:0]!= 3;}
   constraint C2{payload_data.size == header[7:2];}
   constraint C3{header[7:2]!= 0;}

   //.........................METHODS.............................//
   extern function new(string name ="write_xtn");
   extern function void post_randomize();
   extern function void do_print(uvm_printer printer);

endclass

//.......................CONSTRUCTOR...........................//
function write_xtn::new(string name = "write_xtn");
   super.new(name);
endfunction

//-----------------  do_print method  -------------------//
function void  write_xtn::do_print (uvm_printer printer);
   super.do_print(printer); 
   //                   string name   				bitstream value    	 size       radix for printing
   printer.print_field( "header", 				this.header, 	   	 8,		 UVM_HEX	);
	 foreach(payload_data[i])
      printer.print_field( $sformatf(" payload_data[%0d]",i), 	this.payload_data[i], 	 8,		 UVM_HEX	);
	  
   printer.print_field( "parity", 				parity, 	    	 8,		 UVM_HEX	);
endfunction


//.....................POST-RANDOMIZE..........................//
function void write_xtn::post_randomize();
   parity = 0 ^ header;
      foreach (payload_data[i])
         begin
         	  parity = payload_data[i] ^ parity; 
   	     end 
   
endfunction


class bad_xtn extends write_xtn;
   //....................FACTORY REGISTRATION.....................//
   `uvm_object_utils(bad_xtn)

   rand xtn_type trans_type;
	
   //constraint valid_trans { trans_type== BAD_XTN;} 
   extern function new(string name ="bad_xtn");
   extern function void post_randomize();
   extern function void do_print(uvm_printer printer);


endclass

function bad_xtn::new(string name ="bad_xtn");
   super.new(name);
endfunction

function void bad_xtn :: post_randomize();
	   parity = $random;
endfunction

//-----------------  do_print method  -------------------//
function void  bad_xtn::do_print (uvm_printer printer);
   super.do_print(printer); 
   //                   string name   				bitstream value    	 size       radix for printing
   	  
   printer.print_generic( "trans_type", 		"xtns_type",		$bits(trans_type),		trans_type.name);
endfunction


