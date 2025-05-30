#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    int sockfd;
    int len;
    struct sockaddr_in address;
    int result;
    char request[] = "GET / HTTP/1.0\r\n\r\n";
    char response[1024];
    int bytes_read;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1) {
        perror("socket creation failed");
        exit(1);
    }

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = inet_addr("127.0.0.1");
    address.sin_port = htons(4000);
    len = sizeof(address);
    result = connect(sockfd, (struct sockaddr *)&address, len);

    if (result == -1)
    {
        perror("connection failed");
        exit(1);
    }

    printf("Connected to HTTP server on port 4000\n");
    
    // 发送HTTP GET请求
    write(sockfd, request, strlen(request));
    printf("Sent HTTP request: %s", request);
    
    // 读取并显示响应
    bytes_read = read(sockfd, response, sizeof(response) - 1);
    if (bytes_read > 0) {
        response[bytes_read] = '\0';
        printf("Response from server:\n%s\n", response);
    } else {
        printf("No response received\n");
    }
    
    close(sockfd);
    printf("Connection closed\n");
    exit(0);
}
