#!/usr/bin/perl

while(<>) {
  chomp;
  map {push @p, $_} split /,/;
}

$n = (sort {$a <=> $b} @p)[@p/2];
grep {$s+=$_} map {abs($_ - $n)} @p;
warn $s;

grep {$s2+=$_} @p;
$n = int($s2/scalar(@p)+0.25);
map {map {$s3+=$_} 0..$_ } map {abs($_-$n)} @p;
warn $s3;
