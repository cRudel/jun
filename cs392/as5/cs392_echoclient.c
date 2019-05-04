
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
	if(argc != 3){
		perror("Incorrect number of arguments: Expected 2.\n");
		exit(EXIT_FAILURE);
	}

	int sock;
	struct sockaddr_in echoserver;
	char buffer[1024];

	if( (sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == 0){
		perror("Socket failure. Exiting...\n");
		exit(EXIT_FAILURE);
	}
	memset(&echoserver, 0, sizeof(echoserver));
	echoserver.sin_family = AF_INET;
	echoserver.sin_addr.s_addr = inet_addr(argv[1]); /*Should be the IP address*/
	echoserver.sin_port = htons(atoi(argv[2])); /*Should be server port*/
	
	if( connect(sock, (struct sockaddr *) &echoserver, sizeof(echoserver)) < 0){
		perror("Connection failed. Exiting...\n");
		exit(EXIT_FAILURE);
	}
	printf("Connection established. Please enter your message to the server\n");
	scanf("%s", buffer);

	send(sock, buffer, strlen(buffer), 0);
	recv(sock, buffer, 1024-1, 0);

	printf("Received message: %s\n", buffer);

}
