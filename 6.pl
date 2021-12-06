#!/usr/bin/perl

while(<>) {
  map {$p[$_]++} split/,/;
}

sub r {
  map {$p[8]=shift(@p);$p[6]+=$p[8]} shift..shift and @p;
}

grep {$s+=$_} r(0,79);
grep {$s2+=$_} r(80,255);
warn $s;
warn $s2;
