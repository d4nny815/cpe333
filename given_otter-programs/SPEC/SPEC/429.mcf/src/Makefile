
SOURCES= mcf.c mcfutil.c readmin.c implicit.c pstart.c output.c treeup.c \
	 pbla.c pflowup.c psimplex.c pbeampp.c

CC=clang 
#gcc
CFLAGS=-S -emit-llvm
#-O0 
COMP_FLAGS=-DSPEC_CPU -DNDEBUG -DWANT_STDC_PROTO
#-lm -DSPEC_CPU -DNDEBUG  -DWANT_STDC_PROTO -static

all: $(SOURCES)
	$(CC) $(COMP_FLAGS) $(SOURCES) $(CFLAGS) 
	
	#-o benchmark



