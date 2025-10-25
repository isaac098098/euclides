#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

const char *pattern = "\\zheader{";
const size_t pattern_len = 8;

const int* compute_prefix_function(const char* pattern,
                                   const size_t pattern_len)
{
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

int get_zheader(const char *file_path,
                char **title,
                char **tags)
{
    if(file_path == NULL)
        return -1;

    FILE *file = fopen(file_path, "r");

    if(!file) {
        fprintf(stderr, "could not open %s\n", file_path);
        return -1;
    }

    /* knuth-morris-pratt */

    char c;
    size_t q = 0;
    const int *pi = compute_prefix_function(pattern, pattern_len);

    while((c = fgetc(file)) != EOF) {
        while(q > 0 && pattern[q] != c)
            q  = pi[q - 1];
        if(pattern[q] == c)
            q++;
        if(q == pattern_len) {
            size_t found_pos = ftell(file) + 1 - pattern_len;
            // printf("pattern found with shift %ld\n", found_pos);

            /* get title */

            fgetc(file);

            size_t pos = 1;
            size_t brackets = 1;
            while((c = fgetc(file)) != EOF) {
                if(c == '{')
                    brackets += 1;
                if(c == '}')
                    brackets -= 1;
                if(brackets == 0)
                    break;
                pos++;
            }

            if(brackets != 0) {
                fprintf(stderr, "mismatching brackets at %ld\n", found_pos + pos);
                return -1;
            }

            if(pos > 0) {
                fseek(file, found_pos + pattern_len, 0);
                *title = malloc(pos + 1);
                fgets(*title, pos, file);
            }

            /* get tags */

            size_t title_end = pos;

            fseek(file, found_pos + pattern_len + pos, 0);

            if((c = fgetc(file)) == '{') {
                pos = 1;
                brackets = 1;
                while((c = fgetc(file)) != EOF) {
                    if(c == '{')
                        brackets += 1;
                    if(c == '}')
                        brackets -= 1;
                    if(brackets == 0)
                        break;
                    pos++;
                }

                if(brackets != 0) {
                    fprintf(stderr, "mismatching brackets at %ld\n", found_pos + pos);
                    return -1;
                }

                if(pos > 0) {
                    fseek(file, found_pos + pattern_len + title_end + 1, 0);
                    *tags = malloc(pos + 1);
                    fgets(*tags, pos, file);
                }
                else {
                    fprintf(stderr, "no tags argument found\n");
                    return -1;
                }
            }

            fclose(file);
        }
    }

    return 0;
}

/* int get_zheader_alt(const char *file_path,
                       char **title,
                       char **tags) */

int main(int argc, char **argv) {
    if(argc == 2) {
        const char *file_path = strdup(argv[1]);
        char *title;
        char *tags;

        if(get_zheader(file_path, &title, &tags) < 0) {
            fprintf(stderr, "could not get title or tags\n");
            return -1;
        }

        printf("%s\n", title);
        printf("%s\n", tags);

        free(title);
        free(tags);
    }
    else
        printf("usage: ./parse_meta [FILE]\n");

    printf("time used: %.6f\n", (double)clock() / CLOCKS_PER_SEC);

    return 0;
}
