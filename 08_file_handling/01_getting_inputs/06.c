#include<unistd.h>
#include<fcntl.h>

int main(){
    int fd;
    char buffer[100];
    ssize_t bytesread;

    fd = open("hello1.txt", O_RDONLY);
    // check if the file can be openned

    bytesread = read(fd, buffer, sizeof(buffer));
    // check if the file contains any data

    write(1, buffer, bytesread);

    close(fd);
    
    _exit(0);
}