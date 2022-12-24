
`include"interface.sv"
`include"test.sv"

module testbench_top;
	bit clk;
	always #5 clk = ~clk;
	intf intf_f(clk);
	test t1(intf_f);

	dflipflop dut(intf_f);
endmodule