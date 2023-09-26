FMTPATH=ext/fmt-10.1.1
CXXFLAGS?=-Wall -ggdb -std=c++17 -O2 -MMD -I ${FMTPATH}/include
CFLAGS?= ${CXXFLAGS}
LDFLAGS = -pthread
LIBS= 

PROGRAMS= hello

all: $(PROGRAMS)

-include *.d

hello: hello.o ${FMTPATH}/src/format.o ${FMTPATH}/src/os.o
	g++ ${LDFLAGS} $^ -o $@

clean:
	rm -f *~ $(PROGRAMS) *.o *.d
	rm ${FMTPATH}/src/format.o ${FMTPATH}/src/os.o

