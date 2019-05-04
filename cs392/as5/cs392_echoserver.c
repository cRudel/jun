
#include <stdio.h>
#include <netdb.h> 
#include <netinet/in.h> 
#include <stdlib.h> 
#include <string.h> 
#include <sys/socket.h> 
#include <sys/types.h> 
#include <arpa/inet.h>
#include <unistd.h>




int main(int argc, char** argv){
	if(argc != 2){
		perror("Incorrect number of arguments: Expected 1.\n");
		exit(EXIT_FAILURE);
	}

	char buffer[1024];
	int serversock, clientsock;
	struct sockaddr_in echoserver, echoclient;
	int clientlen = sizeof(echoclient);



	if((serversock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == 0){
		perror("Socet failure. Exiting...\n");
		exit(EXIT_FAILURE);
	}
	memset(&echoserver, 0, sizeof(echoserver));
	echoserver.sin_family = AF_INET;
	echoserver.sin_addr.s_addr = htonl(INADDR_ANY);
	echoserver.sin_port = htons(atoi(argv[1])); /*should be the server port*/
	if(bind(serversock, (struct sockaddr*) &echoserver, sizeof(echoserver)) < 0){
		perror("Bind failure. Exiting...\n");
		exit(EXIT_FAILURE);
	}

	if(listen(serversock, 5) < 0){	/* In the lecutre code he set MAXPENDING to 5, its the same thing */
		perror("Error listening. Exiting...\n");
		exit(EXIT_FAILURE);
	}

	if((clientsock = accept(serversock, (struct sockaddr *) &echoclient, &clientlen)) < 0){
		perror("Error accepting. Exiting...\n");
		exit(EXIT_FAILURE);
	}

	recv(clientsock, buffer, 1024, 0);
	printf("%s\n", buffer);
	send(clientsock, buffer, strlen(buffer), 0);
	printf("Message sent back\n");
	return 0;
}