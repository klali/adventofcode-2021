#!/usr/bin/perl

%p = (')' => 3,']' => 57,'}' => 1197,'>' => 25137);
%q = ('(' => 1,'[' => 2,'{' => 3,'<' => 4);

O: while(<>) {
  chomp;
  @p = ();
  foreach (split //) {
    push @p, $_ and next if m/[\[{<\(]/;
    pop @p and next if (ord($_) == ord($p[$#p]) + 2 or ord($_) == ord($p[$#p]) + 1);
    $sum += $p{$_} and next O;
  }
  $s2 = 0;
  map {$s2 = $s2*5+$q{$_}} reverse(@p);
  push @q, $s2;
}

warn $sum;
warn ((sort {$a<=>$b}@q)[$#q/2]);
