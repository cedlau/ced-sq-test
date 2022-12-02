#include <stdio.h>
#include <string.h>

void PrintText(char* txt)
{
    if (strlen(txt) > 0)
        if (txt[0] == '#')
            printf("commment\n");
        else
            printf("%s\n", txt);
}

