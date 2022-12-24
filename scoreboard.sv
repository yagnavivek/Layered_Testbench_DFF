package pkg;
	`include"transaction.sv"
endpackage

import pkg::*;

class scoreboard;

mailbox mon2scb;
transaction trans;
int no_transactions;

function new(mailbox mon2scb);
	this.mon2scb = mon2scb;
endfunction

task main();
	forever
  
		begin
			mon2scb.get(trans);
			trans.display("[scoreboard]");
          if(trans.res == 0)begin
            if(trans.pres==1)
              begin
                if(trans.q==1)
                  begin
                    $display("\n time = %0t : Result is as expected when res =0 and pres = 1 in scoreboard",$time);
				end
				
				else begin
                  $display("time = %0t :Error occured at res = 0 and pres=1 in scoreboard",$time);end
              end
            
                
          else
			begin	
				if(trans.q == trans.d)
					begin
                      $display("\n time:%0t ,result is as expected \n",$time);
					end
					
				else
                  $display("\n Error at res =1 in scoreboard \n");
			end
          end
          
			
          if(trans.res == 1)
			begin
				if(trans.q == 0)
				begin
                  $display("\n time = %0t : Result is as expected when res =0 in scoreboard",$time);
				end
				
				else
                  $display("time = %0t :Error occured at res = 0 in scoreboard",$time);
			end
			
			
			no_transactions++;
		end
endtask
endclass
