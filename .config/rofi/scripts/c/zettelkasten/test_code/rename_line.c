#include "functions.h"

int main(int argc, char **argv) {
    if(argc == 4) {
        const char *main_file = strdup(argv[1]);
        const char *card_no_ext = strdup(argv[2]);
        size_t card_no_ext_len = strlen(card_no_ext);
        const char *new_name = strdup(argv[3]);
        size_t new_name_len = strlen(new_name);

        /* construct target card pattern */
        size_t card_pattern_len = include_1_len + card_no_ext_len
                                  + EXT_LEN
                                  + include_2_len
                                  + 1;
        char *card_pattern = malloc(card_pattern_len);
        snprintf(card_pattern, card_pattern_len, "%s%s%s%s",
                                                 include_1,
                                                 card_no_ext,
                                                 EXT,
                                                 include_2);

        /* construct replacement card pattern */

        size_t replacement_len = include_1_len
                               + new_name_len
                               + EXT_LEN
                               + include_2_len
                               + 1;

        char *replacement = malloc(replacement_len);
        snprintf(replacement, replacement_len, "%s%s%s%s",
                                                include_1,
                                                new_name,
                                                EXT,
                                                include_2);

        FILE *file = fopen(main_file, "r");
        if(!file) {
            fprintf(stderr, "could not open file %s\n", main_file);
            return -1;
        }

        char c;
        size_t buffer_size = 0;
        while((c = fgetc(file)) != EOF)
            buffer_size++;

        if(buffer_size == 0) {
            fprintf(stderr, "file %s is empty\n", main_file);
            fprintf(stderr, "consider regenerating the index\n");
            return -1;
        }

        char *buffer = malloc(buffer_size);
        rewind(file);
        fread(buffer, sizeof(char), buffer_size, file);

        fclose(file);

        ssize_t pos;

        if((pos = get_first_coincidence(buffer,
                                        buffer_size,
                                        card_pattern,
                                        card_pattern_len - 1)) < 0)
        {
            fprintf(stderr, "card %s not found in main file\n", card_no_ext);
            fprintf(stderr, "consider regenerating the index\n");
            return -1;
        }

        size_t real_card_len = strlen(card_pattern);
        size_t real_repl_len = strlen(replacement);

        size_t new_buffer_size = buffer_size + real_repl_len - real_card_len;
        char *new_buffer = malloc(new_buffer_size);

        if(new_buffer != NULL) {
            memcpy(new_buffer, buffer, pos);
            memcpy(new_buffer + pos, replacement, real_repl_len);
            memcpy(new_buffer + pos + real_repl_len,
                   buffer + pos + real_card_len,
                   buffer_size - pos - real_card_len);

            /* overwrite main file */

            size_t tmp_file_path_len = strlen(main_file) + strlen(".tmp") + 1;
            char *tmp_file_path = malloc(tmp_file_path_len);
            snprintf(tmp_file_path, tmp_file_path_len, "%s.tmp", main_file);

            FILE *tmp_file = fopen(tmp_file_path, "w");
            if(!tmp_file) {
                fprintf(stderr, "could not create temporary file\n");
                return -1;
            }

            fwrite(new_buffer, sizeof(char), new_buffer_size, tmp_file);
            fclose(tmp_file);

            rename(tmp_file_path, main_file);
        }
        else
            return -1;
    }
    else
        printf("usage: ./delete_line [MAIN_FILE_DIR] [CARD_NO_EXT] [NEW_CARD_NAME]\n");

    return 0;
}
