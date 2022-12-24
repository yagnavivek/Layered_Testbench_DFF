`include"environment.sv"

program test(intf.TB intf_f);
	environment env;
	initial
		begin
          env = new(intf_f);
			env.gen.count = 30;
			env.run();
			
		end
endprogram

