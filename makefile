CC = gcc
CFLAGS = -Wall -fPIC
LIBS = -lm

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec

basicClassification.o: basicClassification.c
	$(CC) $(CFLAGS) -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(CFLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(CFLAGS) -c advancedClassificationRecursion.c

libclassloops.a: basicClassification.o advancedClassificationLoop.o
	ar rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	ar rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	$(CC) -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o $(LIBS)

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	$(CC) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o $(LIBS)

mains: main.c libclassrec.a
	$(CC) $(CFLAGS) -o mains main.c libclassrec.a $(LIBS)

maindloop: main.c libclassloops.so
	$(CC) $(CFLAGS) -o maindloop main.c -L. -lclassloops $(LIBS)

maindrec: main.c libclassrec.so
	$(CC) $(CFLAGS) -o maindrec main.c -L. -lclassrec $(LIBS)

loops: libclassloops.a maindloop

recursives: libclassrec.a mains

recursive: libclassrec.so maindrec

loopd: libclassloops.so maindloop

clean:
	rm -f *.o *.a *.so mains maindloop maindrec

.PHONY: all loops recursives recursive loopd clean
