
F90 = gfortran
CC = gcc
CFLAGS = -c -D_REENTRANT -fPIC -I/usr/lib/jvm/java-6-openjdk/include
LDFLAGS = -lgfortran
OBJECTS = CCode.o FortranCode.o

all: libmycodeinc.so JavaCode.class

libmycodeinc.so: $(OBJECTS)
	$(CC) -shared $(LDFLAGS) $(OBJECTS) -o $@

%.o: %.c JavaCode.h
	$(CC) $(CFLAGS) -c $< -o $@

FortranCode.o: FortranCode.f
	$(F90) -c $< -o $@

JavaCode.h: JavaCode.class
	javah -jni -o $@ JavaCode

%.class: %.java
	javac $<

run: libmycodeinc.so JavaCode.class
	java -Djava.library.path=`pwd` JavaCode

clean:
	rm -f JavaCode.h $(OBJECTS)

distclean: clean
	rm -f JavaCode.class libmycodeinc.so

