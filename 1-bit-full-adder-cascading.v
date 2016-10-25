module half_adder(A,B,S,C);
	input A,B;
	output S,C;
	xor g1 (S,A,B);
	and	g2 (C,A,B);
endmodule

module add(X,Y,Z,out1,out3);
	input X,Y,Z;
	output out1,out2,out3;
	wire s,c;
	half_adder 	half1 (X,Y,s,c),
				half2 (s,Z,out1,out2);
	or			g3(out3,out2,c);
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
