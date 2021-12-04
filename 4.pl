#!/usr/bin/perl

$l = 5;

while(<>) {
  chomp;
  s/^\s+//;
  @n = split /,/ and next unless @n;
  push @b, split / +/;
}

@bs = map {0} 0..$#b/$l/$l;

foreach $n (@n) {
  @h = map {$b[$_] == $n || $h[$_] ? 1 : 0} 0..$#b;
  for $j (0..$#b) {
    next unless $h[$j];
    $cs = int($j / $l) * $l;
    $ch = grep {$h[$_]} $cs..$cs+$l-1;

    $b = int($j / ($l * $l));
    $rs = ($b * $l * $l) + ($r) + ($j % $l);
    $rh = grep {$h[$_]} map {$rs+$_*$l} 0..$l-1;

    next unless $ch == 5 or $rh == 5;

    $sum = 0;
    map {$sum+=$_} map {!$h[$_] ? $b[$_] : 0} $b*$l*$l..($b+1)*$l*$l-1;
    warn $sum * $n and $w = 1 unless $w;
    $bs[$b]++;
    die $sum * $n unless grep {$_==0} @bs;
  }
}
