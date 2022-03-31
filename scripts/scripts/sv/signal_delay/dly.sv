module tb ();

bit clk = 1'b0;
bit sig = 1'b0;
bit sig_dly0, sig_dly1;

always #5 clk <= !clk;

dly_test0 A0 (
  .clk (clk),
  .sig (sig),
  .sig_dly (sig_dly0)
);

dly_test1 A1 (
  .clk (clk),
  .sig (sig),
  .sig_dly (sig_dly1)
);

always @(posedge clk) begin
  #1;
  assert (sig_dly0 == sig_dly1) else 
    $error("sig_dly0:%b, sig_dly1:%b", sig_dly0, sig_dly1);
end

initial begin
  $dumpfile("dly.vcd");
  $dumpvars(0, tb);

  repeat(3) @(posedge clk);
  #1; sig = 1'b1;

  repeat(3) @(posedge clk);
  #1; sig = 1'b0;

  repeat(3) @(posedge clk);
  #1; sig = 1'b1;

  repeat(8) @(posedge clk);
  $finish;
end

endmodule
