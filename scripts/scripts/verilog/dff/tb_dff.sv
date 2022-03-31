module tb_dff ();

bit  clk;
bit  rst_n;
bit  d;
wire q;

always #5 clk = ~clk;

initial begin
  $monitor(clk, rst_n, d, q);
      rst_n = 1'b0;
  #10 rst_n = 1'b1;

  #1000 $finish();
end

initial begin
  $dumpfile("tb_dff.vcd");
  $dumpvars(0,tb_dff);
end


always #6 d = $random();

dff dut (.*);

endmodule
