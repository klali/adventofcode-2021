#!/usr/bin/perl

while(<>) {
  next unless m/^(\d+),(\d+) -> (\d+),(\d+)$/;
  ($o,$w,$t,$f) = $1 < $3 ? ($1,$2,$3,$4) : ($3,$4,$1,$2);
  map { $p{($o,$_)}++ } $w < $f ? $w..$f : $f..$w if $o==$t;
  map { $p{($_,$w)}++ } $o..$t if $w==$f;
  map { $q{($o++,$_)}++ } $w < $f ? $w..$f : reverse($f..$w) unless $o==$t or $w==$f;
}

map {$q{$_}+=$p{$_}} keys(%p);

warn scalar((grep { $_ >= 2}  values(%p)));
warn scalar((grep { $_ >= 2}  values(%q)));
