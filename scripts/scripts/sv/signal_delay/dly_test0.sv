module dly_test0 (
  input wire clk,
  input wire sig,
  output bit sig_dly
);

bit sig_d1, sig_d2, sig_d3, sig_d4;
always @(posedge clk) begin
  sig_d1 <= sig;
  sig_d2 <= sig_d1;
  sig_d3 <= sig_d2;
  sig_d4 <= sig_d3;
  sig_dly <= sig_d4;
end

endmodule
