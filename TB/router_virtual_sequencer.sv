/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   router_virtual_sequencer.sv

Description			:		Virtual sequencer class for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
class router_virtual_sequencer extends uvm_sequencer #(uvm_sequence_item) ;
   
   // Factory Registration
	 `uvm_component_utils(router_virtual_sequencer)

   // Declare dynamic array of handles for router_wr_sequencer and router_rd_sequencer as wr_seqrh[] & rd_seqrh[]

	 router_wr_sequencer wr_seqrh[];
	 router_rd_sequencer rd_seqrh[];

   // Declare handle for router_env_config 
   router_env_config m_cfg;


   // Standard Methods:
 	 extern function new(string name = "router_virtual_sequencer",uvm_component parent);
	 extern function void build_phase(uvm_phase phase);
endclass

// Define Constructor new() function
function router_virtual_sequencer::new(string name="router_virtual_sequencer",uvm_component parent);
	 super.new(name,parent);
endfunction

// function void build_phase

function void router_virtual_sequencer::build_phase(uvm_phase phase);
	 super.build_phase(phase);
	 // get the config object using uvm_config_db 
	 if(!uvm_config_db #(router_env_config)::get(this,"","router_env_config",m_cfg))
		  `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")		
   wr_seqrh = new[m_cfg.no_of_write_agent];
   rd_seqrh = new[m_cfg.no_of_read_agent];
endfunction
