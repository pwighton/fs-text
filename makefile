# This container gives 
#   "Could not find executable pandoc-crossref"
#PANDOC_CONTAINER := pandoc/latex

PANDOC_CONTAINER := nazarewk/pandoc
UID := $(shell id -u)
GID := $(shell id -g)
PANDOC_EXEC = docker run --user ${UID}:${GID} -v ${PWD}:${PWD} -w ${PWD} --entrypoint pandoc ${PANDOC_CONTAINER}
# If you have pandoc installed locally
# PANDOC_EXEC="pandoc"

all: pdf
	echo "make all"

# See `README__arabica.md`
pdf:
	mkdir -p ./output
	${PANDOC_EXEC}                                        \
	  -s                                                  \
	  -o ./output/projectname.pdf                         \
	  --data-dir=${PWD}           \
	  --filter pandoc-crossref                            \
	  --filter pandoc-citeproc                            \
	  --pdf-engine=xelatex                                \
	  --top-level-division=chapter                        \
	  --number-sections                                   \
	  --template examples/default_a/controls/arabica.latex                           \
	  ./core/*.md                                         \
	  ./settings/*.yaml                                   \
	  ./metadata/*.yaml
