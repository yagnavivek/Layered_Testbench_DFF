interface intf(input logic clk);
  logic d,res,pres,q;
 
  clocking cb @(posedge clk);
   input q;
   output d,res,pres;
  endclocking
 
  modport TB (clocking cb);
    modport DUT (input d,res,pres,clk,output q);
endinterface