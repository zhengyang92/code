all: fast slow

fast: fast.o driver.c fast.s
	clang driver.c fast.o -o fast

slow: slow.o driver.c slow.s
	clang driver.c slow.o -o slow

fast.o: fast.ll
	clang -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  fast.ll -c -o fast.o
	clang -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  fast.ll -S -o fast.s

slow.o: slow.ll
	clang -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  slow.ll -c -o slow.o
	clang -O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl  fast.ll -S -o slow.s

bench: fast slow
	time ./fast
	time ./slow

clean:
	rm -f *.o *.s fast slow