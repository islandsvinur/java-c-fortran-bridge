
all: libmycodeinc.so JavaCode.class

libmycodeinc.so: CCode.o FortranCode.o
	gcc -shared CCode.o FortranCode.o -lgfortran -o libmycodeinc.so

CCode.o: CCode.c JavaCode.h
	gcc -c -D_REENTRANT -fPIC -I/usr/lib/jvm/java-6-openjdk/include -c CCode.c

FortranCode.o: FortranCode.f
	gfortran -c FortranCode.f

JavaCode.h: JavaCode.class
	javah -jni JavaCode

JavaCode.class: JavaCode.java
	javac JavaCode.java

run: libmycodeinc.so JavaCode.class
	java -Djava.library.path=`pwd` JavaCode

clean:
	rm -f JavaCode.h CCode.o FortranCode.o

distclean: clean
	rm -f JavaCode.class libmycodeinc.so

