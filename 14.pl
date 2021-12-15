#!/usr/bin/perl

while(<>) {
  chomp;
  if(/->/) {
    ($f,$s) = split / -> /;
    $p{$f} = $s;
    next;
  }
  next unless $_;
  $d = $_;
}

sub t2 {
  my ($f,$s,$i) = @_;
  return %{$cache{"$f$s $i"}} if($cache{"$f$s $i"});
  return ($p{"$f$s"}=>1) if $i == 0;
  my %c = t2($f,$p{"$f$s"},$i-1);
  my %d = t2($p{"$f$s"},$s,$i-1);
  map {$c{$_} += $d{$_}} keys(%d);
  $c{$p{"$f$s"}}++;
  $cache{"$f$s $i"} = \%c;
  return %c;
}

map {$f{$_}++} split //, $d;
map {$g{$_}++} split //, $d;
for (0..length($d)-2) {
  %e = t2(substr($d, $_, 1), substr($d, $_+1, 1), 39);
  map {$f{$_} += $e{$_}} keys(%e);
  %e = t2(substr($d, $_, 1), substr($d, $_+1, 1), 9);
  map {$g{$_} += $e{$_}} keys(%e);
}
@q = sort {$a<=>$b} values(%g);
warn $q[-1] - $q[0];
@q = sort {$a<=>$b} values(%f);
warn $q[-1] - $q[0];
