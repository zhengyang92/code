OPTFLAGS=-mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl
all: fast slow

fast: fast.o driver.c fast.S
	clang driver.c fast.o -o fast

slow: slow.o driver.c slow.S
	clang driver.c slow.o -o slow

fast.S: fast.ll
	clang -O3 $(OPTFLAGS)  fast.ll -S -o fast.S

fast.o: fast.S
	clang $(OPTFLAGS) fast.S -c -o fast.o

slow.S: slow.ll
	clang  -O3 $(OPTFLAGS) slow.ll -S -o slow.S

slow.o: slow.S
	clang $(OPTFLAGS) slow.S -c -o slow.o

timing: fast slow
	time ./fast
	time ./slow

clean:
	rm -f *.o *.S fast slow