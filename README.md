# Transcription and Translation: a Review with Programming Examples
I recently mixed up Exons with Introns :S ... here's a review of Exons, Introns, Promoters, and Open Reading Frames with examples done in R Studio, Python, and R:

## Exons and Introns (Python)
These programs can be found in the Exons_and_Introns folder:
* DNA_to_RNA_Simple_String.py takes a simple DNA string as input and returns an RNA string.
* RNA_to_AA_Simple_String.py takes a simple RNA string as input and returns a protein string. It *does* take stop codons into account, but this version can only do one reading frame. 
* Splicing_Out_Introns_1.py returns a sequence of ONLY the coding regions of the DNA string.
* Splicing_Out_Introns_2.py returns a sequence of ONLY the coding regions of the DNA and it returns the percentage of coding DNA.
* Splicing_Out_Introns_3.py returns a sequence of coding bases as UPPER CASE and non-coding bases as lowercase.
* RNA_Splicing.py is a simple example of removing the introns from a small RNA string.
* NOTE: These programs assume only one reading frame and one DNA string. Computing all six reading frames is *way* beyond my skills! I SHOULD DO AN EXAMPLE WITH BIOPYTHON: https://www.biostars.org/p/97746/


![PLACEHOLDER](/Assets/rna-protein-dictionary.jpg "PLACEHOLDER")
![PLACEHOLDER](/Assets/stop_codons_trinucleotideCURRENT.jpg "PLACEHOLDER")

## Promoter Regions (R Studio)
These files can be found in the Promoters folder:
* how_to_extract_promoters_positions.Rmd is an R tutorial that I followed on determinging promoter regions from TxDb.Hsapiens.UCSC.hg19.knownGene.
* TF_Binding_to_DNA_Promoter_Regions.Rmd is an R tutorial that I followed for searching out potential transcription factor / DNA promoter region interactions.  

## Detecting Open Reading Frames (Python, R Studio)
These files can be found in the Open_Reading_Frames folder:
* identifying_open_reading_frames.py is a BioPython tutorial for finding ORFs.
* identifying_open_reading_frame_positions.py is a BioPython tutorial for finding the positions of ORFs. 
* ORFik_Overview.Rmd is an R Studio tutorial that I completed on ORFik, which is a package for exploring open reading frames. 
* FindingGenesWithORFs.py this is an incorrect solution to a Rosalind.info ORF problem ... trying to figure things out.

# CIRM_and_HCA_Literature_Review
These files can be found in the Literature_Review folder:
* 34 CIRM Publications (and a Tag Storm poster)
* 4 HCA Publications
* UCSC Genome Browser Publications
* Short reviews of CIRM labs, Sequencing Methods, and CIRM Abstracts

# Wrangling CIRM Data (Python, R, R Studio, MySQL, Terminal)
Here are the projects that I have completed:
* I had issues using the CIRM data download shell scripts ... specifically, I was getting "certificate verification failed" for Kriegstein and Quake data; I fixed the CIRM scripts by writing Python to add -- insecure to the end of each CIRM script. 
* I didn't have any issues downloading the Ischemia dataset from HCA. I identified a file # difference between CIRM's download pages and the # of files I received, so I changed the.html files to reflect that. 
* I wrote R code to identify the top (~15) est_count reads, and their target_id labels, for samples that were 3*(standard_deviation)+average.  
* I created a MySQL database of quakeBrainGeo1 based on the CIRM downloading script. It contains fields for accession, read_type, meta, and file name.
* I noticed that the CIRM shell scripts download have a download log AND found that two downloads had failed for me that *were not reported*. I wrote Python code to read through the standard output of the downloads and identify which downloads failed. I then used the MySQL database that I had created earlier to identify a downloading link that I could use from the Linux terminal. 

## Getting Current File # & Size (Python, Terminal) 
The Python file is in the CIRM_HTML sub-folders for Kriegstein and Quake. NOTE: I JUST REALIZED how_many_files_in_directory.py is missing from my repository ... I'm on my laptop now. I'll add it from my home computer later tonight. NVM, it's in the CIRM_HTML directory :)
* this terminal command gets the # of files: find DIR_NAME -type f | wc -l
* how_many_files_in_directory.py is a Python script that can determine the number of files in a recursive folder system
* du -hs /media/david/Terabyte/Altering_CIRM_Scripts/quakeBranGeo1
236G	/media/david/Terabyte/Altering_CIRM_Scripts/quakeBranGeo1

![PLACEHOLDER](/Assets/directory-file-number-and-size.jpg "PLACEHOLDER")

## Updating the CIRM Data Download Webpages (.html)
This project is in both of the CIRM_HTML sub-folders.
* I updated the kriegsteinRadialGliaStudy1 and quake_BrainGeo1 download pages to reflect the directory size and # of files that I determined above. 

![PLACEHOLDER](/Assets/editing-cirm-html.jpg "PLACEHOLDER")

## Correcting the "certificate verification failed" error (Python & Shell Scripting)
* Update_Glia_EXT_Script.py is in the kriegsteinGlia_Projects folder. 
* Update_Brain_EXT_Script.py is in the quakeBrain_Projects folder. 

![PLACEHOLDER](/Assets/updating-insecure-downloads.jpg "PLACEHOLDER")

## Identifying Statistically Significant RNA-Seq est_counts (R Studio, .tsv)
You can find these programs in the kriegsteinGlia_Projects folder. 
* RNA-Seq_est_count_Statistics.Rmd is an intereactive exploration of this idea in R Studio.
* RNA_Seq_est_count_Statistics.R is a static program that will run on an "abundance.tsv" file in the same directory. I'm currently using the file with accession name of sc003JHK.

![PLACEHOLDER](/Assets/statistically-significant-est-counts.jpg "PLACEHOLDER")

## Creating a quakeBrainGeo1 SQL Database (Python, MySQL, .sh)
These files are in the quakeBrain_Projects folder.
* This project constructed a MySQL database of quakeBrainGeo1 file information from the script downloading file. Sure, the line is long:

curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000AKB' --create-dirs -o raw/reads-ByExp-sra-SRX-SRX995-SRX995861-SRR1974543-/SRR1974543_1.fastq.gz --insecure
HOWEVER, but there are only a few unique bits of data.
accession     file_type       meta_name       file_name
sc000AKB      reads           SRR1974543      SRR1974543_1.fastq.gz
* quakeBrain_getting_info_TEST.py obtains accession, file_type, meta_name, and file_name on a small set of test cases.
* quakeBrain_getting_info_COMPLETE.py is the same as "quakeBrain_getting_info_TEST.py" AND it runs through the whole shell script.
* quakeBrain_ENTERING_MySQL_Rows.py runs through the whole shell script AND it enters all the data into a MySQL table.
* Here are some MySQL demonstrations: 

![demoing_Quake_Shell_Table](https://github.com/DaveHalvorsen/Wrangling_CIRM_Data/blob/master/MySQL_demoing_DISTINCT_STAR_COUNT.jpg "demoing_Quake_Shell_Table")

## Identifying failed downloads without a log file (Python, .txt, terminal)
* what_files_failed.py is a sneaky way of identifying which files failed to download in the absence of a log file. It starts by reading in a .txt output of the Working_Brain_Submitted_Many_Directories.sh standard output. It determines the row # that the shell script failed to download at AND looks up that row number in the download script itself. Here's the output for failed download file information for the Dec161056am_currently2DLfails.txt file:
what-files-failed.jpg

![PLACEHOLDER](/Assets/what-files-failed.jpg "PLACEHOLDER")

failure at download number 271
“SRR1974678_1.fastq.gz”
“51  644M   51  335M    0     0  4945k      0  0:02:13  0:01:09  0:01:04 4836k”
'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000AUC'
failure at download number 563
SRR1974824_1.fastq.gz
25  122M   25 30.8M    0     0   379k      0  0:05:31  0:01:23  0:04:08  500k
'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000BFM'

## The failed downloads DID get saved in the directory :S (Terminal)
* Here are the terminal commands that I used to find the files and get their size information:
$ find . -name SRR1974678_1.fastq.gz
./raw/reads-ByExp-sra-SRX-SRX995-SRX995996-SRR1974678-/SRR1974678_1.fastq.gz
$ ls -l ./raw/reads-ByExp-sra-SRX-SRX995-SRX995996-SRR1974678-/SRR1974678_1.fast
q.gz
-rwxrwxrwx 1 david david 351404032 Dec 16 03:33 ./raw/reads-ByExp-sra-SRX-SRX995-SRX995996-SRR1974678-/SRR1974678_1.fastq.gz
* I have stored these failed downloads in the quakeBrain_Projects/failed_downloads directory. You can see that they won't open. I TRIED THIS, BUT THEY WERE TOO BIG FOR GITHUB REPO :(




## Looking up the failed downloads in the MySQL Database I created above (MySQL)
* This is an example of a MySQL request for the database that I created:

![MySQL_Accession_Lookup](https://github.com/DaveHalvorsen/Wrangling_CIRM_Data/blob/master/MySQL_file_name_Search.jpg "MySQL_Accession_Lookup")

## Re-downloading those files WITHOUT searching CIRM for the download links (Terminal)
* Note that the download links all have this structure:
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=ACCESSION_NUMBER' --insecure 
* This is why we looked up the files on my MySQL database! We can plug in the accession numbers like so:
	* wget https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000AUC --no-check-certificate \n
	* wget https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000BFM --no-check-certificate 


## The failed downloads are smaller than the complete downloads (Terminal)
My SRR1974678_1.fastq.gz” is 351.4 MB, BUT CIRM website says it should be 676105674 (676 MB) and Chrome download of file from CIRM is 676.1 MB. My SRR1974824_1.fastq.gz is 32.4 MB, BUT CIRM website says it should be 128736201 (128 MB) and Chrome download of file from CIRM is 128 MB. Here's how I got the file sizes using the terminal:

![PLACEHOLDER](/Assets/identifying-failed-downloads-LOCATIONS-size.jpg "PLACEHOLDER")

* failed download SRR1974678_1.fastq.gz vs. complete download SRR1974678_1.fastq.gz 
david@Ryzen:/media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects$ du -hs /media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/failed_downloads/SRR1974678_1.fastq.gz
336M	/media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/failed_downloads/SRR1974678_1.fastq.gz
david@Ryzen:/media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects$ du -hs //media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/retry_downloads/SRR1974678_1.fastq.gz
645M	//media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/retry_downloads/SRR1974678_1.fastq.gz
* failed download SRR1974824_1.fastq.gz vs. complete download SRR1974824_1.fastq.gz
david@Ryzen:/media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects$ du -hs /media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/failed_downloads/SRR1974824_1.fastq.gz
31M	/media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/failed_downloads/SRR1974824_1.fastq.gz
david@Ryzen:/media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects$ du -hs //media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/retry_downloads/SRR1974824_1.fastq.gz
123M	//media/david/Linux/Wrangling_CIRM_Data/quakeBrain_Projects/retry_downloads/SRR1974824_1.fastq.gz
