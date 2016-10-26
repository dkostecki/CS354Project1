module add(X,Y,Z,S,C);
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

module test;
	reg X,Y,Z; // Reg for inputs 
	wire S,C;    // Wire for outputs
	
	add M(X,Y,Z,S,C);
	
	initial
		begin
			$display("Time X Y Z S C"); 
           X=0; Y=0; Z=0; 
       #10 X=0; Y=0; Z=1; 
       #10 X=0; Y=1; Z=0; 
       #10 X=0; Y=1; Z=1; 
       #10 X=1; Y=0; Z=0; 
       #10 X=1; Y=0; Z=1; 
       #10 X=1; Y=1; Z=0; 
       #10 X=1; Y=1; Z=1;  
	end

   initial 
		$monitor("%4d %b %b %b %b %b",$time,X,Y,Z,S,C);

endmodule
