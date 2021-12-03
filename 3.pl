#!/usr/bin/perl

while(<>) {
  chomp;
  push @q, $_;
  for $i (0..length) {
    $p[$i]++ if (split //)[$i] eq '1';
  }
}

foreach (@p) {
  $d = $d << 1;
  $e = $e << 1;
  $d++ if $_ > @q/2;
  $e++ if $_ < @q/2;
}

%o = %g = map { $_ => 1 } @q;
@r = @p = ($p[0]);
for $i (0..length($q[0])) {
  $l = keys(%g);
  foreach (keys(%g)) {
    last if $l == 1;
    $c = (split //)[$i];
    delete $g{$_} and next unless ($c eq '1' and $p[$i] >= $l / 2) or ($c eq '0' and $p[$i] < $l / 2);
    $p[$i+1]++ if (split //)[$i+1] eq '1';
  }
  $l = keys(%o);
  foreach (keys(%o)) {
    last if $l == 1;
    $c = (split //)[$i];
    delete $o{$_} and next unless ($c eq '1' and $r[$i] < $l / 2) or ($c eq '0' and $r[$i] >= $l / 2);
    $r[$i+1]++ if (split //)[$i+1] eq '1';
  }
}

warn $d * $e;
warn oct("0b" . (keys(%g))[0]) * oct("0b" . (keys(%o))[0]);
