#!/bin/bash

rm tb_dff.vcd a.out

iverilog -g2005-sv tb_dff.sv dff.v

./a.out
