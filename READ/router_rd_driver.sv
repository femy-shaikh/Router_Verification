/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   router_rd_driver.sv

Description			:		Read driver class for Router 1x3
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
class router_rd_driver extends uvm_driver #(read_xtn);

   //FACTORY REGISTRATION
   `uvm_component_utils(router_rd_driver) 

   //VIRTUAL INTERFACE
   virtual router_if.RDR_MP vif;

   //AGT CONFIGURATION
   router_rd_agt_config m_cfg;

   // METHODS
   extern function new(string name ="router_rd_driver",uvm_component parent);
   extern function void build_phase(uvm_phase phase);
   extern function void connect_phase(uvm_phase phase);
   extern task run_phase(uvm_phase phase);
   extern task send_to_dut(read_xtn xtn);
   extern function void report_phase(uvm_phase phase);
endclass

//Constructor

function router_rd_driver::new(string name ="router_rd_driver",uvm_component parent);
	 super.new(name,parent);
endfunction



//-----------------  build phase method  -------------------//
function void router_rd_driver::build_phase(uvm_phase phase);
	 super.build_phase(phase);
	 if(!uvm_config_db #(router_rd_agt_config)::get(this,"","router_rd_agt_config",m_cfg))
		  `uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
endfunction

//-----------------  connect phase method  -------------------//
function void router_rd_driver::connect_phase(uvm_phase phase);
   vif = m_cfg.vif;
endfunction


//-----------------  run phase method  -------------------//
task router_rd_driver::run_phase(uvm_phase phase);
   forever 
	    begin
		     seq_item_port.get_next_item(req);
		     send_to_dut(req);
		     seq_item_port.item_done();
		  end
endtask

//-----------------  Driver to DUT -------------------//

 	
task router_rd_driver::send_to_dut(read_xtn xtn);
   
      begin
		     `uvm_info("ROUTER_rd_DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW)
         @(vif.rdr_cb);
         wait(vif.rdr_cb.v_out)
				 repeat(xtn.no_of_cycles)	@(vif.rdr_cb);
				 vif.rdr_cb.read_enb <= 1;
			   wait(!vif.rdr_cb.v_out)
			   vif.rdr_cb.read_enb <= 0;
         m_cfg.drv_data_count++; 
				 @(vif.rdr_cb);

		  end 

	          
endtask

//.............. report_phase......................//
function void router_rd_driver::report_phase(uvm_phase phase);
   `uvm_info(get_type_name(),$sformatf("Report: router read driver sent %0d transactions",m_cfg.drv_data_count), UVM_LOW)
endfunction



