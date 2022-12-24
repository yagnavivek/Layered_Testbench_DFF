package pkg;
`include"transaction.sv"
endpackage

import pkg::*;

class generator;
	 transaction trans;
	mailbox gen2driv;
	event ended;
	int count ;
	
	
	function new(mailbox gen2driv);
		this.gen2driv = gen2driv;
		trans = new();
	endfunction
	
	task main();
		repeat(count)
			begin
				if(!trans.randomize())
					$fatal("generator randomisation is failed");
				
              trans.randomize();
				trans.display("[generator]");
				trans.cg.sample();
				gen2driv.put(trans);
				
			end
		->ended;
	endtask
	
	task displaycoverage();
		wait(ended.triggered());
		$display("**************coverage = %0f *******************",trans.cg.get_coverage());
	endtask
	
endclass

		