#!/usr/bin/env perl
use warnings;
use strict;

my @taxons = ();
my $index = 0;

while (<DATA>){
    chomp;
    my @terms = split(/;/, $_);
    next if @terms == 0;
    @{$taxons[$index]} = @terms;
    print join(";", @{$taxons[$index]});
    print "\n";
    $index++;
}

my $com = lca(@taxons);
print join(";", @$com);
print "\n";
# Get list of species names, find their Tax IDs, then find the Lowest Common Ancestor (LCA)
sub lca {
    my @taxids = @_;
    
    my $size = @taxids;
    my $test = $taxids[0];
    #print STDERR "lca size=$size\n";
    #print STDERR "first*********=@$test\n";
    
    
    for (my $index = 0; $index <$size; $index++){
	#$test = $taxids[$index];
	#print STDERR "index=$index*********=@$test\n";
    }
    
    if (@taxids == 0) {return 0;} # Empty list? Not assigned=0
    
    @taxids=grep {defined} @taxids;  # screen out undefined values
    
    if (@taxids==0) {die("undefined values snuck into the taxid list; help?");} # how did undefined values get on the list?
    #print "  taxid3: ",(map {my @z=@$_;sprintf("%7s ",$z[$#z])} @taxids),"\n";
    
    if (@taxids==0) {return -1;} # No hits
    #print "  taxid4: ",(map {my @z=@$_;sprintf("%7s ",$z[$#z])} @taxids),"\n";
    
    # Find the lca
    my $n;
    for ($n=0;$n<100;$n++) {
	my @col;
	my $size = @taxids;
	
	for (my $m=0,@col=();$m<@taxids;$m++) { push @col,$taxids[$m][$n]; }
	if (!defined($col[0]) or !unanimous(@col)) {last;}
    }
    #if ($n<=0) {print STDERR "n=$n\n"; die("Impossible Error: Lca algorithm couldn't find any nodes in common!?  Data:\n".Dumper(\@_,\@taxids)." ");}
    
    my @slice = ();
    
    for(my $i = 0; $i < $n; $i++){
	push (@slice, $taxids[0][$i]);
    }
    
    #print STDERR "n=$n, common nodes=", $taxids[0][$n-1], "\n";
    #print STDERR "n*******=$n, common nodes=@slice\n";
    
    return \@slice;


    #return $taxids[0][$n-1]; #Return the taxid of the last common node
}
# Return 1 if the array is unanimous, 0 if not
sub unanimous {
  if (!defined $_[0]) {  # Unanimously 'undef'ined
    if (grep {defined} @_) {return 0;}
    return 1;
  }
  if (grep {!defined or $_ ne $_[0]} @_) {return 0;}
  return 1;
}

__DATA__
Bacteria;Patescibacteria;Gracilibacteria;Absconditabacteriales (SR1);uncultured bacterium
Bacteria;Patescibacteria;Gracilibacteria;Absconditabacteriales (SR1);uncultured organism
Bacteria;Patescibacteria;Gracilibacteria;Absconditabacteriales
