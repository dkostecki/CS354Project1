module two_input_mux(S,I0,I1,Y);
	input S,I0,I1;
	output Y;
	wire x,y;
	and g1 (x,I0,!S),
		g2 (y,I1,S);
	or	g4 (Y,x,y);
endmodule

module test;
	reg s,i0,i1; // Reg for inputs 
	wire y;    // Wire for outputs
	
	two_input_mux T(s,i0,i1,y);
	
	initial
		begin
			$display("Time S I0 I1 Y"); 
           s=0; i0=0; i1=0; 
       #10 s=0; i0=0; i1=1; 
       #10 s=0; i0=1; i1=0; 
       #10 s=0; i0=1; i1=1; 
       #10 s=1; i0=0; i1=0; 
       #10 s=1; i0=0; i1=1; 
       #10 s=1; i0=1; i1=0; 
       #10 s=1; i0=1; i1=1;   
	end

   initial 
		$monitor("%4d %b %b  %b  %b",$time,s,i0,i1,y);

endmodule
