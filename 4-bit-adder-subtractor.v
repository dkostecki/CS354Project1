module bit_adder(X,Y,Z,S,C);
	input X,Y,Z;
	output S,C;
	wire a,b,c,d,e;
	xor		g1(a,X,Y),
			g2(S,a,Z);
	and		g3(b,X,Y),
			g4(c,X,Z),
			g5(d,Y,Z);
	or		g6(e,b,c),
			g7(C,e,d);
endmodule

module add_sub(M,A0,A1,A2,A3,B0,B1,B2,B3,S0,S1,S2,S3,C,V);
	input M,A0,A1,A2,A3,B0,B1,B2,B3;
	output S0,S1,S2,S3,C,V;
	wire a,b,c,d,c0,c1,c2,c3;
	xor 	g1(a,B0,M),
			g2(b,B1,M),
			g3(c,B2,M),
			g4(d,B3,M);
	bit_adder 	add0(A0,M,a,S0,c0),
				add1(A1,c0,b,S1,c1),
				add2(A2,c1,c,S2,c2),
				add3(A3,c2,d,S3,c3);
	and		g5(C,c3,c3);
	xor		g6(V,c3,c2);
endmodule

module test;
	reg signed M,A0,A1,A2,A3,B0,B1,B2,B3; // Reg for inputs 
	wire signed S0,S1,S2,S3,C,V;    // Wire for outputs
	
	add_sub out(M,A0,A1,A2,A3,B0,B1,B2,B3,S0,S1,S2,S3,C,V);
	
	initial
		begin
			$display("Time M 	A0 A1 A2 A3 B0 B1 B2 B3 	S0 S1 S2 S3 	C V"); 
           M=0; A0=1; A1=0; A2=1; A3=1; B0=0; B1=0; B2=1; B3=1; //1110
       #10 M=0; A0=0; A1=1; A2=0; A3=1; B0=1; B1=0; B2=1; B3=0; //1111
       #10 M=0; A0=1; A1=1; A2=1; A3=1; B0=0; B1=0; B2=0; B3=1; //c
       #10 M=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0; 
       #10 M=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0; 
       #10 M=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0; 
       #10 M=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0; 
       #10 M=0; A0=0; A1=0; A2=0; A3=0; B0=0; B1=0; B2=0; B3=0;  
	end

   initial 
		$monitor("%4d %b	 %b  %b  %b  %b  %b  %b  %b  %b 	%b  %b  %b  %b 	%b %b",$time,M,A0,A1,A2,A3,B0,B1,B2,B3,S0,S1,S2,S3,C,V);

endmodule
