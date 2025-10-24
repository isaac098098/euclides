#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <errno.h>
#include <time.h>

#define EXT ".tex"

const int* compute_prefix_function(const char* pattern, const size_t pattern_len) {
    if(pattern_len == 0) return NULL;

    int *pi = malloc(pattern_len * sizeof(int));
    if (!pi) return NULL;

    pi[0] = 0;
    int k = 0;

    for(int q = 1; q < pattern_len; q++) {
        while(k > 0 && pattern[k] != pattern[q])
            k = pi[k - 1];
        if(pattern[k] == pattern[q])
            k++;
        pi[q] = k;
    }

    return pi;
}

const char* buffer_replace(char* buffer,
        size_t buffer_size,
        const char *pttr,
        const size_t pttr_size,
        const int* pi,
        const char *rplc,
        size_t rplc_size,
        size_t *new_buffer_size)
{
    if(buffer == NULL)
        return NULL;

    size_t new_size;
    char *new_buffer;

    /* knuth-morris-pratt */

    size_t q = 0;
    size_t match_num = 0;
    size_t *matches_pos = malloc(sizeof(size_t));

    for(size_t i = 0; i < buffer_size; i++) {
        while(q > 0 && pttr[q] != buffer[i])
            q  = pi[q - 1];
        if(pttr[q] == buffer[i])
            q++;
        if(q == pttr_size) {
            printf("pattern found with shift %ld\n", (long)(i + 1 - pttr_size));
            match_num++;
            matches_pos = realloc(matches_pos, match_num * sizeof(size_t));
            matches_pos[match_num - 1] = i + 1 - pttr_size;
            q = pi[q - 1];
        }
    }

    if(match_num == 0)
        return NULL;

    new_size = buffer_size + match_num * (rplc_size - pttr_size);
    new_buffer = malloc(new_size + 1);

    size_t write_pos = 0, read_pos = 0;

    for(int i = 0; i < match_num ; i++) {
        size_t prefix_len = matches_pos[i] - read_pos;

        memcpy(new_buffer + write_pos, buffer + read_pos, prefix_len);
        write_pos += prefix_len;
        read_pos += prefix_len;

        memcpy(new_buffer + write_pos, rplc, rplc_size);
        write_pos += rplc_size;
        read_pos += pttr_size;
    }

    free(matches_pos);

    if (read_pos < buffer_size) {
        size_t remaining = buffer_size - read_pos;
        memcpy(new_buffer + write_pos, buffer + read_pos, remaining);
        write_pos += remaining;
    }

    new_buffer[new_size] = '\0';
    *new_buffer_size = new_size;

    return new_buffer;
}

int replace(const char* file_path,
            const char* pattern,
            size_t pattern_size,
            const int *pi,
            const char* replacement,
            size_t replacement_size)
{
    size_t new_buffer_size;
    const char* new_file;
    FILE *file;

    printf("processing %s...\n", file_path);

    file = fopen(file_path, "r");

    if(!file) {
        fprintf(stderr, "no such file\n");
        return -1;
    }

    fseek(file, 0, SEEK_END);
    size_t size = ftell(file);
    rewind(file);

    if(size == 0) {
        printf("file %s is empty, skipping...\n", file_path);
        fclose(file);
        return -1;
    }

    char *buffer = malloc(size + 1);
    fread(buffer, sizeof(char), size, file);
    buffer[size] = '\0';
    fclose(file);

    new_file = buffer_replace(buffer,
                              size,
                              pattern,
                              pattern_size,
                              pi,
                              replacement,
                              replacement_size,
                              &new_buffer_size);

    if(new_file == NULL) {
        printf("pattern not found\n");
    }
    else {
        size_t tmp_path_size;
        char *tmp_path;
        FILE *tmp_file;

        tmp_path_size = strlen(file_path) + strlen(".tmp") + 1;
        tmp_path = malloc(tmp_path_size);
        snprintf(tmp_path, tmp_path_size, "%s.tmp", file_path);
        tmp_path[tmp_path_size] = '\0';

        tmp_file = fopen(tmp_path, "w");

        if(tmp_file == NULL) {
            fprintf(stderr, "could not open %s\n", tmp_path);
            return -1;
        }

        fwrite(new_file, sizeof(char), new_buffer_size, tmp_file);

        if(new_file[new_buffer_size - 1] != '\n')
            fputc('\n', tmp_file);

        fclose(tmp_file);

        rename(tmp_path, file_path);

        free(tmp_path);
    }

    free(buffer);

    return 0;
}

int main(int argc, char **argv) {
    if(argc == 4) {
        DIR *dir;
        struct dirent *dp;

        const char* main_dir = strdup(argv[1]);
        const char* cards_dir = strdup(argv[2]);
        const char* card = strdup(argv[3]);
        size_t card_len = strlen(card);
        const char* replacement = "\\texttt{deleted card}";
        size_t replacement_len = strlen(replacement);

        /* parse card name */

        if(!(card_len > 4 && strcmp(card + card_len - 4, EXT) == 0)) {
            fprintf(stderr, "invalid card file %s\n", card);
            fprintf(stderr, "file must have extension \".tex\"\n");
            return -1;
        }

        /* parse and open directory path */

        if(cards_dir[strlen(cards_dir) - 1] != '/') {
            size_t dir_path_len = strlen(cards_dir) + 2;
            char *tmp;

            tmp = malloc(dir_path_len);
            snprintf(tmp, dir_path_len, "%s/", cards_dir);
            tmp[dir_path_len + 1] = '\0';
            cards_dir = tmp;
        }

        dir = opendir(cards_dir);

        if(!dir) {
            fprintf(stderr, "no such directory \"%s\"\n", cards_dir);
            return -1;
        }

        /* search for subcards of card */

        while((dp = readdir(dir)) != NULL) {
            char *name = strdup(dp->d_name);
            size_t len = strlen(name);

            if(strcmp(name, ".") != 0 && strcmp(name, "..") != 0) {
                if(len > 4 && strcmp(name + len - 4, EXT) == 0) {
                    if(strncmp(name, card, card_len - 4) == 0 && len > card_len) {
                        printf("failed to delete %s%s\n", cards_dir, card);
                        printf("card %s has subcard %s\n", card, name);
                        return -1;
                    }
                }
            }

            free(name);
        }

        /* construct card path */

        size_t dir_path_len = strlen(cards_dir);
        size_t card_path_len = dir_path_len + card_len + 1;
        char *card_path = malloc(card_path_len);
        snprintf(card_path, card_path_len, "%s%s", cards_dir, card);
        card_path[card_path_len] = '\0';

        /* delete card */

        // if(remove(card_path) == 0) {
            // printf("card %s deleted\n", card_path);
        // }
        // else {
            // fprintf(stderr, "failed to delete card %s\n", card_path);
            // fprintf(stderr, "%s\n", strerror(errno));
            // return -1;
        // }

        /* construct pattern */

        char *name_no_ext = strndup(card, card_len - 4);
        const char *tex_code_1 = "\\hyperref[card:";
        const char *tex_code_2 = "]{\\textsf{";
        const char *tex_code_3 = "}}";

        size_t tex_code_len = strlen(tex_code_1)
                              + strlen(tex_code_2)
                              + strlen(tex_code_3);

        size_t pattern_len = 2 * (card_len - 4) + tex_code_len + 1;
        char *pattern = malloc(pattern_len);
        snprintf(pattern, pattern_len, "%s%s%s%s%s",
                                       tex_code_1,
                                       name_no_ext,
                                       tex_code_2,
                                       name_no_ext,
                                       tex_code_3);
        pattern[pattern_len - 1] = '\0';

        const int *pi = compute_prefix_function(pattern, pattern_len - 1);

        /* update refs of deleted card */

        rewinddir(dir);

        while((dp = readdir(dir)) != NULL) {
            char *name = strdup(dp->d_name);
            size_t len = strlen(name);

            if(strcmp(name, ".") != 0 && strcmp(name, "..") != 0) {
                if(len > 4 && strcmp(name + len - 4, EXT) == 0) {

                    /* construct file path */

                    char *file_path;
                    size_t file_path_len = dir_path_len + len + 1;
                    file_path = malloc(file_path_len);
                    snprintf(file_path, file_path_len, "%s%s", cards_dir, name);
                    file_path[file_path_len] = '\0';
                    // printf("%s\n", file_path);
                                         
                    /* replace coincidences */

                    replace(file_path,
                            pattern,
                            pattern_len - 1,
                            pi,
                            replacement,
                            replacement_len);
                }
            }

            free(name);
        }

        /* recusively backward rename sibling */
        /* cards and update refs of renamed cards */
    }
    else
        printf("usage: ./delete_card [MAIN_FILE_DIR] [CARDS_DIR] [CARD_FILE]\n");

    printf("time use: %.6fs\n", (double)clock() / CLOCKS_PER_SEC);

    return 0;
}
