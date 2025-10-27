#include<unistd.h>
#include<string.h>
#include<stdio.h>

int main(int argc,char *argv[]){
    for (int i = 0;i < argc; i++){
        write(1, argv[i], strlen(argv[i]));
        write(1,"\n",1);

        int num = 5;
        printf("C code %i", num);
        // System.out.println("Some output");
        // eax write
        // ebx 1
        // ecx argv[i]
        // edx strlen(argv[i])
    }
    // return 0;  // same as  
    _exit(0);
}
