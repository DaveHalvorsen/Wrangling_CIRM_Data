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
