#!/usr/bin/perl

while(<>) {
  chomp;
  $p{$_} = 1 if m/^\d/;
  if (m/^fold along ([xy])=(\d+)$/) {
    $max = $2*2;
    $mx = $my = 0;
    foreach (keys(%p)) {
      ($x,$y) = ($nx,$ny) = split /,/;
      $nx = $max - $x if $1 eq 'x' and $x > $2;
      $ny = $max - $y if $1 eq 'y' and $y > $2;
      $mx = $nx if $nx > $mx;
      $my = $ny if $ny > $my;
      delete $p{$_};
      $p{"$nx,$ny"} = 1;
    }
    warn scalar(keys(%p)) and $i++ unless $i;
  }
}

map {$y=$_;map {print $p{"$_,$y"}?"#":" "} 0..$mx;print "\n"} 0..$my;
