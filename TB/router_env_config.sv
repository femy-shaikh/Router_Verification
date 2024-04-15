/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   router_env_config.sv

Description			:		Environment configuration class for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
class router_env_config extends uvm_object;

   bit has_wagent = 1;
   bit has_ragent = 1;
   int no_of_write_agent = 1;
   int no_of_read_agent =3;
   int no_of_duts =1;
   bit has_virtual_sequencer = 1;
   bit has_scoreboard =1;
   
   router_wr_agt_config wr_agt_cfg[];
   router_rd_agt_config rd_agt_cfg[];
	 
   // UVM Factory Registration Macro
   `uvm_object_utils(router_env_config)

   // Standard UVM Methods:
   extern function new(string name = "router_env_config");
endclass

//-----------------constructor------------------//

function router_env_config::new(string name = "router_env_config");
   super.new(name);
endfunction


