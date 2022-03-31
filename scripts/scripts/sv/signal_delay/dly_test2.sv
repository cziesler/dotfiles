module dly_test2 (
  input wire clk,
  input wire sig,
  input int dly,
  output reg sig_dly
);

always @(posedge clk)
  sig_dly <= repeat (dly-1) @(posedge clk) sig;

endmodule
