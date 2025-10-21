#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <dirent.h>

#define EXT ".tex"

const int* compute_prefix_function(const char* p, const size_t m) {
    if(m == 0) return NULL;

    int *pi = malloc(m * sizeof(int));
    if (!pi) return NULL;

    pi[0] = 0;
    int k = 0;

    for(int q = 1; q < m; q++) {
        while(k > 0 && p[k] != p[q])
            k = pi[k - 1];
        if(p[k] == p[q])
            k++;
        pi[q] = k;
    }

    return pi;
}

const char* create_buffer_and_replace(char* buffer,
            size_t buffer_size,
            const char *pttr,
            const size_t pttr_size,
            const char *rplc,
            size_t rplc_size,
            const int* pi,
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

int main(int argc, char** argv) {
    DIR *dir;
    struct dirent *dp;

    if(argc == 4) {
        const char *path = strdup(argv[1]);
        const char *pattern = strdup(argv[2]);
        const char *replacement = strdup(argv[3]);

        const size_t m = strlen(pattern);
        const size_t n = strlen(replacement);

        if(m == 0)
            return -1;

        const int *pi = compute_prefix_function(pattern, m);

        if(pi == NULL) {
            fprintf(stderr, "could not compute prefix function\n");
            return -1;
        }

        // printf("argv[1]: %s\n", path);
        // printf("argv[2]: %s\n", pattern);
        // printf("argv[3]: %s\n", replacement);

        dir = opendir(path);

        if(!dir) {
            fprintf(stderr, "no such directory \"%s\"\n", path);
            return -1;
        }

        while((dp = readdir(dir)) != NULL) {
            if(strcmp(dp->d_name, ".") != 0 && strcmp(dp->d_name, "..") != 0) {
                size_t len = strlen(dp->d_name);
                if(len > 4 && strcmp(dp->d_name + len - 4, EXT) == 0) {
                    size_t new_buffer_size;
                    const char* new_file;
                    char *full_path;
                    FILE *file;

                    char *name = strdup(dp->d_name);

                    if(path[strlen(path) - 1] == '/') {
                        size_t full_path_len = strlen(path) + strlen(name) + 1;
                        full_path = malloc(full_path_len);
                        snprintf(full_path, full_path_len, "%s%s", path, name);
                    }
                    else {
                        size_t full_path_len = strlen(path) + strlen(name) + 2;
                        full_path = malloc(full_path_len);
                        snprintf(full_path, full_path_len, "%s/%s", path, name);
                    }

                    printf("processing %s...\n", full_path);

                    file = fopen(full_path, "r");

                    if(!file) {
                        fprintf(stderr, "no such file\n");
                        return -1;
                    }

                    fseek(file, 0, SEEK_END);
                    size_t size = ftell(file);
                    rewind(file);

                    if(size == 0) {
                        printf("file %s is empty, skipping...\n", full_path);
                        fclose(file);
                        continue;
                    }

                    char *buffer = malloc(size + 1);
                    fread(buffer, sizeof(char), size, file);
                    buffer[size] = '\0';
                    fclose(file);

                    new_file = create_buffer_and_replace(buffer,
                                                         size,
                                                         pattern,
                                                         m,
                                                         replacement,
                                                         n,
                                                         pi,
                                                         &new_buffer_size);
                    if(new_file == NULL) {
                        fprintf(stderr, "pattern not found\n");
                    }
                    else {
                        size_t tmp_path_size;
                        char *tmp_path;
                        FILE *tmp_file;

                        if(path[strlen(path) - 1] == '/') {
                            tmp_path_size = strlen(path) + strlen(name)
                                                + strlen(".tmp") + 1;
                            tmp_path = malloc(tmp_path_size);
                            snprintf(tmp_path, tmp_path_size, "%s%s.tmp", path, name);
                        }
                        else {
                            tmp_path_size = strlen(path) + strlen(name)
                                                + strlen(".tmp") + 2;
                            tmp_path = malloc(tmp_path_size);
                            snprintf(tmp_path, tmp_path_size, "%s/%s.tmp", path, name);
                        }

                        tmp_path[tmp_path_size - 1] = '\0';

                        tmp_file = fopen(tmp_path, "w");
                        
                        if(tmp_file == NULL) {
                            fprintf(stderr, "could not open %s\n", tmp_path);
                            return -1;
                        }
                        else
                            printf("opening %s\n", tmp_path);

                        fwrite(new_file, sizeof(char), new_buffer_size, tmp_file);

                        if(new_file[new_buffer_size - 1] != '\n')
                            fputc('\n', tmp_file);

                        fclose(tmp_file);

                        rename(tmp_path, full_path);

                        free(tmp_path);
                    }

                    free(buffer);
                    free(name);
                }
            }
        }
        closedir(dir);
    }
    else {
        printf("usage: ./update_refs.c [PATH] [PATTERN] [REPLACEMENT]\n");
    }

    printf("time elapsed in seconds: %.15f\n", (double)clock() / CLOCKS_PER_SEC);

    return 0;
}
