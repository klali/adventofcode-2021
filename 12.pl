#!/usr/bin/perl

while(<>) {
  chomp;
  ($s,$e) = split /-/;
  push @{$p{$s}}, $e;
  push @{$p{$e}}, $s;
}

sub p {
  my ($s,$m) = @_;
  my @p;
  foreach (@{$p{(split / /, $s)[-1]}}) {
    my %r = ();
    next if $_ eq 'start';
    push @p, "$s end" and next if $_ eq 'end';
    next if m/^[a-z]+$/ and $s =~ m/$_/ and $m == 1;
    map { $r{$_}++ } ("$s $_" =~ m/([a-z]+)/g) if $m == 2;
    next if scalar(grep { $_==2 } values %r) > 1 and $m == 2;
    next if scalar(grep { $_>2 } values %r) > 0 and $m == 2;
    push @p, p("$s $_", $m);
  }
  return @p;
}

foreach (@{$p{'start'}}) {
  $s1 += scalar(p($_, 1));
  $s2 += scalar(p($_, 2));
}

warn $s1;
warn $s2;
