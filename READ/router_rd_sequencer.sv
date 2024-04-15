/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   router_rd_sequencer.sv

Description			:		Read sequencer class for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
class router_rd_sequencer extends uvm_sequencer #(read_xtn);

   // Factory registration using `uvm_component_utils
	 `uvm_component_utils(router_rd_sequencer)


   // Standard UVM Methods:
	 extern function new(string name = "router_rd_sequencer",uvm_component parent);
endclass

//-----------------  constructor new method  -------------------//
function router_rd_sequencer::new(string name="router_rd_sequencer",uvm_component parent);
   super.new(name,parent);
endfunction



