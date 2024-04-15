/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   router_wr_agent.sv

Description			:		Write agent class for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
// Extend router_wr_agent from uvm_agent
class router_wr_agent extends uvm_agent;

   // Factory Registration
	 `uvm_component_utils(router_wr_agent)

   // Declare handle for configuration object
   router_wr_agt_config m_cfg;
       
   // Declare handles of router_wr_monitor,router_wr_sequencer and router_wr_driver
	 router_wr_monitor monh;
	 router_wr_sequencer m_sequencer;
	 router_wr_driver drvh;


   // Standard UVM Methods:
   extern function new(string name = "router_wr_agent", uvm_component parent = null);
   extern function void build_phase(uvm_phase phase);
   extern function void connect_phase(uvm_phase phase);
endclass 

//-----------------  constructor new method  -------------------//
function router_wr_agent::new(string name = "router_wr_agent",uvm_component parent = null);
   super.new(name, parent);
endfunction
     
  
//-----------------  build() phase method  -------------------//
function void router_wr_agent::build_phase(uvm_phase phase);
	 super.build_phase(phase);
   // get the config object using uvm_config_db 
 	 if(!uvm_config_db #(router_wr_agt_config)::get(this,"","router_wr_agt_config",m_cfg))
	    `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
	 monh=router_wr_monitor::type_id::create("monh",this);	
	 if(m_cfg.is_active==UVM_ACTIVE)
			begin
				 drvh=router_wr_driver::type_id::create("drvh",this);
				 m_sequencer=router_wr_sequencer::type_id::create("m_sequencer",this);
			end
endfunction

      
//-----------------  connect() phase method  -------------------//
	      
function void router_wr_agent::connect_phase(uvm_phase phase);
 	 if(m_cfg.is_active==UVM_ACTIVE)
			begin
				 drvh.seq_item_port.connect(m_sequencer.seq_item_export);
  		end
endfunction
   

