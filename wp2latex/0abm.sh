# process blog posting (bm.tex) root file 
# run in latex bm.tex root directory with $bash 0abm.sh

echo "Running Blog Master/LaTeX  ..."

# first pass for aux file needed by bibtex
lualatex bm

# generate/reset bbl file
# bibtex bm
makeindex bm

# resolve all internal references - may
# comment out when debugging entire document
lualatex bm
lualatex bm

echo "Blog Master/LaTeX complete"