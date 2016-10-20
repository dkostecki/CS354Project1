module majority(A,B,C,O);
	input A,B,C;
	output O;
	wire x,y,z,q;
	and g1 (x,A,B),
		g2 (y,A,C),
		g3 (z,B,C);
	or	g4 (q,x,y),
		g5 (O,q,z);
endmodule

module test;
	reg A,B,C; // Reg for inputs 
	wire O;    // Wire for outputs
	
	majority M(A,B,C,O);
	
	initial
		begin
			$display("Time A B C O"); 
			A=0; B=0; C=0; 
		#10 A=0; B=0; C=1; 
		#10 A=0; B=1; C=0; 
		#10 A=0; B=1; C=1; 
		#10 A=1; B=0; C=0; 
		#10 A=1; B=0; C=1; 
		#10 A=1; B=1; C=0; 
		#10 A=1; B=1; C=1; 
	end

   initial 
		$monitor("%4d %b %b %b %b",$time,A,B,C,O);

endmodule
