FC=gfortran
FCFLAGS=-O3

main.out: main.o
	mkdir -p exe
	${FC} ${FCFLAGS} objects/main.o -o exe/main.out

main.o: main.f90	
	mkdir -p objects
	${FC} ${FCFLAGS} -c main.f90 -o objects/main.o

clean:
	rm -r exe
	rm -r objects
