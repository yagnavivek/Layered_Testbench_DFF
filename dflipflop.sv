module dflipflop(intf.DUT tf);

always_ff @(posedge tf.clk)

begin

if(tf.res)
	begin tf.q <= 1'b0; end

  else if(tf.pres)
    begin tf.q <= 1'b1; end
  
  else
    tf.q<=tf.d;
		
end
endmodule