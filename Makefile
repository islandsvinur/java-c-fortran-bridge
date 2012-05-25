
all: libmycodeinc.so JavaCode.class

libmycodeinc.so: CCode.o
	gcc -shared CCode.o -o libmycodeinc.so

CCode.o: CCode.c JavaCode.h
	gcc -c -D_REENTRANT -fPIC -I/usr/lib/jvm/java-6-openjdk/include -c CCode.c

JavaCode.h: JavaCode.class
	javah -jni JavaCode

JavaCode.class: JavaCode.java
	javac JavaCode.java

run: libmycodeinc.so JavaCode.class
	java -Djava.library.path=`pwd` JavaCode

clean:
	rm -f JavaCode.class JavaCode.h CCode.o libmycodeinc.so

