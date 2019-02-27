#You need to place cs392_sum.c and main.c in the same folder!!!

CC=gcc
OBJS = main.o libcs392_sum.so

prog : $(OBJS)
	$(CC) -o prog main.o libcs392_sum.so

main.o: main.c
	$(CC) -o main.o -c main.c

libcs392_sum.so : cs392_sum.o
	$(CC) -shared -fPIC -o libcs392_sum.so cs392_sum.o

cs392_sum.o : cs392_sum.c
	$(CC) -o cs392_sum.o -c cs392_sum.c

clean: 
	rm *.so *.o

fclean: clean
	rm prog

re: fclean prog

