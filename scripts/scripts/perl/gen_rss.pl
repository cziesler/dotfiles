#!/usr/bin/perl

use XML::RSS;
my $rss = new XML::RSS (version => '1.0');
$rss->channel(
  title        => "freshmeat.net",
  link         => "http://freshmeat.net",
  description  => "the one-stop-shop for all your Linux software needs",
  dc => {
    date       => '2000-08-23T07:00+00:00',
    subject    => "Linux Software",
    creator    => 'scoop@freshmeat.net',
    publisher  => 'scoop@freshmeat.net',
    rights     => 'Copyright 1999, Freshmeat.net',
    language   => 'en-us',
  },
  syn => {
    updatePeriod     => "hourly",
    updateFrequency  => "1",
    updateBase       => "1901-01-01T00:00+00:00",
  },
  taxo => [
    'http://dmoz.org/Computers/Internet',
    'http://dmoz.org/Computers/PC'
  ]
);

 $rss->image(
   title  => "freshmeat.net",
   url    => "http://freshmeat.net/images/fm.mini.jpg",
   link   => "http://freshmeat.net",
   dc => {
     creator  => "G. Raphics (graphics at freshmeat.net)",
   },
 );

 $rss->add_item(
   title       => "GTKeyboard 0.85",
   link        => "http://freshmeat.net/news/1999/06/21/930003829.html",
   description => "GTKeyboard is a graphical keyboard that ...",
   dc => {
     subject  => "X11/Utilities",
     creator  => "David Allen (s2mdalle at titan.vcu.edu)",
   },
   taxo => [
     'http://dmoz.org/Computers/Internet',
     'http://dmoz.org/Computers/PC'
   ]
 );

 $rss->textinput(
   title        => "quick finder",
   description  => "Use the text input below to search freshmeat",
   name         => "query",
   link         => "http://core.freshmeat.net/search.php3",
 );

 print $rss->as_string;
 
 # or save it to a file
 $rss->save("fm.rss");
 
