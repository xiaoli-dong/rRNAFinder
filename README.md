rRNAFinder is a small software package, which can be used to automatically predicts and annotates ribosome RNA using only assembled genome/metagenome contigs as input. It reports the location, type of the
 genes, and their taxonomic assignments. The outputs of the gene predictions are gff files and a set of fasta format sequence files, which are 16SrRNA.ffn, 18SrRNA.ffn, 5SrRNA.ffn, 5_8SrRNA.ffn, 23SrRNA.f
fn, and 28SrRNA.ffn. It uses nhmmer program search against a hmm database to do the rRNA gene predication.
The predicted 16s, 18s, 23s, and 28s rNRA fasta sequences can be further annotated by searching against SILVA database to get he taxonomic assignment.

Features:
The program can use multiple threads and runs very fast.
Predict rRNA genes (5s, 5.8s, 16s, 18s, 23s, 28s rRNA genes)
Taxonomic assignment of the predicted rRNA genes

Example command

#RNA prediction, produce rRNA.fasta and rRA.gff.txt file

perl bin/rRNAFinder.pl  examples/test.fasta


