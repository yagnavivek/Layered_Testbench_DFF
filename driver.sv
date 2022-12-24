package pkg;
	`include"transaction.sv"
endpackage

import pkg::*;

class driver;

int no_transactions;
  virtual intf vif;
mailbox gen2driv;

transaction trans;

  function new(virtual intf vif,mailbox gen2driv);
	this.vif = vif;
	this.gen2driv = gen2driv;
endfunction

task main();
	forever
  
		begin
			gen2driv.get(trans);
			
          @(posedge vif.clk);
				vif.d <= trans.d;
				vif.res <= trans.res;
          		vif.pres<=trans.pres;
				
          @(posedge vif.clk);
				trans.display("[driver]");
				no_transactions++;
				
		end
endtask

endclass

	