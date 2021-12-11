#!/usr/bin/perl

while(<>) {
  chomp;
  $j=0;
  $i++;
  map {$p{"$i ". $j++}=$_} split //;
}

sub adj {
  ($x,$y) = split / /;
  my @a;
  for $X ($x-1..$x+1) {
    push @a, map {"$X $_" if defined($p{"$X $_"}) and $p{"$X $_"} != 0} $y-1..$y+1;
  }
  @a;
}

for (0..500) {
  map {$_++} values(%p);
  @q = grep {$p{$_}>9} keys(%p);
  while (@q > 1) {
    foreach (@q) {
      next unless $_;
      $p{$_} = 0;
      map {$p{$_}++} adj($_);
    }
    @q = grep {$p{$_}>9} keys(%p);
  }
  map {$s++ if $_==0} values(%p) if $_ < 100;
  $l = $_+1 and last if scalar(grep {$p{$_} != 0} keys(%p)) == 1 and $p{"0 0"} == 0;
}

warn $s;
warn $l;
