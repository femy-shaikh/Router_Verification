/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename				:   top.sv

Description			:		Top module 
  
Author Name			:   Shanthi V A

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version					:		1.0

************************************************************************/
module top;
   // Import packages
	 import router_pkg::*;
   import uvm_pkg::*;

   // Generate clock signal
	 bit clock;  

   initial
      begin
         forever
		        #10 clock= ~clock;
      end     

   // Instantiate interface instances 
   router_if in(clock);
   router_if in0(clock);
   router_if in1(clock);
   router_if in2(clock);
     
   // Instantiate rtl and pass the interface instance as argument
   router_top DUV(.clock(clock),
			            .resetn(in.rst),
			            .packet_valid(in.pkt_valid),
			            .data(in.data_in),
			            .err(in.error),
			            .busy(in.busy),
			            .read_enb_0(in0.read_enb),
			            .vld_out_0(in0.v_out),
			            .data_out_0(in0.data_out),
			            .read_enb_1(in1.read_enb),
			            .vld_out_1(in1.v_out),
			            .data_out_1(in1.data_out),
			            .read_enb_2(in2.read_enb),
			            .vld_out_2(in2.v_out),
			            .data_out_2(in2.data_out));

   // In initial block
   initial 
	    begin
         //set the virtual interface instances as strings vif_0,vif_1,vif_2,vif_3 using the uvm_config_db
   	     uvm_config_db #(virtual router_if)::set(null,"*","vif",in);
	       uvm_config_db #(virtual router_if)::set(null,"*","vif_0",in0);
	       uvm_config_db #(virtual router_if)::set(null,"*","vif_1",in1);
	       uvm_config_db #(virtual router_if)::set(null,"*","vif_2",in2);
 
         // Call run_test
	       run_test();
      end

   property pkt_vld;
      @(posedge clock)
      $rose(in.pkt_valid) |=> in.busy;
   endproperty

   A1: assert property (pkt_vld);

   property stable;
      @(posedge clock)
      in.busy |=> $stable(in.data_in);
   endproperty

   A2: assert property (stable);

   property read1;
      @(posedge clock)
      $rose(in1.v_out) |=> ## [0:29] in1.read_enb;
   endproperty

   R1:assert property(read1);

   property read2;
      @(posedge clock)
      $rose(in2.v_out) |=> ## [0:29] in2.read_enb;
   endproperty

   R2:assert property(read2);

   property read3;
      @(posedge clock)
      $rose(in0.v_out) |=> ## [0:29] in0.read_enb;
   endproperty

   R3:assert property(read3);


   property valid1;
      bit[1:0]addr;
      @(posedge clock)
      ( $rose(in.pkt_valid),addr = in.data_in[1:0]) ##3 (addr==0) |->in0.v_out;
   endproperty
 
   property valid2;
      bit[1:0]addr;
      @(posedge clock)
      ( $rose(in.pkt_valid),addr = in.data_in[1:0]) ##3 (addr==1) |->in1.v_out;
   endproperty

   property valid3;
      bit[1:0]addr;
      @(posedge clock)
      ( $rose(in.pkt_valid),addr = in.data_in[1:0]) ##3 (addr==2) |->in2.v_out;
   endproperty

   property valid;
      @(posedge clock)
      $rose(in.pkt_valid)|-> ##3 in0.v_out | in2.v_out |in1.v_out;
   endproperty

   V: assert property(valid);
   V1: assert property(valid1);
   V2: assert property(valid2);
   V3: assert property(valid3);

   property read_1;
      bit[1:0]addr;
      @(posedge clock)
      in1.v_out ##1 !in1.v_out |=> $fell(in1.read_enb);
  endproperty
 
  property read_2;
     bit[1:0]addr;
     @(posedge clock)
     in2.v_out ##1 !in2.v_out |=> $fell(in2.read_enb);
  endproperty

  property read_3;
     bit[1:0]addr;
     @(posedge clock)
     (in0.v_out)  ##1 !in0.v_out |=> $fell(in0.read_enb);
  endproperty

  RR1:assert property(read_1);
  RR2:assert property(read_2);
  RR3:assert property(read_3);

endmodule
