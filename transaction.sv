class transaction;

randc bit d,res,pres;
bit q;

covergroup cg;
	cover_d : coverpoint d{bins b1[2] = {[0:1]};}
	cover_res: coverpoint res{bins b2[2] = {[0:1]};}
  cover_pres: coverpoint pres{bins b3[2] = {[0:1]};}
	cross_cover : cross cover_d,cover_res,cover_pres;
endgroup

function new();
		cg = new();
endfunction

function void display(string name);
  
  $display("******************************************");
  //$display("time = %0t, %s",$time,name);
  $display("End of %s",name);
  $display("d = %0b , res = %0b , q = %0b\n",d,res,q);
	
endfunction

endclass

