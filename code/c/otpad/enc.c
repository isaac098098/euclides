#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const char alpha[] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    ' ', '_', '-', '*', ',', '.', '!', '?', '@', '\''
};

const int alpha_size = *(&alpha + 1) - alpha;

int main(int argc, char** argv) {
    if(argc != 2) {
        printf("Usage: ./enc [text file to encrypt]. \nThe input file must contain only alphanumeric characters, spaces or any the following characters: _ - * , . ! ? @ \'  and no line breaks.\n");
        printf("This program generates an encrypted file and a key to decrypt it using the ./dec binary.\n");
        return 0;
    }
    else {
        FILE *clear = fopen(argv[1], "r");
        FILE *encr = fopen("encrypted.txt", "w");
        FILE *key = fopen("key.txt", "w");

        if(clear == NULL) {
            perror("Error");
            fclose(clear);
            return -1;
        }

        int c;
        srand(time(NULL));
        while((c = fgetc(clear)) != EOF) {
            if (c != '\n') {
                int k = rand() % alpha_size;
                fputc(alpha[k], key);

                for (int i = 0; i < alpha_size; i++)
                    if(alpha[i] == c)
                        fputc(alpha[(i+k) % alpha_size], encr);
            }
        }

        fclose(key);
        fclose(encr);
        fclose(clear);
    }
    return 0;
}
