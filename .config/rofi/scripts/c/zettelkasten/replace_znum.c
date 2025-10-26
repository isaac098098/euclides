#include "functions.h"

int main(int argc, char **argv) {
    if(argc == 3) {
        const char *card_file_path = strdup(argv[1]);
        size_t card_file_path_len = strlen(card_file_path);
        const char *new_card = strdup(argv[2]);
        size_t new_num_len = strlen(new_card);

        FILE *file = fopen(card_file_path, "r");
        if(!file) {
            fprintf(stderr, "could not open file %s\n", card_file_path);
            return -1;
        }

        char c;
        size_t buffer_size = 0;

        while((c = fgetc(file)) != EOF)
            buffer_size++;

        if(buffer_size == 0) {
            fprintf(stderr, "file %s is empty, skipping...\n", card_file_path);
            return -1;
        }

        char *buffer = malloc(buffer_size);
        rewind(file);
        fread(buffer, sizeof(char), buffer_size, file);
        fclose(file);

        ssize_t pos;

        if((pos = get_first_coincidence(buffer,
                                        buffer_size,
                                        zheader,
                                        zheader_len - 1)) < 0)
        {
            fprintf(stderr, "no zheader found\n");
            return -1;
        }

        size_t npos = (size_t)pos;
        size_t arg_pos;
        size_t read_pos = npos + zheader_len;
        size_t beg_pos = 0;
        size_t end_pos = 0;
        size_t brackets;
        size_t sq_brackets;

        for(size_t i = read_pos; i < buffer_size; i++) {
            /* skip alt title */ 

            if(buffer[i] == '[') {
                arg_pos = 0;
                sq_brackets = 1;

                for(size_t j = i + 1; j < buffer_size; j++) {
                    if(sq_brackets == 0)
                        break;
                    if(buffer[j] == '[')
                        sq_brackets += 1;
                    if(buffer[j] == ']')
                        sq_brackets -= 1;
                    arg_pos++;
                }

                if(sq_brackets != 0) {
                    fprintf(stderr, "inconsistent square brackets\n");
                    return -1;
                }

                if(read_pos == 0) {
                    fprintf(stderr, "could not get alt title argument\n");
                    return -1;
                }

                for(size_t i = 1; i < arg_pos; i++) {
                    printf("%c", buffer[read_pos + i]);
                }

                read_pos += arg_pos + 1;

                /* skip title */
                
                if(buffer[read_pos] == '{') {
                    arg_pos = 0;
                    brackets = 1;

                    for(size_t j = read_pos + 1; j < buffer_size; j++) {
                        if(brackets == 0)
                            break;
                        if(buffer[j] == '{')
                            brackets += 1;
                        if(buffer[j] == '}')
                            brackets -= 1;
                        arg_pos++;
                    }

                    if(brackets != 0) {
                        fprintf(stderr, "inconsistent brackets\n");
                        return -1;
                    }

                    if(read_pos == 0) {
                        fprintf(stderr, "could not get title argument\n");
                        return -1;
                    }

                    printf("\n");
                    for(size_t i = 1; i < arg_pos; i++) {
                        printf("%c", buffer[read_pos + i]);
                    }

                    read_pos += arg_pos + 1;

                    /* skip tags */

                    if(buffer[read_pos] == '{') {
                        arg_pos = 0;
                        brackets = 1;

                        for(size_t j = read_pos + 1; j < buffer_size; j++) {
                            if(brackets == 0)
                                break;
                            if(buffer[j] == '{')
                                brackets += 1;
                            if(buffer[j] == '}')
                                brackets -= 1;
                            arg_pos++;
                        }

                        if(brackets != 0) {
                            fprintf(stderr, "inconsistent brackets\n");
                            return -1;
                        }

                        if(read_pos == 0) {
                            fprintf(stderr, "could not get title argument\n");
                            return -1;
                        }

                        printf("\n");
                        for(size_t i = 1; i < arg_pos; i++) {
                            printf("%c", buffer[read_pos + i]);
                        }

                        read_pos += arg_pos + 1;
                        beg_pos = read_pos + 1;

                        /* get card number */

                        if(buffer[read_pos] == '{') {
                            arg_pos = 0;
                            brackets = 1;

                            for(size_t j = read_pos + 1; j < buffer_size; j++) {
                                if(brackets == 0)
                                    break;
                                if(buffer[j] == '{')
                                    brackets += 1;
                                if(buffer[j] == '}')
                                    brackets -= 1;
                                arg_pos++;
                            }

                            if(brackets != 0) {
                                fprintf(stderr, "inconsistent brackets\n");
                                return -1;
                            }

                            if(read_pos == 0) {
                                fprintf(stderr, "could not get title argument\n");
                                return -1;
                            }

                            printf("\n");
                            for(size_t i = 1; i < arg_pos; i++) {
                                printf("%c", buffer[read_pos + i]);
                            }
                            printf("\n");

                            end_pos = read_pos + arg_pos;
                            break;
                        }
                    }
                }
                else {
                    fprintf(stderr, "could not get title argument\n");
                    return -1;
                }

                return 0;
            }

            /* or skip title */

            else if(buffer[i] == '{') {
                arg_pos = 0;
                brackets = 1;

                for(size_t j = i + 1; j < buffer_size; j++) {
                    if(brackets == 0)
                        break;
                    if(buffer[j] == '{')
                        brackets += 1;
                    if(buffer[j] == '}')
                        brackets -= 1;
                    arg_pos++;
                }

                if(brackets != 0) {
                    fprintf(stderr, "inconsistent brackets\n");
                    return -1;
                }

                if(read_pos == 0) {
                    fprintf(stderr, "could not get title argument\n");
                    return -1;
                }

                for(size_t i = 1; i < arg_pos; i++) {
                    printf("%c", buffer[read_pos + i]);
                }

                read_pos += arg_pos + 1;

                /* skip tags */
                
                if(buffer[read_pos] == '{') {
                    arg_pos = 0;
                    brackets = 1;

                    for(size_t j = read_pos + 1; j < buffer_size; j++) {
                        if(brackets == 0)
                            break;
                        if(buffer[j] == '{')
                            brackets += 1;
                        if(buffer[j] == '}')
                            brackets -= 1;
                        arg_pos++;
                    }

                    if(brackets != 0) {
                        fprintf(stderr, "inconsistent brackets\n");
                        return -1;
                    }

                    if(read_pos == 0) {
                        fprintf(stderr, "could not get title argument\n");
                        return -1;
                    }

                    printf("\n");
                    for(size_t i = 1; i < arg_pos; i++) {
                        printf("%c", buffer[read_pos + i]);
                    }

                    read_pos += arg_pos + 1;
                    beg_pos = read_pos + 1;

                    /* get card number */

                    if(buffer[read_pos] == '{') {
                        arg_pos = 0;
                        brackets = 1;

                        for(size_t j = read_pos + 1; j < buffer_size; j++) {
                            if(brackets == 0)
                                break;
                            if(buffer[j] == '{')
                                brackets += 1;
                            if(buffer[j] == '}')
                                brackets -= 1;
                            arg_pos++;
                        }

                        if(brackets != 0) {
                            fprintf(stderr, "inconsistent brackets\n");
                            return -1;
                        }

                        if(read_pos == 0) {
                            fprintf(stderr, "could not get title argument\n");
                            return -1;
                        }

                        printf("\n");
                        for(size_t i = 1; i < arg_pos; i++) {
                            printf("%c", buffer[read_pos + i]);
                        }
                        printf("\n");

                        end_pos = read_pos + arg_pos;
                        
                        break;
                    }
                }
                else {
                    fprintf(stderr, "could not get title argument\n");
                    return -1;
                }
            }
        }

        // size_t old_num_len = end_pos - beg_pos; 
        size_t new_buffer_size = beg_pos
                                 + new_num_len
                                 + (buffer_size - end_pos);
        char *new_buffer = malloc(new_buffer_size);

        memcpy(new_buffer, buffer, beg_pos);
        memcpy(new_buffer + beg_pos, new_card, new_num_len);
        memcpy(new_buffer + beg_pos + new_num_len,
               buffer + end_pos, buffer_size - end_pos);

        // new_buffer[new_buffer_size - 1] = '\0';

        // printf("%s", new_buffer);

        size_t tmp_file_path_len = card_file_path_len + strlen(".tmp") + 1;
        char *tmp_file_path = malloc(tmp_file_path_len);
        snprintf(tmp_file_path, tmp_file_path_len, "%s.tmp",
                                                   card_file_path);

        printf("%s\n", tmp_file_path);

        /* overwrite card file */

        FILE *tmp_file = fopen(tmp_file_path, "w");
        if(!tmp_file) {
            fprintf(stderr, "could not open temporary file %s\n", tmp_file_path);
            return -1;
        }

        fwrite(new_buffer, sizeof(char), new_buffer_size, tmp_file);
        fclose(tmp_file);

        rename(tmp_file_path, card_file_path);

        return 0;
    }
    else
        printf("usage: ./replace_znum [CARD_FILE_PATH] [NEW_CARD]\n");

    return 0;
}
