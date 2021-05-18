all: fast slow

fast: fast.o driver.c fast.S
	clang driver.c fast.o -o fast

slow: slow.o driver.c slow.S
	clang driver.c slow.o -o slow

fast.o: fast.ll
	clang -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  fast.ll -c -o fast.o
	clang -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  fast.ll -S -o fast.S

slow.o: slow.ll
	clang  -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  slow.ll -c -o slow.o
	clang  -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  slow.ll -S -o slow.S

bench: fast slow
	time ./fast
	time ./slow

clean:
	rm -f *.o *.S fast slow