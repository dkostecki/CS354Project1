module conditional_inverter(Mode,Y,O);
	input Mode,Y;
	output O;
	wire x,y;
	and g1 (x,!Mode,Y),
		g2 (y,Mode,!Y);
	or	g4 (O,x,y);
endmodule

module test;
	reg M,Y; // Reg for inputs 
	wire O;    // Wire for outputs
	
	conditional_inverter C(M,Y,O);
	
	initial
		begin
			$display("Time M Y O"); 
			M=0; Y=0; 
		#10 M=0; Y=1; 
		#10 M=1; Y=0; 
		#10 M=1; Y=1; 
	end

   initial 
		$monitor("%4d %b %b %b",$time,M,Y,O);

endmodule
