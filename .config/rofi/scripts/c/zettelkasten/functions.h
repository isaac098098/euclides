#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <dirent.h>

#define EXT     ".tex"
#define EXT_LEN 4

/* refs patterns */

const char *tex_1 = "\\hyperref[card:";
const size_t tex_1_len = 15;
const char *tex_2 = "]{\\textsf{";
const size_t tex_2_len = 10;
const char *tex_3 = "}}";
const size_t tex_3_len = 2;
const size_t tex_code_len = tex_1_len
                           + tex_2_len
                           + tex_3_len;

/* main file patterns */

const char *bdocument = "\\begin{document}\n\n";
const size_t bdocument_len = 18;
const char *toc = "\\tableofcontents\\label{toc}\n\n";
const size_t toc_len = 29;
const char *edocument = "\n\\end{document}";
const size_t edocument_len = 15;
const char *include_1 = "\\input{cards/";
const size_t include_1_len = 13;
const char *include_2 = "}\n";
const size_t include_2_len = 2;

/* zheader pattern */

const char *zheader = "\\zheader";
const size_t zheader_len = 8;

/* tree structure */

struct node {
    char *label;
    struct node *parent;
    size_t child_num;
    size_t child_cty;
    struct node **children;
};

/* string comparison and parsing functions */

int alpha_cmp(const char *a, const char *b) {
    size_t len_a = strlen(a);
    size_t len_b = strlen(b);

    if(len_a != len_b)
        return (int)(len_a - len_b);

    for(size_t i = 0; i < len_a; i++)
        if(a[i] != b[i])
            return (int)(a[i] - b[i]);

    return 0;
}

int parse_node_label(const char *label) {
    if(label == NULL)
        return -1;
    if(!isdigit(label[0])) {
        fprintf(stderr, "invalid label %s\n", label);
        fprintf(stderr, "card label must start with a digit\n");
        return -1;
    }
    for(size_t i = 0; i < strlen(label); i++) {
        if(((!isdigit(label[i]) && !isalpha(label[i]))) || isupper(label[i])) {
            printf("invalid character %c in label %s\n", label[i], label);
            fprintf(stderr, "card label must containt characters a-z and 0-9 only\n");
            return -1;
        }
    }

    return 0;
}

char* sanitize_dir_path(const char* dir_path) {
    if(dir_path == NULL)
        return NULL;

    char *sanitized;

    if(dir_path[strlen(dir_path) - 1] != '/') {
        size_t dir_path_len = strlen(dir_path) + 2;

        sanitized = malloc(dir_path_len);
        snprintf(sanitized, dir_path_len, "%s/", dir_path);

        return sanitized;
    }

    return strdup(dir_path);
}

char* construct_file_path(const char* dir_path,
                                const char *file)
{
    if(dir_path == NULL || file == NULL)
        return NULL;

    size_t dir_path_len = strlen(dir_path);
    size_t file_len = strlen(file);
    size_t file_path_len = dir_path_len + file_len + 1;

    char *file_path = malloc(file_path_len);
    snprintf(file_path, file_path_len, "%s%s", dir_path, file);

    return file_path;
}

char* construct_hyperref_pattern(const char *card) {
    if(card == NULL)
        return NULL;

    size_t pattern_len = 2 * strlen(card) + tex_code_len + 1;
    char *pattern = malloc(pattern_len);

    if(pattern == NULL) {
        fprintf(stderr, "out of memory!\n");
        return NULL;
    }

    snprintf(pattern, pattern_len, "%s%s%s%s%s",
                                   tex_1,
                                   card,
                                   tex_2,
                                   card,
                                   tex_3);
    
    return pattern;
}

/* file search and replace functions */

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

ssize_t get_first_coincidence(char *buffer,
                             size_t buffer_size,
                             const char *pattern,
                             size_t pattern_len)
{
    if(buffer == NULL || pattern == NULL)
        return -1;

    /* knuth-morris-pratt */

    size_t q = 0;
    const int *pi = compute_prefix_function(pattern, pattern_len);

    for(size_t i = 0; i < buffer_size; i++) {
        while(q > 0 && pattern[q] != buffer[i])
            q  = pi[q - 1];
        if(pattern[q] == buffer[i])
            q++;
        if(q == pattern_len) {
            printf("pattern found with shift %ld\n", i + 1 - pattern_len);
            return (ssize_t)(i + 1 - pattern_len);
        }
    }

    return -1;
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

int replace_pattern_in_dir(const char *cards_dir,
                           char* pattern,
                           size_t pattern_len,
                           char *replacement,
                           size_t replacement_len)
{
    if(cards_dir == NULL || pattern == NULL || replacement == NULL)
        return -1;

    size_t dir_path_len = strlen(cards_dir);
    DIR *dir;
    struct dirent *dp;

    dir = opendir(cards_dir);
    if(!dir) {
        fprintf(stderr, "no such directory \"%s\"\n", cards_dir);
        return -1;
    }

    const int *pi = compute_prefix_function(pattern, pattern_len);

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

                /* replace coindicences */

                replace(file_path,
                           pattern,
                           pattern_len,
                           pi,
                           replacement,
                           replacement_len);

                free(file_path);
            }
        }

        free(name);
    }

    return 0;
}

int write_index_entries(char *buffer,
                        size_t *write_pos,
                        struct node *parent)
{
    if(buffer == NULL || parent == NULL)
        return -1;

    if(parent->parent != NULL) {
        char *card = parent->label;
        size_t card_len = strlen(card);

        size_t include_len = include_1_len
                             + card_len
                             + EXT_LEN
                             + include_2_len
                             + 1;

        char *include = malloc(include_len);

        snprintf(include, include_len, "%s%s%s%s",
                include_1,
                card,
                EXT,
                include_2);

        memcpy(buffer + write_pos[0], include, include_len - 1);
        *write_pos += strlen(include);
    }
    
    for(size_t i = 0; i < parent->child_num; i++)
        write_index_entries(buffer, write_pos, parent->children[i]);

    return 0;
}


/* tree structure and functions */

int print_node_info(const struct node *n) {
    if(n == NULL) return -1;

    printf("label: %s\n", n->label);

    if(n->parent == NULL)
        printf("parent: NULL\n");
    else
        printf("parent: %s\n", n->parent->label);

    printf("child_num: %zu\n", n->child_num);
    printf("child_cty: %zu\n", n->child_cty);

    if(n->child_num > 0) {
        printf("children: \n");
        for(size_t i = 0; i < n->child_num; i++) {
            printf("    %s\n", n->children[i]->label);
        }
    }

    printf("\n");

    return 1;
}

struct node* find_node(struct node *parent, const char *name) {
    for(size_t i = 0; i < parent->child_num; i++) {
        struct node* child = parent->children[i];
        char* label = child->label;

        if(strcmp(label, name) == 0)
            return child;

        struct node *found = find_node(child, name);
        if(found != NULL)
            return found;
    }

    return NULL;
}

const char* prev_card(const char *label) {
    if(parse_node_label(label) < 0)
        return NULL;

    size_t label_len = strlen(label);
    char* result;
    
    if(isdigit(label[label_len - 1])) {
        size_t i = label_len - 1;
        while(i >= 0 && isdigit(label[i])) i--;
        
        char *prefix = strndup(label, i + 1);
        char *suffix = strdup(label + i + 1);
        // printf("prefix: %s\n", prefix);
        // printf("suffix: %s\n", suffix);

        long prev = strtol(suffix, NULL, 10) - 1;

        if(prev < 1) {
            fprintf(stderr, "1 is the minimum element for the number hierarchys\n");
            return NULL;
        }

        size_t suffix_len = snprintf(NULL, 0, "%ld", prev);
        size_t result_len = strlen(prefix) + suffix_len + 1;
        result = malloc(result_len);
        snprintf(result, result_len, "%s%ld", prefix, prev);

        free(prefix);
    }
    else {
        size_t i = label_len - 1;
        while(i >= 0 && isalpha(label[i])) i--;
        
        char *prefix = strndup(label, i + 1);
        char *suffix = strdup(label + i + 1);
        // printf("prefix: %s\n", prefix);
        // printf("suffix: %s\n", suffix);

        if(strcmp(suffix, "a") == 0) {
            fprintf(stderr, "a is the minimum element for the character hierarchys\n");
            return NULL;
        }

        long suffix_len = strlen(suffix);
        char* prev = malloc(suffix_len + 1);

        strcpy(prev, suffix);

        int borrow = 1;
        for(long i = suffix_len - 1; i >= 0 && borrow; i--) {
            if(prev[i] == 'a') {
                prev[i] = 'z';
            }
            else {
                prev[i]--;
                borrow = 0;
            }
        }

        if(borrow)
            memmove(prev, prev + 1, suffix_len);

        size_t result_len = strlen(prefix) + strlen(prev) + 1;
        result = malloc(result_len);
        snprintf(result, result_len, "%s%s", prefix, prev);

        free(prefix);
    }

    return result;
}

char* next_card(const char *label) {
    if(parse_node_label(label) < 0)
        return NULL;

    size_t label_len = strlen(label);
    char* result;
    
    if(isdigit(label[label_len - 1])) {
        size_t i = label_len - 1;
        while(i >= 0 && isdigit(label[i])) i--;
        
        char *prefix = strndup(label, i + 1);
        char *suffix = strdup(label + i + 1);
        // printf("prefix: %s\n", prefix);
        // printf("suffix: %s\n", suffix);

        long prev = strtol(suffix, NULL, 10) + 1;

        size_t suffix_len = snprintf(NULL, 0, "%ld", prev);
        size_t result_len = strlen(prefix) + suffix_len + 1;
        result = malloc(result_len);
        snprintf(result, result_len, "%s%ld", prefix, prev);

        free(prefix);
    }
    else {
        size_t i = label_len - 1;
        while(i >= 0 && isalpha(label[i])) i--;
        
        char *prefix = strndup(label, i + 1);
        char *suffix = strdup(label + i + 1);
        // printf("prefix: %s\n", prefix);
        // printf("suffix: %s\n", suffix);

        long suffix_len = strlen(suffix);
        char* prev = malloc(suffix_len + 2);

        strcpy(prev, suffix);

        int carry = 1;
        for(long i = suffix_len - 1; i >= 0 && carry; i--) {
            if(prev[i] == 'z') {
                prev[i] = 'a';
            }
            else {
                prev[i]++;
                carry = 0;
            }
        }

        if(carry) {
            memmove(prev + 1, prev, suffix_len + 1);
            prev[0] = 'a';
        }

        size_t result_len = strlen(prefix) + strlen(prev) + 1;
        result = malloc(result_len);
        snprintf(result, result_len, "%s%s", prefix, prev);

        free(prefix);
    }

    return result;
}

const char* get_card_suffix(struct node *n) {
    if(n == NULL || n->label == NULL)
        return NULL;

    const char *label = n->label;

    if(parse_node_label(label) < 0)
        return NULL;

    int len = strlen(label);
    int i = len - 1;

    while(i >= 0 && isdigit(label[i])) i--;

    if(i == len - 1)
        while(i >= 0 && isalpha(label[i])) i--;

    return label + i + 1;
}

int rename_subtree(struct node *parent,
                   char *new_label,
                   const char *cards_dir)
{
    if (parent == NULL || new_label == NULL)
        return -1;

    char *old_label = parent->label;

    printf("renaming %s->%s\n", old_label, new_label);

    char *pattern = construct_hyperref_pattern(old_label);
    size_t pattern_len = strlen(pattern);
    char *replacement = construct_hyperref_pattern(new_label);
    size_t replacement_len = strlen(replacement);

    replace_pattern_in_dir(cards_dir,
                           pattern,
                           pattern_len,
                           replacement,
                           replacement_len);

    for(size_t i = 0; i < parent->child_num; i++) {
        struct node *child = parent->children[i];

        char *suffix = child->label + strlen(old_label);

        size_t len = strlen(new_label) + strlen(suffix) + 1;
        char *child_new_label = malloc(len);
        snprintf(child_new_label, len, "%s%s", new_label, suffix);

        rename_subtree(child, child_new_label, cards_dir);

        free(child_new_label);
    }

    free(old_label);

    return 0;
}

int card_names_size_and_num(struct node *parent,
                            size_t *cards_char_size,
                            size_t *cards_num)
{
    if(parent == NULL || cards_char_size == NULL || cards_num == NULL)
        return -1;

    for(size_t i = 0; i < parent->child_num; i++) {
        *cards_char_size += strlen(parent->children[i]->label);
        *cards_num = *cards_num + 1;
        card_names_size_and_num(parent->children[i], cards_char_size, cards_num);
    }

    return 0;
}

int print_subtree_as_list(struct node *n) {
    if(n == NULL)
        return -1;

    printf("%s\n", n->label);
    for(int i=0; i < n->child_num; i++)
        print_subtree_as_list(n->children[i]);
    
    return 0;
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
    const int *pi = compute_prefix_function(zheader, zheader_len);

    while((c = fgetc(file)) != EOF) {
        while(q > 0 && zheader[q] != c)
            q  = pi[q - 1];
        if(zheader[q] == c)
            q++;
        if(q == zheader_len) {

            /* get title */

            size_t pos = 0;
            size_t brackets = 0;

            if((c = fgetc(file)) == '{') {
                brackets = 1;

                while((c = fgetc(file)) != EOF) {
                    if(brackets == 0)
                        break;
                    if(c == '{')
                        brackets += 1;
                    if(c == '}')
                        brackets -= 1;
                    pos++;
                }
            }
            else {
                fprintf(stderr, "no title argument found\n");
                fclose(file);
                return -1;
            }

            if(brackets != 0) {
                fprintf(stderr, "inconsistent square brackets\n");
                fclose(file);
                return -1;
            }

            if(pos > 0) {
                fseek(file, - (pos + 1), SEEK_CUR);
                *title = malloc(pos + 1);
                fgets(*title, pos, file);
            }

            /* get tags */

            brackets = 0;
            pos = 0;

            fgetc(file);

            if((c = fgetc(file)) == '{') {
                brackets = 1;

                while((c = fgetc(file)) != EOF) {
                    if(brackets == 0)
                        break;
                    if(c == '{')
                        brackets += 1;
                    if(c == '}')
                        brackets -= 1;
                    pos++;
                }
            }
            else {
                fprintf(stderr, "no title argument found\n");
                fclose(file);
                return -1;
            }

            if(brackets != 0) {
                fprintf(stderr, "inconsistent brackets\n");
                fclose(file);
                return -1;
            }

            if(pos > 0) {
                fseek(file, - (pos + 1), SEEK_CUR);
                *tags = malloc(pos + 1);
                fgets(*tags, pos, file);

                fclose(file);

                return 0;
            }
        }
    }

    fclose(file);

    return -1;
}

int get_zheader_alt(const char *file_path,
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
    const int *pi = compute_prefix_function(zheader, zheader_len);

    while((c = fgetc(file)) != EOF) {
        while(q > 0 && zheader[q] != c)
            q  = pi[q - 1];
        if(zheader[q] == c)
            q++;
        if(q == zheader_len) {

            /* get alternative title */

            size_t pos = 0;
            size_t sq_brackets = 0;

            if((c = fgetc(file)) == '[') {
                sq_brackets = 1;

                while((c = fgetc(file)) != EOF) {
                    if(sq_brackets == 0)
                        break;
                    if(c == '[')
                        sq_brackets += 1;
                    if(c == ']')
                        sq_brackets -= 1;
                    pos++;
                }
            }
            else {
                fprintf(stderr, "no alt title argument found\n");
                fclose(file);
                return -1;
            }

            if(sq_brackets != 0) {
                fprintf(stderr, "inconsistent square brackets\n");
                fclose(file);
                return -1;
            }

            if(pos > 0) {
                fseek(file, - (pos + 1), SEEK_CUR);
                *title = malloc(pos + 1);
                fgets(*title, pos, file);
            }

            /* skip document title */

            size_t brackets = 0;
            pos = 0;

            fgetc(file);

            if((c = fgetc(file)) == '{') {
                brackets = 1;

                while((c = fgetc(file)) != EOF) {
                    if(brackets == 0)
                        break;
                    if(c == '{')
                        brackets += 1;
                    if(c == '}')
                        brackets -= 1;
                    pos++;
                }
            }
            else {
                fprintf(stderr, "no title argument found\n");
                fclose(file);
                return -1;
            }

            if(brackets != 0) {
                fprintf(stderr, "inconsistent brackets\n");
                fclose(file);
                return -1;
            }

            if(pos > 0)
                fseek(file, -1, SEEK_CUR);
            else{
                fclose(file);
                return -1;
            }

            /* get tags */

            brackets = 0;
            pos = 0;

            if((c = fgetc(file)) == '{') {
                brackets = 1;

                while((c = fgetc(file)) != EOF) {
                    if(brackets == 0)
                        break;
                    if(c == '{')
                        brackets += 1;
                    if(c == '}')
                        brackets -= 1;
                    pos++;
                }
            }
            else {
                fprintf(stderr, "no tags argument found\n");
                fclose(file);
                return -1;
            }

            if(brackets != 0) {
                fprintf(stderr, "inconsistent brackets\n");
                fclose(file);
                return -1;
            }

            if(pos > 0) {
                fseek(file, - (pos + 1), SEEK_CUR);
                *tags = malloc(pos + 1);
                fgets(*tags, pos, file);

                fclose(file);

                return 0;
            }
        }
    }

    fclose(file);

    return -1;
}

int print_cards_and_meta(struct node *parent,
                         const char *cards_dir)
{
    if(parent == NULL || cards_dir == NULL)
        return -1;

    char *card = strdup(parent->label);

    if(strcmp(card, "root") != 0) {

        /* construct card path */

        size_t card_len = strlen(card);
        char *dir = sanitize_dir_path(cards_dir);
        size_t dir_len = strlen(dir);

        size_t file_path_len = dir_len + card_len + EXT_LEN + 1;
        char *file_path = malloc(file_path_len);
        snprintf(file_path, file_path_len, "%s%s.tex", dir, card);

        char *title = NULL;
        char *tags = NULL;

        if(get_zheader(file_path, &title, &tags) < 0) {
            get_zheader_alt(file_path, &title, &tags);
        }

        if(title == NULL) {
            if(tags == NULL)
                printf("%s\n", card);
            else
                printf("%s | %s\n", card, tags);
        }
        else {
            if(tags == NULL)
                printf("%s\t%s\n", card, title);
            else
                printf("%s\t%s | %s\n", card, title, tags);
        }
    }

    for(size_t i = 0; i < parent->child_num; i++)
        print_cards_and_meta(parent->children[i], cards_dir);

    return 0;
}

void print_subtree_pretty(struct node *n, const char *prefix, int is_last) {
    char new_prefix[1024];

    printf("%s", prefix);

    if (is_last >= 0)
        printf("%s── ", is_last ? "└" : "├");

    printf("%s\n", n->label);

    if (is_last >= 0)
        snprintf(new_prefix, sizeof(new_prefix), "%s%s", prefix, is_last ? "    " : "│   ");
    else
        snprintf(new_prefix, sizeof(new_prefix), "%s", prefix);

    for (int i = 0; i < n->child_num; i++)
        print_subtree_pretty(n->children[i], new_prefix, i == n->child_num - 1);
}

struct node* insert_child_in_order(struct node *parent, const char *suffix) {
    if(parent == NULL || suffix == NULL) return NULL;

    if(strcmp(parent->label, "root") == 0) {
        size_t low = 0;

        if(parent->child_num > 0 ) {
            int l = 0, h = (int)parent->child_num - 1, piv;
            long key = strtol(suffix, NULL, 10);
            long piv_val;
            while(l <= h) {
                piv = (l + h) / 2;
                const char *piv_suf = get_card_suffix(parent->children[piv]);
                piv_val = strtol(piv_suf, NULL, 10);
                if(key < piv_val) h = piv - 1;
                else l = piv + 1;
            }
            low = (size_t)l;
        } 
        else low = 0;

        if (parent->child_num == parent->child_cty) {
            size_t n_cty = parent->child_cty * 2;
            parent->children = realloc(parent->children, n_cty * sizeof(struct node*));
            parent->child_cty = n_cty;
        }

        memmove(parent->children + low + 1, parent->children + low, (parent->child_num - low) * sizeof(struct node*));
        
        parent->children[low] = malloc(sizeof(struct node));
        parent->children[low]->label = strdup(suffix);
        parent->children[low]->parent = parent;
        parent->children[low]->child_num = 0;
        parent->children[low]->child_cty = 1;
        parent->children[low]->children = malloc(sizeof(struct node*));
        parent->children[low]->children[0] = NULL;

        parent->child_num++;

        return parent->children[low];
    }
    else {
        if(parse_node_label(parent->label) < 0) return NULL;
        const char *parent_suffix = get_card_suffix(parent);
        if(parent_suffix == NULL) return NULL;

        if(isalpha(parent_suffix[0]) && isdigit(suffix[0])) {
            size_t low;

            int i = 0;
            while(suffix[i] != '\0') {
                if(!isdigit(suffix[i])) {
                    fprintf(stderr, "invalid suffix %s\n", suffix);
                    fprintf(stderr, "in this case, it must contain digits only\n");
                    return NULL;
                } i++;
            }

            if(parent->child_num > 0 ) {
                long key = strtol(suffix, NULL, 10);
                long piv_val;
                int l = 0, h = (int)parent->child_num - 1, piv;
                while(l <= h) {
                    piv = (l + h) / 2;
                    const char *piv_suf = get_card_suffix(parent->children[piv]);
                    piv_val = strtol(piv_suf, NULL, 10);
                    if(key < piv_val) h = piv - 1;
                    else l = piv + 1;
                }
                low = (size_t)l;
                }
            else low = 0;

            if (parent->child_num == parent->child_cty) {
                size_t n_cty = parent->child_cty * 2;
                parent->children = realloc(parent->children, n_cty * sizeof(struct node*));
                parent->child_cty = n_cty;
            }

            memmove(parent->children + low + 1, parent->children + low, (parent->child_num - low) * sizeof(struct node*));

            parent->children[low] = malloc(sizeof(struct node));
            size_t child_n = strlen(parent->label) + strlen(suffix) + 1;
            parent->children[low]->label = malloc(child_n);
            strcpy(parent->children[low]->label, parent->label);
            strcat(parent->children[low]->label, suffix);
            parent->children[low]->parent = parent;
            parent->children[low]->child_num = 0;
            parent->children[low]->child_cty = 1;
            parent->children[low]->children = malloc(sizeof(struct node*));
            parent->children[low]->children[0] = NULL;

            parent->child_num++;

            return parent->children[low];
        }
        else if(isdigit(parent_suffix[0]) && isalpha(suffix[0])) {
            int l = 0, h = (int)parent->child_num - 1, piv;
            size_t low;

            int i = 0;
            while(suffix[i] != '\0') {
                if(!isalpha(suffix[i]) || isupper(suffix[i])) {
                    fprintf(stderr, "invalid suffix %s\n", suffix);
                    fprintf(stderr, "in this case, it must contain non-uppercase alphabetic characters only\n"); return NULL;
                } i++;
            }

            if(parent->child_num > 0 ) {
                while(l <= h) {
                    piv = (l + h) / 2;
                    const char *piv_suf = get_card_suffix(parent->children[piv]);
                    if(alpha_cmp(suffix, piv_suf) < 0) h = piv - 1;
                    else l = piv + 1;
                }
                low = (size_t)l;
            }
            else low = 0;

            if (parent->child_num == parent->child_cty) {
                size_t n_cty = parent->child_cty * 2;
                parent->children = realloc(parent->children, n_cty * sizeof(struct node*));
                parent->child_cty = n_cty;
            }

            memmove(parent->children + low + 1, parent->children + low, (parent->child_num - low) * sizeof(struct node*));

            parent->children[low] = malloc(sizeof(struct node));
            size_t child_n = strlen(parent->label) + strlen(suffix) + 1;
            parent->children[low]->label = malloc(child_n);
            strcpy(parent->children[low]->label, parent->label);
            strcat(parent->children[low]->label, suffix);
            parent->children[low]->parent = parent;
            parent->children[low]->child_num = 0;
            parent->children[low]->child_cty = 1;
            parent->children[low]->children = malloc(sizeof(struct node*));
            parent->children[low]->children[0] = NULL;

            parent->child_num++;

            return parent->children[low];
        }
        else {
            fprintf(stderr, "inserting child %s%s to %s violates the card ordering\n",
                            parent->label, suffix, parent->label);
            return NULL;
        }
    }
}

int search_or_create_card_ancestors(struct node *n, const char *card) {
    if(parse_node_label(card) < 0) return -1;

    int found;
    size_t i=0, start;
    char *label = strdup("");
    struct node *prev = n;

    while(card[i] != '\0') {
        found = 0;
        start = i;

        // print_node_info(prev);

        while(isdigit(card[i])) i++;
        if(i > start) {
            char *hcy = strndup(card + start, i - start);
            label = realloc(label, strlen(label) + strlen(hcy) + 1);
            strcat(label, hcy);

            for(size_t j = 0; j < prev->child_num; j++) {
                if(strcmp(prev->children[j]->label, label) == 0) {
                    prev = prev->children[j];
                    found = 1;
                    break;
                }
            }
            
            /* insert children in order */

            if(found == 0) {
                struct node *tmp = insert_child_in_order(prev, hcy);
                prev = tmp;
            }

            free(hcy);
        }

        // print_node_info(prev);

        start = i;
        if(card[i] == '\0') break;
        found = 0;

        while(isalpha(card[i])) i++;
        if(i > start) {
            char *hcy = strndup(card + start, i - start);
            label = realloc(label, strlen(label) + strlen(hcy) + 1);
            strcat(label, hcy);

            for(size_t j = 0; j < prev->child_num; j++) {
                if(strcmp(prev->children[j]->label, label) == 0) {
                    prev = prev->children[j];
                    found = 1;
                    break;
                }
            }

            if(found == 0) {
                struct node *tmp = insert_child_in_order(prev, hcy);
                prev = tmp;
            }

            free(hcy);
        }

        if (i == start) {
            free(label);
            return -1;
        }
    }

    free(label);

    return 0;
}

int fill_tree(struct node *root, const char *path) {
    DIR *dir;
    struct dirent *dp;

    if(root == NULL || path == NULL)
        return -1;

    root->label = strdup("root");
    root->parent = NULL;
    root->child_num = 0;
    root->child_cty = 1;
    root->children = malloc(sizeof(struct node*));
    root->children[0] = NULL;

    dir = opendir(path);

    while((dp = readdir(dir)) != NULL) {
        char *name = strdup(dp->d_name);
        
        if(strcmp(name, ".") != 0 && strcmp(name, "..") != 0) {
            size_t len = strlen(name);

            if(len > 4 && strcmp(name + len - 4, EXT) == 0) {
                char *name_no_ext = strndup(name, len - 4);

                if(search_or_create_card_ancestors(root, name_no_ext) < 0) {
                    fprintf(stderr, "could no create tree of cards\n");
                    return -1;
                }

                free(name_no_ext);
            }
        }

        free(name);
    }

    closedir(dir);

    return 0;
}

/* main file manipulation */

int delete_card_from_main(const char *main_file,
                          const char *card_no_ext)
{
    if(main_file == NULL || card_no_ext == NULL)
        return -1;

    /* construct pattern */

    size_t card_no_ext_len = strlen(card_no_ext);

    size_t card_pattern_len = include_1_len
                            + card_no_ext_len
                            + EXT_LEN
                            + include_2_len
                            + 1;

    char *card_pattern = malloc(card_pattern_len);
    snprintf(card_pattern, card_pattern_len, "%s%s%s%s",
            include_1,
            card_no_ext,
            EXT,
            include_2);
    
    /* copy file to buffer */

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
        fprintf(stderr, "consider to regenerate index\n");
        return -1;
    }

    char *buffer = malloc(buffer_size);
    rewind(file);
    fread(buffer, sizeof(char), buffer_size, file);
    fclose(file);

    /* find card */

    ssize_t pos;

    if((pos = get_first_coincidence(buffer,
                    buffer_size,
                    card_pattern,
                    card_pattern_len - 1)) < 0)
    {
        fprintf(stderr, "card %s not found in main file\n", card_no_ext);
        fprintf(stderr, "consider to regenerate index\n");
        return -1;
    }

    size_t npos = (size_t)pos;

    size_t card_real = strlen(card_pattern);

    size_t new_buffer_size = buffer_size - card_real;
    char *new_buffer = malloc(new_buffer_size);

    /* construct new file */

    if(new_buffer != NULL) {
        memcpy(new_buffer, buffer, npos);
        memcpy(new_buffer + npos,
               buffer + npos + card_real,
               buffer_size - (card_real + npos));

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

        return 0;
    }
    else
        return -1;

    return -1;

}
