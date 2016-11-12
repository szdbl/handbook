

# show first n rows of a text file
def file_head(p, n):
	with open(p) as f:
	    head = [next(f) for x in xrange(n)]
	print head

# Count file length / number of lines
def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

# list files
def list_files(p_folder):
	import os
	from os import listdir
	from os.path import isfile, join
	return [f for f in listdir(p_folder) if isfile(join(p_folder, f))]