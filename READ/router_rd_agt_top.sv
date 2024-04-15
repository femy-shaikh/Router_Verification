/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:  router_router_rd_agt_top.sv

Description			:		Read agent top class for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
class router_rd_agt_top extends uvm_env;

   // Factory Registration
	 `uvm_component_utils(router_rd_agt_top)
    
   // Create the agent handle
   router_rd_agent agnth[]; 
   router_env_config m_cfg;
   

   // Standard UVM Methods:
	 extern function new(string name = "router_rd_agt_top" , uvm_component parent);
	 extern function void build_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//
function router_rd_agt_top::new(string name = "router_rd_agt_top" , uvm_component parent);
	 super.new(name,parent);
endfunction
    
//-----------------  build() phase method  -------------------//
function void router_rd_agt_top::build_phase(uvm_phase phase);
 	 super.build_phase(phase);
	 if(!uvm_config_db #(router_env_config)::get(this,"","router_env_config",m_cfg))
	    `uvm_fatal(get_type_name,"Env: read error")
	 agnth = new[m_cfg.no_of_read_agent];
	 
	 foreach(agnth[i])
			begin
	       agnth[i] = router_rd_agent::type_id::create($sformatf("agnth[%0d]",i),this);
	       uvm_config_db #(router_rd_agt_config)::set(this,$sformatf("agnth[%0d]*",i),"router_rd_agt_config",m_cfg.rd_agt_cfg[i]);	
		  end
endfunction

 


