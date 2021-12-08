#!/usr/bin/perl

while(<>) {
  chomp;
  %s = (2=>1,3=>7,4=>4,7=>8);
  %p = ();
  ($f,$s) = split / \| /;
  $n += scalar(grep { length($_) < 5 or length($_) == 7} split / /, $s);

  foreach (split / /, "$f $s") {
    $_ = join '', sort split //, $_;
    $d[$s{length($_)}] = $_;
    $p{length($_)}->{$_} = 1;
  }
  $pos[0] = (grep {m/[^$d[1]]/} split //, $d[7])[0];
  foreach (keys(%{$p{6}})) {
     @t = grep {m/[$d[1]]/} split//, $_;
     $pos[5] = $t[0] and $d[6] = $_ and next if @t == 1;
     $d[9] = $_ and $pos[4] = (grep {m/[^$d[9]]/} split //, $d[8])[0] and next if (grep {m/[$d[4]]/} split//, $_) == 4;
     $d[0] = $_;
  }
  $pos[3] = (grep {m/[^$d[0]]/} split //, $d[8])[0];
  $pos[2] = $d[1] and $pos[2] =~ s/$pos[5]//;
  $pos[1] = $d[4] and $pos[1] =~ s/[$pos[3]$d[1]]*//g;
  $pos[6] = $d[8] and $pos[6] =~ s/[$pos[1]$pos[3]$pos[4]$d[7]]*//g;

  $d[2] = join '', sort split //, "$pos[0]$pos[2]$pos[3]$pos[4]$pos[6]";
  $d[3] = join '', sort split //, "$pos[0]$pos[2]$pos[3]$pos[5]$pos[6]";
  $d[5] = join '', sort split //, "$pos[0]$pos[1]$pos[3]$pos[5]$pos[6]";
  map {$d{$d[$_]}=$_} 0..9;
  $n2 += join '', map {$d{join '', sort split // }} split / /, $s;
}

warn $n;
warn $n2;
