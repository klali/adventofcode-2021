#!/usr/bin/perl

while(<>) {
  next unless m/^(\w+) (\d+)$/;
  $d+=$2*$v if $1 eq 'forward';
  $h+=$2 if $1 eq 'forward';
  $v+=$2 if $1 eq 'down';
  $v-=$2 if $1 eq 'up';
}

warn $h*$v;
warn $h*$d;
