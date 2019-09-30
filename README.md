# rRNAFinder
rRNAFinder is a small perl software package, which can be used to automatically predict and classify the ribosome RNA genes using the assembled genome/metagenome contigs as input. The software were only tested on the Linux operating system.

"rRNAFinder.pl" program included in the package uses nhmmer program searching against the arc.hmm, bac.hmm, and euk.hmm databases to identify rRNA genes from the input contigs. The predicated rRNA genes include 16S, 18S, 23S, 28S, 5S, and 5.8S rRNA genes. 

The "rna2taxon.pl" program accepts the above generated fasta format rRNA gene sequences as an input to produce the taxonomic assignments for the input genes. The input rRNA gene sequences are searched against the downloaded and reformatted SILVA SSU and LSU databases using blastn.   

# Third-party software
* [BLAST+ executables](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download): The Basic Local Alignment Search Tool (BLAST) finds regions of	local similarity between sequences.
* [Hmmer](http://hmmer.org): HMMER is used for searching sequence databases for sequence homologs, and for making sequence alignments.
The required software must be added to the system path.

# Build blast search database
The downloaded and reformatted newest version of the SILVA SSU and LSU databases are required by "rna2taxon.pl" program to do the taxonomic assignments for the input rRNA gene sequences. The following command can be used to download and generate the databases.
```
perl make_taxonclassify_db.pl 132
```

# Quick start
The functionality provided by rRNAFinder.pl can be accessed through the help menu:
```
>perl rRNAFinder --help
```
Running rRNAFinder.pl with the default parameters
```
perl bin/rRNAFinder.pl  examples/test.fasta
```
The functionality provided by rna2taxon.pl can be accessed through the help menu:
```
>perl rna2taxon.pl --help
```
Classify the predicated rRNA genes (16S, 18S, 23S, 28S rRNA genes) with default parameters
```
perl rna2taxon.pl --dbtype ssu 16SrRNA.ffn
perl rna2taxon.pl --dbtype lsu 23SrRNA.ffn
```

