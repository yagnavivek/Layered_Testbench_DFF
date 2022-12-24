package pkg;
	`include"transaction.sv"
endpackage

import pkg::*;

`include"generator.sv"
`include"driver.sv"
`include"monitor.sv"
`include"scoreboard.sv"

class environment;
	generator gen;
	driver driv;
	monitor mon;
	scoreboard scb;
	
	mailbox gen2driv;
	mailbox mon2scb;
	
	virtual intf vif;
	
	function new(virtual intf vif);
		this.vif = vif;
		
		gen2driv = new();
		mon2scb = new();
		
		gen = new(gen2driv);
		driv = new(vif,gen2driv);
		mon = new(vif,mon2scb);
		scb = new(mon2scb);
		
	endfunction
	
	task test();
		fork 
			gen.main();
			gen.displaycoverage();
			driv.main();
			mon.main();
			scb.main();
		join_any
	endtask;
	
	task post_test();
		wait(gen.ended.triggered);
		wait(gen.count == driv.no_transactions);
     wait(gen.count == scb.no_transactions);
	endtask
	
	task run();
		test();
		post_test();
		$display("------------------------------------------------------");
		$finish;
	endtask
	
endclass

	
			