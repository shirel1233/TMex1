CC = gcc
AR = ar
CFLAGS = -Wall -g
LIBS = -lm

OBJECT_MAIN = main.o
OBJECT_LOOP = advancedClassificationLoop.o basicClassification.o
OBJECT_REC = advancedClassificationRecursion.o basicClassification.o

all: loops loopd recursives recursived maindloop maindrec mains

loops: libclassloops.a
libclassloops.a: $(OBJECT_LOOP)
	$(AR) -rcs libclassloops.a $(OBJECT_LOOP)

loopd: libclassloops.so
libclassloops.so: $(OBJECT_LOOP)
	$(CC) -shared -o libclassloops.so $(OBJECT_LOOP)

recursives: libclassrec.a
libclassrec.a: $(OBJECT_REC)
	$(AR) -rcs libclassrec.a $(OBJECT_REC)

recursived: libclassrec.so
libclassrec.so: $(OBJECT_REC)
	$(CC) -shared -o libclassrec.so $(OBJECT_REC)

mains: $(OBJECT_MAIN) libclassrec.a
	$(CC) $(CFLAGS) -o mains $(OBJECT_MAIN) libclassrec.a $(LIBS)

maindloop: $(OBJECT_MAIN)
	$(CC) $(CFLAGS) -o maindloop $(OBJECT_MAIN) ./libclassloops.so $(LIBS)

maindrec: $(OBJECT_MAIN)
	$(CC) $(CFLAGS) -o maindrec $(OBJECT_MAIN) ./libclassrec.so $(LIBS)

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) -c advancedClassificationRecursion.c

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) -c basicClassification.c

main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c main.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
