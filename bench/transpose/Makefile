all: fast slow

fast: fast.o driver.c fast.S
	clang driver.c fast.o -o fast

slow: slow.o driver.c slow.S
	clang driver.c slow.o -o slow

fast.S: fast.ll
	clang -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  fast.ll -S -o fast.S

fast.o: fast.S
	clang -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl fast.S -c -o fast.o

slow.S: slow.ll
	clang  -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  slow.ll -S -o slow.S

slow.o: slow.S
	clang -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  slow.S -c -o slow.o

timing: fast slow
	time ./fast
	time ./slow

clean:
	rm -f *.o *.S fast slow