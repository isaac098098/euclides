#include <stdio.h>
#include <stdlib.h>

const char alpha[] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    ' ', '_', '-', '*', ',', '.', '!', '?', '@', '\''
};

const int alpha_size = *(&alpha + 1) - alpha;

int main(int argc, char** argv) {
    if(argc != 3) {
        printf("Usage: ./enc [text file to decrypt] [key] \n");
        printf("Warning! The encrypted file and the key file will be deleted.\n");
        return 0;
    }
    else {
        FILE *enc = fopen(argv[1], "r");
        FILE *key = fopen(argv[2], "r");
        FILE *dec = fopen("decrypted.txt", "w");

        if((enc == NULL) || (key == NULL)) {
            perror("Error");
            fclose(enc);
            fclose(key);
            return -1;
        }

        int c, size=0;
        while((c = fgetc(enc)) != EOF)
            if (c != '\n')
                size++;

        fclose(enc);
        FILE *encr = fopen(argv[1], "r");

        int cn=0, enc_int[size], key_int[size];
        while((c = fgetc(encr)) != EOF) {
            if (c != '\n') {
                for (int i = 0; i < alpha_size; i++)
                    if(alpha[i] == c)
                       enc_int[cn] = i;
                cn++;
            }
        }

        cn=0;
        while((c = fgetc(key)) != EOF) {
            if (c != '\n') {
                for (int i = 0; i < alpha_size; i++)
                    if(alpha[i] == c)
                       key_int[cn] = i;
                cn++;
            }
        }

        for(int i=0; i < size; i++)
            fputc(alpha[(alpha_size+enc_int[i]-key_int[i]) % alpha_size], dec);

        fclose(dec);
        fclose(enc);
        fclose(key);
        remove(argv[1]);
        remove(argv[2]);
    }
    return 0;
}
