module Lab5part1 (input D, clk, res, output QD, Qffp, Qffn);

gatedDlatch gDLatch (D, clk, Qa);
positiveDflipflop PosDFF (clk, D, res, Qffp);
negativeDflipflop NegDFF (clk, D, res, Qffn);

endmodule

module gatedDlatch (input D, clk, output reg Q);

always @ (D, clk)
if (clk==1)
Q = D;
endmodule

module gatedDlatch1 (input A, B, output reg f)

always @ (A, B)
if (A==1)
begin 
	if (B==0)
	f = 0;
	else
	f = 1; 
end
endmodule

module positiveDflipflop (input clk, D, r, output reg Q);

always @ (posedge clk)
if (!r)
Q <= 1'b0;
else
Q<=D;

endmodule

module negativeDflipflop (input clk, D, r, output reg Q)

always @ (negedge clk)
if (!r)
Q <= 1'b0;
else
Q <= D;

endmodule

