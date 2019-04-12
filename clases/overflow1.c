// gcc test.c -o testc -m32 -fno-pic -z execstack -mpreferred-stack-boundary=2 -fno-stack-protector

void return_input(void){
    char array[30];
    gets(array);
    printf("%s\n", array);
}

main(){
    return_input();
    return 0;
}