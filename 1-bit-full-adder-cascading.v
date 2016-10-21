module full_adder_cascading(A,B,S,C);
	input A,B;
	output S,C;
	xor g1 (S,A,B);
	and	g2 (C,A,B);
endmodule

module test;
	reg A,B; // Reg for inputs 
	wire S,C;    // Wire for outputs
	
	full_adder_cascading M(A,B,S,C);
	
	initial
		begin
			$display("Time A B S C"); 
			A=0; B=0; 
		#10 A=0; B=1; 
		#10 A=1; B=0; 
		#10 A=1; B=1; 
	end

   initial 
		$monitor("%4d %b %b %b %b",$time,A,B,S,C);

endmodule
