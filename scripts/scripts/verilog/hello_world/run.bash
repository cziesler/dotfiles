#!/bin/bash

rm a.out

iverilog -g2005 hello_world.v

./a.out
