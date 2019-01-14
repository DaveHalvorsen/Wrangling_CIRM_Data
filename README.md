# About
I recently completed the UCSC Database and Data Analytics Certificate. The curriculum covers Python, R, and SQL in a variety of contexts. This repository is a demonstration of my data handling skills with the CIRM Stem Cell Hub Data Browser. I have successfully downloaded ~220 GB of data from quakeBrainGeo1, kriegsteinRadialGliaStudy1, and jointCirmBrain1. I created an R script that will identify statistically significant RNA-seq values from >190,000 rows of the sc003JHK.tsv Kallisto Abundance RNA-seq file. **I have also identified, and corrected, two sources of failed downloads _in the absence of a log file._**

The big issue here is that an end user will only notice that a download failed IF they read the .sh standard output OR compare their downloads to the server files; this could negatively influence downstream data analysis. **_With End User Experience in mind, I have written a Python script that will add a log file to any of the CIRM download shell scripts._** I think the CIRM database is an awesome collection of scientific data and computational methods of sharing that data. I would *love* to keep playing with methods of improving, and understanding, the CIRM database! :)

NOTE: I have added an introductory section that reviews Introns, Exons, and Promoters.

* <a href="#Introns_Exons_and_Promoter_Regions ">Introns, Exons, and Promoter Regions</a>
* <a href="#CIRM_and_HCA_Literature_Review">CIRM and HCA Literature Review</a>
* <a href="#Wrangling_CIRM_Data">Wrangling CIRM Data</a>
	* <a href="#Getting_Current_File_and_Size">Getting Current File # & Size</a>
	* <a href="#Updating_Download_Webpages">Updating the CIRM Data Download Webpages</a>
	* <a href="#Correcting_Failed_Certificate_Error">Correcting the "certificate verification failed</a>
	* <a href="#Statistically_Significant_RNA_Seq_Counts">Identifying Statistically Significant RNA-Seq est_counts</a>
	* <a href="#Creating_quakeBrainGeo1_SQL_Database">Creating a quakeBrainGeo1 SQL Database</a>
	* <a href="#Identifying_Failed_Downloads">Identifying failed downloads without a log file</a>
	* <a href="#Finding_Failed_Downloads">The failed downloads DID get saved in the directory</a>
	* <a href="#Querying_MY_MySQL_Database">Querying MY MySQL Database</a>
	* <a href="#REdownloading_Failed_Downloads">Re-downloading the Failed Files</a>
	* <a href="#Comparing_Failed_to_Complete_Downloads">The Failed Downloads are Too Small</a>
	* <a href="#Finding_the_HCA_Download_Log_File">Finding the HCA Download File</a>
	* <a href="#Adding_a_CIRM_Download_Log_File">Adding a CIRM Download Log File</a>
* <a href="#Wrangling_ASCII_Art">Wrangling ASCII Art</a>
	* <a href="#">Bork.sh Has a Width Requirement</a>
	* <a href="#">Using $(tput cols) to Specify Width</a>
	* <a href="#">Space_Dog.sh Has Width and Height Requirements</a>
	* <a href="#">Using $(tput lines) to Specify Height</a>
* <a href="#Analyzing_ASCII_Art">Analyzing ASCII Art</a>
	* <a href="#">2D Dog Physics with R</a>
	* <a href="#">Plotting Dog X Position</a>
	* <a href="#">Plotting Dog Velocity</a>
	* <a href="#">Plotting Dog Acceleration</a>

<a name="Introns_Exons_and_Promoter_Regions"></a>
# Introns, Exons, and Promoter Regions (Python & R)
This is a review of Exons, Introns, Promoter Regions, and Open Reading Frames. Skip to the next section for the CIRM Data Wrangling Projects.

#### Exons and Introns (Python)
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

#### Promoter Regions (R Studio)
These files can be found in the Promoters folder:
* how_to_extract_promoters_positions.Rmd is an R tutorial that I followed on determinging promoter regions from TxDb.Hsapiens.UCSC.hg19.knownGene.
* TF_Binding_to_DNA_Promoter_Regions.Rmd is an R tutorial that I followed for searching out potential transcription factor / DNA promoter region interactions.  

#### Detecting Open Reading Frames (Python, R Studio)
These files can be found in the Open_Reading_Frames folder:
* identifying_open_reading_frames.py is a BioPython tutorial for finding ORFs.
* identifying_open_reading_frame_positions.py is a BioPython tutorial for finding the positions of ORFs. 
* ORFik_Overview.Rmd is an R Studio tutorial that I completed on ORFik, which is a package for exploring open reading frames. 
* FindingGenesWithORFs.py this is an incorrect solution to a Rosalind.info ORF problem ... trying to figure things out.

![PLACEHOLDER](/Assets/identifying-open-reading-frames.jpg "PLACEHOLDER")

<a name="CIRM_and_HCA_Literature_Review"></a>
# CIRM_and_HCA_Literature_Review
These files can be found in the Literature_Review folder:
* 34 CIRM Publications (and a Tag Storm poster)
* 4 HCA Publications
* UCSC Genome Browser Publications
* Short reviews of CIRM labs, Sequencing Methods, and CIRM Abstracts

<a name="Wrangling_CIRM_Data"></a>
# Wrangling CIRM Data (Python, R, R Studio, MySQL))
Here are the projects that I have completed:
* I had issues using the CIRM data download shell scripts ... specifically, I was getting "certificate verification failed" for Kriegstein and Quake data; I fixed the CIRM scripts by writing Python to add -- insecure to the end of each CIRM script. 
* I didn't have any issues downloading the Ischemia dataset from HCA. I identified a file # difference between CIRM's download pages and the # of files I received, so I changed the.html files to reflect that. 
* I wrote R code to identify the top (~15) est_count reads, and their target_id labels, for samples that were 3*(standard_deviation)+average.  
* I created a MySQL database of quakeBrainGeo1 based on the CIRM downloading script. It contains fields for accession, read_type, meta, and file name.
* I noticed that the CIRM shell download scripts DO NOT have a download log AND found that two downloads had failed for me that *were not reported* to the potential user ... this is bad because I only noticed cause I happened to see a new weird line! I wrote Python code to read through the standard output of the downloads and identify which downloads failed. I then used the MySQL database that I had created earlier to identify a downloading link that I could use from the Linux terminal. 

<a name="Getting_Current_File_and_Size"></a>
#### Getting Current File # & Size (Python, Terminal) 
The Python file is in the CIRM_HTML sub-folders for Kriegstein and Quake. 

![PLACEHOLDER](/Assets/directory-file-number-and-size.jpg "PLACEHOLDER")

<a name="Updating_Download_Webpages"></a>
#### Updating the CIRM Data Download Webpages (.html)
This project is in both of the CIRM_HTML sub-folders.
* I updated the kriegsteinRadialGliaStudy1 and quake_BrainGeo1 download pages to reflect the directory size and # of files that I determined above. 

![PLACEHOLDER](/Assets/editing-cirm-html.jpg "PLACEHOLDER")

<a name="Correcting_Failed_Certificate_Error"></a>
#### Correcting the "certificate verification failed" error (Python & Shell Scripting)
* Update_Glia_EXT_Script.py is in the kriegsteinGlia_Projects folder. 
* Update_Brain_EXT_Script.py is in the quakeBrain_Projects folder. 

![PLACEHOLDER](/Assets/updating-insecure-downloads.jpg "PLACEHOLDER")

<a name="Statistically_Significant_RNA_Seq_Counts"></a>
#### Identifying Statistically Significant RNA-Seq est_counts (R Studio, .tsv)
You can find these programs in the kriegsteinGlia_Projects folder. 
* RNA-Seq_est_count_Statistics.Rmd is an intereactive exploration of this idea in R Studio.
* RNA_Seq_est_count_Statistics.R is a static program that will run on an "abundance.tsv" file in the same directory. I'm currently using the file with accession name of sc003JHK. 
NOTE: Actually it looks like I'm off by ~0.02 from the the 68–95–99.7 rule ... I should check on this, but I'm not too worried cause it's close to what Excel says.

![PLACEHOLDER](/Assets/statistically-significant-est-counts.jpg "PLACEHOLDER")

<a name="Creating_quakeBrainGeo1_SQL_Database"></a>
#### Creating a quakeBrainGeo1 SQL Database (Python, MySQL, .sh)
These files are in the quakeBrain_Projects folder.
* This project constructed a MySQL database of quakeBrainGeo1 file information from the script downloading file. Sure, the line is long:
	* curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000AKB' --create-dirs -o raw/reads-ByExp-sra-SRX-SRX995-SRX995861-SRR1974543-/SRR1974543_1.fastq.gz --insecure
* HOWEVER, there are only a few unique bits of data:
	* accession,     file_type,       meta_name, &      file_name
	* sc000AKB,      reads,           SRR1974543, &     SRR1974543_1.fastq.gz
* quakeBrain_getting_info_TEST.py obtains accession, file_type, meta_name, and file_name on a small set of test cases.
* quakeBrain_getting_info_COMPLETE.py is the same as "quakeBrain_getting_info_TEST.py" AND it runs through the whole shell script.
* quakeBrain_ENTERING_MySQL_Rows.py runs through the whole shell script AND it enters all the data into a MySQL table.
* Here are some MySQL demonstrations: 

![demoing_Quake_Shell_Table](/Assets/MySQL_demoing_DISTINCT_STAR_COUNT.jpg "PLACEHOLDER")

<a name="Identifying_Failed_Downloads"></a>
#### Identifying failed downloads without a log file (Python, .txt, terminal)
* what_files_failed.py is a sneaky way of identifying which files failed to download in the absence of a log file. It starts by reading in a .txt output of the Working_Brain_Submitted_Many_Directories.sh standard output. It determines the row # that the shell script failed to download at AND looks up that row number in the download script itself. Here's the output for failed download file information for the Dec161056am_currently2DLfails.txt file:
what-files-failed.jpg

![PLACEHOLDER](/Assets/what-files-failed.jpg "PLACEHOLDER")

<a name="Finding_Failed_Downloads"></a>
#### The failed downloads DID get saved in the directory :S (Terminal)
* Here are the terminal commands that I used to find the files and get their size information:
	* $ find . -name SRR1974678_1.fastq.gz
	./raw/reads-ByExp-sra-SRX-SRX995-SRX995996-SRR1974678-/SRR1974678_1.fastq.gz
	* $ ls -l ./raw/reads-ByExp-sra-SRX-SRX995-SRX995996-SRR1974678-/SRR1974678_1.fast
q.gz
-rwxrwxrwx 1 david david 351404032 Dec 16 03:33 ./raw/reads-ByExp-sra-SRX-SRX995-SRX995996-SRR1974678-/SRR1974678_1.fastq.gz
* I have stored these failed downloads in the quakeBrain_Projects/failed_downloads directory. You can see that they won't open. I TRIED THIS, BUT THEY WERE TOO BIG FOR GITHUB REPO :(

<a name="Querying_MY_MySQL_Database"></a>
#### Looking up the failed downloads in the MySQL Database I created above (MySQL)
* This is an example of a MySQL request for the database that I created:

![MySQL_Accession_Lookup](/Assets/MySQL_file_name_Search.jpg "MySQL_Accession_Lookup")

<a name="REdownloading_Failed_Downloads"></a>
#### Re-downloading those files WITHOUT searching CIRM for the download links (Terminal)
* Note that the download links all have this structure:
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=ACCESSION_NUMBER' --insecure 
* This is why we looked up the files on my MySQL database earlier! Obviously, this is a slow & silly way of getting the missing data (cause I could've just searched for the files on CIRM). HOWEVER, I wanted to make this demo of my CIRM Wrangling logically pretty and interconnected :) We can plug in the accession numbers like so:
	* wget https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000AUC --no-check-certificate 
	* wget https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc000BFM --no-check-certificate 

<a name="Comparing_Failed_to_Complete_Downloads"></a>
#### The failed downloads are smaller than the complete downloads (Terminal)
My SRR1974678_1.fastq.gz” is 351.4 MB, BUT CIRM website says it should be 676105674 (676 MB) and Chrome download of file from CIRM is 676.1 MB. My SRR1974824_1.fastq.gz is 32.4 MB, BUT CIRM website says it should be 128736201 (128 MB) and Chrome download of file from CIRM is 128 MB. Here's how I got the file sizes using the terminal:

![PLACEHOLDER](/Assets/identifying-failed-downloads-LOCATIONS-size.jpg "PLACEHOLDER")

<a name="Finding_the_HCA_Download_Log_File"></a>
#### Finding the HCA Download Log File (Terminal, .sh)
In previous sections I have reviewed how CIRM files can fail to download and how to identify and fix those failed downloads. *However*, I feel comfortable playing with Python, R and SQL. My concern is that some end users might not be able to identify failed downloads and that their data analysis will be negatively impacted by that. The Human Cell Atlas data download shell scripts have a log file, but it is hidden. Here's how to find it for the the Ischaemic Sensitivity dataset:

```sh
# this next line would be how to run the HCA download script (I already ran it)
david@Ryzen:/media/david/Terabyte/Data/HCA/ischaemic_sensitivity$ ./hca-download-ischaemic-sensitivity 
david@Ryzen:/media/david/Terabyte/Data/HCA/ischaemic_sensitivity$ ls 
17a3d288-01a0-464a-9599-7375fda3353d  hca-metadata-ischaemic-sensitivity.xlsx
hca-download-ischaemic-sensitivity
david@Ryzen:/media/david/Terabyte/Data/HCA/ischaemic_sensitivity$ ls -a
.                                     hca-download-ischaemic-sensitivity
..                                    hca-metadata-ischaemic-sensitivity.xlsx
17a3d288-01a0-464a-9599-7375fda3353d
david@Ryzen:/media/david/Terabyte/Data/HCA/ischaemic_sensitivity$ cd ../
david@Ryzen:/media/david/Terabyte/Data/HCA$ ls
ischaemic_sensitivity
david@Ryzen:/media/david/Terabyte/Data/HCA$ ls -a
.  ..  .hca-tmp  ischaemic_sensitivity
david@Ryzen:/media/david/Terabyte/Data/HCA$ cd .hca-tmp
david@Ryzen:/media/david/Terabyte/Data/HCA/.hca-tmp$ ls
log
david@Ryzen:/media/david/Terabyte/Data/HCA/.hca-tmp$ ls -a
.  ..  log
david@Ryzen:/media/david/Terabyte/Data/HCA/.hca-tmp$ cat log | head
Collecting hca
  Using cached https://files.pythonhosted.org/packages/c8/0c/e2982d21a8d1a7f49b5bd761bfd11c7a2996ef3dc3738373ab975e75c180/hca-4.4.10-py2.py3-none-any.whl
Collecting six
  Downloading https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl
Collecting tweak<1,>=0.6.7 (from hca)
  Using cached https://files.pythonhosted.org/packages/ed/39/65a3ee8c50896a990a29484e88520391bf72ef42d84025ff69d3f2db9583/tweak-0.6.7-py2.py3-none-any.whl
Collecting typing<4,>=3.6.2; python_version < "3.5" (from hca)
  Using cached https://files.pythonhosted.org/packages/cc/3e/29f92b7aeda5b078c86d14f550bf85cff809042e3429ace7af6193c3bc9f/typing-3.6.6-py2-none-any.whl
Collecting argcomplete<2,>=1.9.3 (from hca)
  Using cached https://files.pythonhosted.org/packages/31/88/ba8d8684a8a27749250c66ff7c2b408fdbc29b50da61200338ff9b2607bf/argcomplete-1.9.4-py2.py3-none-any.whl
david@Ryzen:/media/david/Terabyte/Data/HCA/.hca-tmp$ cat log | tail
  Downloading https://files.pythonhosted.org/packages/2d/99/b2c4e9d5a30f6471e410a146232b4118e697fa3ffc06d6a65efde84debd0/futures-3.2.0-py2-none-any.whl
Collecting python-dateutil<3.0.0,>=2.1; python_version >= "2.7" (from botocore<1.11.0,>=1.10.84->boto3<1.8,>=1.7->hca)
  Downloading https://files.pythonhosted.org/packages/74/68/d87d9b36af36f44254a8d512cbfc48369103a3b9e474be9bdfe536abfc45/python_dateutil-2.7.5-py2.py3-none-any.whl (225kB)
Collecting argparse (from puremagic->dcplib<2,>=1.3.2->hca)
  Downloading https://files.pythonhosted.org/packages/f2/94/3af39d34be01a24a6e65433d19e107099374224905f1e0cc6bbe1fd22a2f/argparse-1.4.0-py2.py3-none-any.whl
Collecting pyasn1>=0.1.3 (from rsa>=3.1.4->google-auth<2,>=1.0.2->hca)
  Downloading https://files.pythonhosted.org/packages/d1/a1/7790cc85db38daa874f6a2e6308131b9953feb1367f2ae2d1123bb93a9f5/pyasn1-0.4.4-py2.py3-none-any.whl (72kB)
Collecting pycparser (from cffi!=1.11.3,>=1.7->cryptography==2.3.1->hca)
Installing collected packages: tweak, typing, argcomplete, pyasn1, rsa, cachetools, six, pyasn1-modules, google-auth, oauthlib, certifi, chardet, idna, urllib3, requests, requests-oauthlib, google-auth-oauthlib, MarkupSafe, Jinja2, PyJWT, enum34, asn1crypto, pycparser, cffi, ipaddress, cryptography, pyopenssl, retrying, futures, jmespath, python-dateutil, docutils, botocore, s3transfer, boto3, argparse, puremagic, crcmod, dcplib, future, commonmark, jsonpointer, functools32, jsonschema, funcsigs, hca
Successfully installed Jinja2-2.10 MarkupSafe-1.1.0 PyJWT-1.7.1 argcomplete-1.9.4 argparse-1.4.0 asn1crypto-0.24.0 boto3-1.7.84 botocore-1.10.84 cachetools-3.0.0 certifi-2018.11.29 cffi-1.11.5 chardet-3.0.4 commonmark-0.7.5 crcmod-1.7 cryptography-2.3.1 dcplib-1.4.0 docutils-0.14 enum34-1.1.6 funcsigs-1.0.2 functools32-3.2.3.post2 future-0.17.1 futures-3.2.0 google-auth-1.6.1 google-auth-oauthlib-0.2.0 hca-4.4.10 idna-2.8 ipaddress-1.0.22 jmespath-0.9.3 jsonpointer-1.14 jsonschema-2.6.0 oauthlib-2.1.0 puremagic-1.4 pyasn1-0.4.4 pyasn1-modules-0.2.2 pycparser-2.19 pyopenssl-18.0.0 python-dateutil-2.7.5 requests-2.21.0 requests-oauthlib-1.0.0 retrying-1.3.3 rsa-4.0 s3transfer-0.1.13 six-1.12.0 tweak-0.6.7 typing-3.6.6 urllib3-1.24.1
```

<a name="Adding_a_CIRM_Download_Log_File"></a>
#### Adding a CIRM Download Log File (Python, .sh)
The jointCirmBrain1 is small enough to visualize why having a log file is important. Lines 1-12 should be familiar for those that have experience with CIRM. I have added a thirteenth line for a download that doesn't exist. It will fail.

```sh
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIV' --create-dirs -o geneMatrix.tsv
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIW' --create-dirs -o summary/cellInfo.html
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIX' --create-dirs -o summary/cellTypes.json
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIY' --create-dirs -o summary/heatmap.html
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIZ' --create-dirs -o summary/index.html
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJA' --create-dirs -o summary/seuratGenes.html
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJB' --create-dirs -o summary/meta.txt
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJC' --create-dirs -o summary/meta.tsv
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJD' --create-dirs -o summary/index.html
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDW' --create-dirs -o summary/index.html
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDX' --create-dirs -o summary/index.html
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDV' --create-dirs -o summary/index.html
# this next line is for data that won't be available to download for ~7.5 million years
curl 'the answer to life the universe and everything' --create-dirs -o the_answer_to_life_the_universe_and_everything/42
```

^ That shell script will work fine for the first 12 files, BUT it will fail on the last download. Here are the last 3 lines of the standard output:

```sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  529k  100  529k    0     0  1087k      0 --:--:-- --:--:-- --:--:-- 1089k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  529k  100  529k    0     0   986k      0 --:--:-- --:--:-- --:--:--  986k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: the answer to life the universe and everything
```

Obviously, this is a silly example. BUT, I showed a true example of a failed download with the SRR1974678_1.fastq.gz file above. SRR1974678_1.fastq.gz failed and there was no record of that failure. Obviously, this could lead to downstream data analysis problems. I wrote a Python script to add a log file to any CIRM download script. I added " --write-out "\nDownload Link: %{url_effective} \nFilename: %{filename_effective}\n" 2>&1 | tee -a log.txt" to each line ending. --write-out is an argument for curl that reports %{requested information} to stdout. I redirected and appended that output, along with the curl stdout, to log.txt. Here's an example of it set up for working with the jointCirmBrain1 download script:

```python
#!/usr/bin/env python

file = open("jointCirmBrain1_Submitted_Subdirectories.sh")
write_arguments_file = open("write_out_format", "w")
lines = file.readlines()
new_file = open("jointCirmBrain1_Submitted_Subdirectories_LOGS.sh", "a")

write_arguments = "\\nDownload Link: %{url_effective} \\nFilename: %{filename_effective}\\n"
write_arguments_file.write(write_arguments)

for line in lines:
	entry = line.rstrip() + ' --write-out "@write_out_format" 2>&1 | tee -a log.txt \n'
	new_file.write(entry)
file.close()
new_file.close()
```

The python-edited CIRM script looks like this:

```sh
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIV' --create-dirs -o geneMatrix.tsv --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIW' --create-dirs -o summary/cellInfo.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIX' --create-dirs -o summary/cellTypes.json --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIY' --create-dirs -o summary/heatmap.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIZ' --create-dirs -o summary/index.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJA' --create-dirs -o summary/seuratGenes.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJB' --create-dirs -o summary/meta.txt --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJC' --create-dirs -o summary/meta.tsv --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MJD' --create-dirs -o summary/index.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDW' --create-dirs -o summary/index.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDX' --create-dirs -o summary/index.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDV' --create-dirs -o summary/index.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDV' --create-dirs -o summary/index.html --write-out "@write_out_format" 2>&1 | tee -a log.txt 
curl 'the answer to life the universe and everything' --create-dirs -o the_answer_to_life_the_universe_and_everything/42 --write-out "@write_out_format" 2>&1 | tee -a log.txt 
```

The last three lines of stdout for this script looks like this:

```sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  529k  100  529k    0     0   939k      0 --:--:-- --:--:-- --:--:--  940k

Download Link: https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDV 
Filename: summary/index.html
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  529k  100  529k    0     0   428k      0  0:00:01  0:00:01 --:--:--  428k

Download Link: https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDV 
Filename: summary/index.html
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: the answer to life the universe and everything

Download Link: http://the answer to life the universe and everything/ 
Filename: the_answer_to_life_the_universe_and_everything/42
```

Here's an exploration of the log.txt file. You can see that information about the total download size, the expected download size, the initial file name, and the saved file name AND MORE is available to review. At the end of the output, you can see that the curl download failure is also present in the log.txt file. 

```sh
david@Ryzen:/media/david/Linux/Wrangling_CIRM_Data/Adding_a_Log_File/Log_File_Script$ cat log.txt |head
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  202M  100  202M    0     0  3287k      0  0:01:02  0:01:02 --:--:-- 3302k

Download Link: https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002MIV 
Filename: geneMatrix.tsv
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1162k  100 1162k    0     0   791k      0  0:00:01  0:00:01 --:--:--  791k
david@Ryzen:/media/david/Linux/Wrangling_CIRM_Data/Adding_a_Log_File/Log_File_Script$ cat log.txt | tail
100  529k  100  529k    0     0   428k      0  0:00:01  0:00:01 --:--:--  428k

Download Link: https://cirm.ucsc.edu/cgi-bin/cdwGetFile?acc=sc002XDV 
Filename: summary/index.html
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: the answer to life the universe and everything

Download Link: http://the answer to life the universe and everything/ 
Filename: the_answer_to_life_the_universe_and_everything/42
```

Obviously, my current shell script saves WAY MORE information than you might want for the log.txt file. I'm still learning how to write shell scripts, so I'm sure that I could use grep to make the log file more helpful. Thank you for reviewing my repository! This was a really fun exploration of biology and code! I would love to do more of this kind of exploration :)






















 





