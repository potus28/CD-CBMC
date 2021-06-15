FC=gfortran
FCFLAGS=-O3 -std=f2008

main.out: obj/main.o
	mkdir -p exe
	${FC} ${FCFLAGS} obj/main.o -o exe/main.out

main.o: src/main.f90	
	mkdir -p objects
	${FC} ${FCFLAGS} -c src/main.f90 -o obj/main.o

clean:
	rm -r exe
	rm -r obj
