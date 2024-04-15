/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   router_pkgn.sv

Description			:		TB Package for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
package router_pkg;
	
   import uvm_pkg::*;
	
   `include "uvm_macros.svh"
   
	 `include "tb_defs.sv"
   `include "write_xtn.sv"
   `include "router_wr_agt_config.sv"
   `include "router_rd_agt_config.sv"
   `include "router_env_config.sv"
   `include "router_wr_driver.sv"
   `include "router_wr_monitor.sv"
   `include "router_wr_sequencer.sv"
   `include "router_wr_agent.sv"
   `include "router_wr_agt_top.sv"
   `include "router_wr_seqs.sv"

   `include "read_xtn.sv"
   `include "router_rd_driver.sv"
   `include "router_rd_monitor.sv"
   `include "router_rd_sequencer.sv"
   `include "router_rd_agent.sv"
   `include "router_rd_agt_top.sv"
   `include "router_rd_seqs.sv"


   `include "router_virtual_sequencer.sv"
   `include "router_virtual_seqs.sv"
   `include "router_scoreboard.sv"

   `include "router_env.sv"
   `include "router_test.sv"
endpackage
