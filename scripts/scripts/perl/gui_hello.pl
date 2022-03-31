#!/usr/bin/perl -w

use strict;

use Tk;

my $main = MainWindow->new();
$main->configure(
  -title => "Hello World",
);
$main->geometry('300x100');

my $label = $main->Label(
  -text => "Hello, world!",
)->pack(qw/-fill both -expand 1/);

MainLoop();
