#!/usr/bin/perl

while(<>) {
  push @p, $_;
  $j++ if  @p > 1 and $p[@p-1] > $p[@p-2];
  $k++ if  @p > 3 and $p[@p-3] + $p[@p-2] + $p[@p-1] > $p[@p-4] + $p[@p-3] + $p[@p-2];
}

warn $j;
warn $k;
