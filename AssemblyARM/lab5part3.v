module tflipflop (input clk, T, output Q)

always (posedge clk)
if (T == 1)
	Q = ~Q;

endmodule 

module lab5part3 (input clk, reset, KEY0, [1:0]SW, en, output [7:0]Q, HEX0, HEX1)

clk = KEY[0];
en = SW[1];
reset = SW[0];
HEX0 = Q[3:0];
HEX1 = Q[7:4];


wire [7:0]Q;
always @ (negedge reset, posedge clk)
if (reset == 0)
	Q[7:0] <= 7b'0;
else
	tflipflop U0  (clk, en, Q[0]);
	tflipflop U1  (clk, en & U0, Q[1]);
	tflipflop U2  (clk, Q[1] & U1, Q[2]);
	tflipflop U3  (clk, Q[2] & U2, Q[3]);
	tflipflop U4  (clk, Q[3] & U3, Q[4]);	
	tflipflop U5  (clk, Q[4] & U4, Q[5]);
	tflipflop U6  (clk, Q[5] & U5, Q[6]);
	tflipflop U7  (clk, Q[6] & U6, Q[7]);
	
endmodule

