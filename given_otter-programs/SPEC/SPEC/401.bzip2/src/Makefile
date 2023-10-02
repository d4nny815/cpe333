
SOURCES= spec.c blocksort.c bzip2.c bzlib.c compress.c crctable.c \
	 decompress.c huffman.c randtable.c
#gcc -O0
CC=clang
CFLAGS=-S -emit-llvm
#COMP_FLAGS=-lm -DSPEC_CPU -DNDEBUG -static
COMP_FLAGS= -DSPEC_CPU 

all: $(SOURCES)
	$(CC) $(COMP_FLAGS) $(SOURCES) $(CFLAGS) -o benchmark



