#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <dirent.h>
#include <stdbool.h>
#include <time.h>

#define EXT ".tex"

struct node {
    char *label;
    struct node *parent;
    size_t child_num;
    size_t child_cty;
    struct node **children;
};

void fill_root(struct node *n) {
    n->label = strdup("root");
    n->parent = NULL;
    n->child_num = 0;
    n->child_cty = 1;
    n->children = malloc(sizeof(struct node*));
    n->children[0] = NULL;
}

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

struct node* find_node(struct node *parent, char *name) {
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
            fprintf(stderr, "1 is the minimum element for the number hierarchy\n");
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
            fprintf(stderr, "a is the minimum element for the character hierarchy\n");
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

const char* next_card(const char *label) {
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

int rename_subtree(struct node *parent, const char *new_label) {
    if (parent == NULL || new_label == NULL)
        return -1;

    char *old_label = parent->label;

    parent->label = strdup(new_label);

    for(size_t i = 0; i < parent->child_num; i++) {
        struct node *child = parent->children[i];

        char *suffix = child->label + strlen(old_label);

        size_t len = strlen(new_label) + strlen(suffix) + 1;
        char *child_new_label = malloc(len);
        snprintf(child_new_label, len, "%s%s", new_label, suffix);

        rename_subtree(child, child_new_label);

        free(child_new_label);
    }

    free(old_label);

    return 0;
}

void print_subtree_as_list(struct node *n) {
    printf("%s\n", n->label);
    for(int i=0; i < n->child_num; i++)
        print_subtree_as_list(n->children[i]);
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

    bool found;
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

int main(int argc, char *argv[]) {
    DIR *dir;
    struct dirent *dp;
    struct node root;

    fill_root(&root);

    if(argc == 2) {
        dir = opendir(argv[1]);

        while((dp = readdir(dir)) != NULL) {
            if(strcmp(dp->d_name, ".") != 0 && strcmp(dp->d_name, "..") != 0) {
                size_t len = strlen(dp->d_name);
                if(len > 4 && strcmp(dp->d_name + len - 4, EXT) == 0) {
                    char *name = strndup(dp->d_name, len - 4);
                    if(name)
                        if(search_or_create_card_ancestors(&root, name) < 0)
                            return -1;
                    free(name);
                }
            }
        }

        closedir(dir);

        // print_subtree_pretty(&root, "", -1);
        // print_subtree_as_list(&root);

        // struct node *find = find_node(&root, "2a2");
        // print_subtree_pretty(find, "", -1);
        // rename_subtree(find, "2c2");
        // print_subtree_pretty(find, "", -1);

        char *test_card = "2za";
        printf("previous: %s\n", prev_card(test_card));
        printf("card: %s\n", test_card);
        printf("next: %s\n", next_card(test_card));
    }
    else {
        printf("usage: %s [directory]\n", argv[0]);
        return 0;
    }

    printf("time used: %.9f\n", (double)clock() / CLOCKS_PER_SEC);

    return 0;
}
