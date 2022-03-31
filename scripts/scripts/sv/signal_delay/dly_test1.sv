module dly_test1 (
  input wire clk,
  input wire sig,
  output reg sig_dly
);

always @(posedge clk)
  sig_dly <= repeat (5-1) @(posedge clk) sig;

endmodule
