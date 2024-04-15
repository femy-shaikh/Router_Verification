/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   router_wr_agt_config.sv

Description			:		Write agent configuration class for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
class router_wr_agt_config extends uvm_object;

   // UVM Factory Registration Macro
   `uvm_object_utils(router_wr_agt_config)

   // Declare the virtual interface handle vif
   virtual router_if vif;
   static int drv_data_count = 0;
   static int mon_data_count = 0;

   //----------------SET UVM ACTIVE------------------//
   uvm_active_passive_enum is_active = UVM_ACTIVE;

   // Standard UVM Methods
   extern function new(string name = "router_wr_agt_config");
endclass

//-----------------  constructor new method  -------------------//
function router_wr_agt_config::new(string name = "router_wr_agt_config");
   super.new(name);
endfunction
