#!/usr/bin/perl

$i = 0;
while(<>) {
  chomp;
  @q = split//;
  map {$p{"$i,$_"} = $q[$_]} 0..$#q;
  $mx = $#q;
  $my = $i;
  $i++;
}

sub solve {
  my ($mx,$my,%q) = @_;
  delete $q{"0,0"};
  %s = ("0,0" => 1);
  my %r;

  while (%q) {
    my @nk = ();
    foreach (keys(%s)) {
      my $q = 0;
      ($kx,$ky) = split /,/;
      for my $xy (map {($kx+$_->[0]).",".($ky+$_->[1])} ([1,0],[-1,0],[0,1],[0,-1])) {
        next unless defined($q{$xy});
        $r{$xy} = $q{$xy} + $r{$_} if(not defined($r{$xy}) or $q{$xy} + $r{$_} < $r{$xy});
        if(@nk == 0 || $r{$xy} < $r{$nk[0]}) {
          @nk = ($xy);
        } elsif ($r{$xy} == $r{$nk[0]}) {
          push @nk, $xy;
        }
        $q++;
      }
      delete $s{$_} if $q == 0;
    }
    foreach (@nk) {
      $s{$_} = 1;
      delete $q{$_};
      return $r{$_} if $_ eq "$mx,$my";
    }
  }
}

for $x (0..$mx) {
  for $y (0..$my) {
    for $i (0..4) {
      for $j (0..4) {
        $nx = ($x+($mx+1)*$i);
        $ny = ($y+($my+1)*$j);
        $v = $p{"$x,$y"} + $i + $j;
        $v = $v - 9 if $v > 9;
        $p{"$nx,$ny"} = $v;
      }
    }
  }
}
warn solve($mx,$my,%p);
warn solve(($mx + 1) * 5 - 1, ($my + 1) * 5 - 1,%p);
