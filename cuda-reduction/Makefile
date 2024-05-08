.DEFAULT_GOAL := all

all: kernel.o driver.out

kernel.o : kernel.cu
	nvcc -c kernel.cu -o kernel.o

driver.out : driver.cu
	nvcc driver.cu -o driver.out

clean:
	rm -r *.o *.out