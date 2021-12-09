#!/usr/bin/perl

@p = ();
while(<>) {
  chomp;
  push @{$p[@p]}, (9, split(//), 9);
}

push @{$p[0]}, split //, "9" x scalar(@{$p[1]});
push @{$p[@p]}, split //, "9" x scalar(@{$p[0]});

sub c {
  ($j,$k) = @_;
  return 1 if scalar(grep {$p[$j]->[$k] < $_} ($p[$j-1]->[$k], $p[$j+1]->[$k], $p[$j]->[$k+1], $p[$j]->[$k-1])) == 4;
  0;
}

sub c2 {
  my ($j,$k) = @_;
  my @s = ([$j,$k]);
  my $l = $p[$j]->[$k];
  return if $l == 9;
  push @s, c2($j-1, $k) if $l < $p[$j-1]->[$k];
  push @s, c2($j+1, $k) if $l < $p[$j+1]->[$k];
  push @s, c2($j, $k-1) if $l < $p[$j]->[$k-1];
  push @s, c2($j, $k+1) if $l < $p[$j]->[$k+1];
  @s;
}

for $i (0..$#p) {
  map { $sum += $p[$i]->[$_]+1; push @t, scalar(keys %{{map {$_->[0].$_->[1] => 1} c2($i,$_)}}) } grep {c($i,$_)} 0..$#{$p[$i]};
}

@t = sort {$a<=>$b} @t;

warn $sum;
warn $t[$#t]*$t[$#t-1]*$t[$#t-2];
