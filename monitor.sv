package pkg;
	`include"transaction.sv"
endpackage

import pkg::*;

class monitor;

virtual intf vif;
mailbox mon2scb;
transaction trans;

function new(virtual intf vif,mailbox mon2scb);
	this.vif = vif;
	this.mon2scb = mon2scb;
	trans = new();
endfunction

task main();
  forever
  
		begin
          repeat(1)@(posedge vif.clk);
				trans.d = vif.d;
				trans.res = vif.res;
          		trans.pres = vif.pres;
				trans.q = vif.q;
				
          @(posedge vif.clk);
				mon2scb.put(trans);
				trans.display("[monitor]");
			
		end
endtask
endclass
