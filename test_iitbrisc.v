`timescale 1ns/1ns
module test_iitbrisc;
reg clk;
reg reset;
integer k;

iitb_risc risc_p (clk, reset);


initial
 begin
reset = 1;
#5
reset = 0;
 end

initial
 begin
 
 clk = 0;
 repeat (60)
 begin
 #10 clk = 1;
 #10 clk = 0;
 end
 end
 
 initial
	begin
//	for (k=0; k<8; k=k+1)
//	risc_p.REGR[k] = k;

   risc_p.REGR[0]=16'h0005;
	risc_p.REGR[1]=16'h0005;
	risc_p.REGR[2]=16'h0005;
	risc_p.REGR[3]=16'h0005;
	risc_p.REGR[4]=16'h000c;
	risc_p.REGR[5]=16'h0007;
	risc_p.REGR[6]=16'h0008;
	risc_p.REGR[7]=16'h0000;
	
	for (k=0; k<35; k=k+1)
	risc_p.DMEM[k] = k+1;
   //risc_p.DMEM[7] = 16'h00ab;
	
	
	//risc_p.IMEM[0] = 16'h02a8;
	//risc_p.IMEM[1] = 16'h396d;
	//risc_p.IMEM[2] = 16'h0728;
	//risc_p.IMEM[0] = 16'h0bb8;
	//risc_p.IMEM[1] = 16'h0b9a;
	risc_p.IMEM[0] = 16'h60ae;
//	risc_p.IMEM[1] = 16'h0050;
//	risc_p.IMEM[2] = 16'h04e0;
//	risc_p.IMEM[3] = 16'h0528;
	//risc_p.IMEM[11] = 16'h0408;
	//risc_p.IMEM[12] = 16'hc148;
	//risc_p.IMEM[13] = 16'h0000;
	//risc_p.IMEM[14] = 16'h0000;
	//risc_p.IMEM[4] = 16'h2ce1;
	//risc_p.IMEM[5] = 16'h2112;


	#231
	 for(k=0; k<8; k=k+1)
	 $display ("R%1d = %h",k, risc_p.REGR[k]);
	 
	$display ("DMEM[%1d] = %2d", 0, risc_p.DMEM[0]);
	$display ("DMEM[%1d] = %2d", 1, risc_p.DMEM[1]);
	$display ("DMEM[%1d] = %2d", 2, risc_p.DMEM[2]);
	$display ("DMEM[%1d] = %2d", 3, risc_p.DMEM[3]);
	$display ("DMEM[%1d] = %2d", 4, risc_p.DMEM[4]);
	$display ("DMEM[%1d] = %2d", 5, risc_p.DMEM[5]);
	$display ("DMEM[%1d] = %2d", 6, risc_p.DMEM[6]);
	$display ("DMEM[%1d] = %2d", 7, risc_p.DMEM[7]);
	$display ("DMEM[%1d] = %2d", 8, risc_p.DMEM[8]);
	$display ("DMEM[%1d] = %2d", 9, risc_p.DMEM[9]);
   
	$display ("opcode1 = %h",risc_p.IF_ID_IR);
	$display ("opcode2 = %h",risc_p.ID_RR_IR);
	$display ("opcode3 = %h",risc_p.RR_EX_IR);
	$display ("opcode4 = %h",risc_p.EX_MEM_IR);
	$display ("opcode5 = %h",risc_p.MEM_WB_IR);
	$display ("EXMEMCARRYOUT = %h",risc_p.EX_MEM_COUT);
	
	$display ("LOAD = %2d",risc_p.LOAD_FLAG);
	$display ("HALT = %2d",risc_p.HALT_FLAG);
	$display ("ALU = %h",risc_p.EX_MEM_COND);
	$display ("LM = %h",risc_p.LM_FLAG);
	$display ("SM = %h",risc_p.SM_FLAG);
	$display ("R_EX_T2 = %h",risc_p.RR_EX_T2);
	$display ("stall0 = %2d",risc_p.IF_ID_STALL);
	$display ("stall1 = %2d",risc_p.ID_RR_STALL);
	$display ("stall2 = %2d",risc_p.RR_EX_STALL);
	$display ("stall3 = %2d",risc_p.EX_MEM_STALL);
	$display ("stall3 = %2d",risc_p.MEM_WB_STALL);
	$display ("IFIDTAKEN_BRANCH = %2d",risc_p.IF_ID_TKN_BRNCH);
	$display ("IDRRTAKEN_BRANCH = %2d",risc_p.ID_RR_TKN_BRNCH);
	$display ("RREXTAKEN_BRANCH = %2d",risc_p.RR_EX_TKN_BRNCH);
	$display ("EXMEMTAKEN_BRANCH = %2d",risc_p.EX_MEM_TKN_BRNCH);
	$display ("MEMWBTAKEN_BRANCH = %2d",risc_p.MEM_WB_TKN_BRNCH);
	$display ("MPC0 = %2d",risc_p.IF_ID_MPC);
	$display ("MPC1 = %2d",risc_p.ID_RR_MPC);
	$display ("MPC2 = %2d",risc_p.RR_EX_MPC);
	//$display ("MPC3 = %2d",risc_p.EX_MEM_MPC);
	//$display ("MPC4 = %2d",risc_p.MEM_WB_MPC);
	//$display ("TMP_VAL = %2d",risc_p.MEM_WB_TMP);
	
	//$display ("MPC = %2d",risc_p.IF_ID_MPC);
	
	end
	
	initial
		begin
		 $dumpfile ("risc.vcd");
		 $dumpvars (0, test_iitbrisc);
		 #231 $finish;
		end
		
endmodule