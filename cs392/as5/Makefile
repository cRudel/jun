#	Christopher Rudel
#	Professor Xu
#	CS 392
#	Makefile
#   I pledge my honor that I have abided by the Stevens Honor System Christopher Rudel

CC = gcc
RM = rm -rf 

all: cs392_echoserver cs392_echoclient

cs392_echoserver: cs392_echoserver.o cs392_log.o
	$(CC) -o cs392_echoserver cs392_echoserver.o cs392_log.o

cs392_echoclient: cs392_echoclient.o
	$(CC) -o cs392_echoclient cs392_echoclient.o

clean:
	$(RM) *.o 
	$(RM) cs392_echoserver
	$(RM) cs392_echoclient

re: clean all