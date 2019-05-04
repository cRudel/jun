#	Theodore Jagodits Assignment 5 CS392
#   I pledge my honor that I have abided by the Stevens Honor System
CC = gcc
RM = rm -rf 

all: cs392_echoclient cs392_echoserver

cs392_echoclient: cs392_echoclient.o
	$(CC) -o cs392_echoclient cs392_echoclient.o

cs392_echoserver: cs392_echoserver.o cs392_log.o
	$(CC) -o cs392_echoserver cs392_echoserver.o cs392_log.o

%.o: %.c
	$(CC) -O3 -o $@ -c $< 

clean:
	$(RM) *.o cs392_echoclient cs392_echoserver