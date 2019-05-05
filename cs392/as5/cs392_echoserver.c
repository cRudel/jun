/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   cs392_echoserver.c
*   I pledge my honor that I have abided by the Stevens Honor System Christopher RUdel
*
*/

#include "cs392_log.h"

int main(int argc, char** argv){
	if(argc != 2){
		perror("Incorrect number of arguments: Expected 1.\n");
		exit(EXIT_FAILURE);
	}

	char buffer[1024];
	int serversock, clientsock, incomingData;
	struct sockaddr_in echoserver, echoclient;
	int clientlen = sizeof(struct sockaddr_in);

	if((serversock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == -1){
		perror("Socet failure. Exiting...\n");
		exit(EXIT_FAILURE);
	}
	memset(&echoserver, 0, sizeof(echoserver));
	echoserver.sin_family = AF_INET;
	echoserver.sin_addr.s_addr = htonl(INADDR_ANY);
	echoserver.sin_port = htons(atoi(argv[1])); /*should be the server port*/
	bzero(&echoserver.sin_zero, 8);
	if(bind(serversock, (struct sockaddr*) &echoserver, sizeof(echoserver)) < 0){
		perror("Bind failure. Exiting...\n");
		exit(EXIT_FAILURE);
	}
	if(listen(serversock, 5) < 0){	/* In the lecutre code he set MAXPENDING to 5, its the same thing */
		perror("Error listening. Exiting...\n");
		exit(EXIT_FAILURE);
	}
	printf("Now listening for incoming connections...\n");
	while(1){
		printf("in the while loop\n");
		clientsock = accept(serversock, (struct sockaddr *) &echoclient, &clientlen);
		if(clientsock < 0){
			perror("Error accepting. Exiting...\n");
			exit(EXIT_FAILURE);
		}
		printf("Client connected. IP address: %s, port number: %d\n", inet_ntoa(echoclient.sin_addr), ntohs(echoclient.sin_port));
		fflush(stdout);
		cs392_socket_log(inet_ntoa(echoclient.sin_addr), ntohs(echoclient.sin_port));  
		incomingData = 1;
		if( recv(clientsock, buffer, 1023, 0) == -1){
			perror("Error receiving. Exiting...\n");
			exit(EXIT_FAILURE);
		}
		send(clientsock, buffer, strlen(buffer), 0);
		printf("Sent message: %s\n", buffer);
		close(clientsock);
		
	}
	
	return 0;
}