#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ncurses.h>

int main() {
    /* ncurses tui */

    initscr();
    noecho();
    curs_set(FALSE);

    unsigned rows = 0;
    unsigned cols = 0;
    getmaxyx(stdscr, rows, cols);

    char *opt_1 = "(a) Mathematics";
    char *opt_2 = "(b) Drawing";
    char *opt_3 = "(c) Programming";

    unsigned opt_3_len = strlen(opt_3);

    mvprintw(rows / 2 - 1, (cols - opt_3_len) / 2, opt_1);
    mvprintw(rows / 2 + 0, (cols - opt_3_len) / 2, opt_2);
    mvprintw(rows / 2 + 1, (cols - opt_3_len) / 2, opt_3);

    const char topic = (const char)getch();

    if(topic == 'q') {
        endwin();
        return 0;
    }

    const char *title = NULL;
    if(topic == 'a') title = "Mathematics";
    if(topic == 'b') title = "Drawing";
    if(topic == 'c') title = "Programming";
    size_t title_len = strlen(title);

    if(topic != 'a' && topic != 'b' && topic != 'c') {
        endwin();
        fprintf(stderr, "bad option!\n");
        return 0;
    }
 
    /* clock */
    
    unsigned hrs = 0;
    unsigned min = 0;
    unsigned sec = 0;
    char c;
    size_t timefmt_len = strlen("00:00:00") + 1;
    char timefmt[timefmt_len];
    time_t start = time(NULL);

    /* get date */

    size_t date_start_len = strlen("0000-00-00 00:00:00") + 1;
    char date_start[date_start_len];
    time_t now = time(NULL);
    struct tm *t = localtime(&now);
    
    if(t) {
        snprintf(date_start, date_start_len,"%04u-%02u-%02u %02u:%02u:%02u",
                 (unsigned)(t->tm_year + 1900) % 10000,
                 (unsigned)(t->tm_mon + 1) % 13,
                 (unsigned)t->tm_mday % 32,
                 (unsigned)t->tm_hour % 25,
                 (unsigned)t->tm_min % 60,
                 (unsigned)t->tm_sec % 60);
    }

    clear();
    nodelay(stdscr, TRUE);

    while((c = getch()) != 'q') {
        time_t now = time(NULL);
        unsigned time = (unsigned)(now - start);

        unsigned nhrs = time % 3600;
        hrs = (time / 3600) % 100;
        min = nhrs / 60;
        sec = nhrs % 60;

        if(hrs == 99) {
            fprintf(stderr, "99 hour limit reached!\n");
            break;
        }

        snprintf(timefmt, timefmt_len, "%02u:%02u:%02u", hrs, min, sec);

        mvprintw(rows / 2 - 1, (cols - title_len) / 2, title);
        mvprintw(rows / 2 + 1, (cols - timefmt_len) / 2, timefmt);
        refresh();

        timeout(1000);
    }
    
    clear();
    nodelay(stdscr, FALSE);

    size_t date_end_len = strlen("00:00:00") + 1;
    char date_end[date_end_len];
    now = time(NULL);
    t = localtime(&now);
    
    if(t) {
        snprintf(date_end, date_end_len,"%02u:%02u:%02u",
                 (unsigned)t->tm_hour % 25,
                 (unsigned)t->tm_min % 60,
                 (unsigned)t->tm_sec % 60);
    }

    const char *save = "Save record? (y/n)";
    size_t save_len = strlen(save);

    size_t record_len = strlen("\n\n") + (date_start_len - 1) +
                        strlen("-") + (date_end_len - 1) +
                        strlen(" ") + title_len + strlen(" ") +
                        (timefmt_len - 1) + strlen("\0");

    char record[record_len];
    snprintf(record, record_len, "%s-%s %s %s\n\n",
             date_start, date_end, title, timefmt);

    mvprintw(rows / 2 - 1, (cols - save_len) / 2, save);
    mvprintw(rows / 2 + 1, (cols - record_len) / 2, record);
    refresh();

    if((c = getch()) == 'y') {
        const char *home = getenv("HOME");
        const char *path = "/todo/registry.txt";
        size_t registry_file_len = strlen(home) + strlen("/todo/registry.txt") + 1;
        char registry_file[registry_file_len];
        snprintf(registry_file, registry_file_len, "%s%s", home, path);

        FILE *registry = fopen(registry_file, "a");

        if(!registry) {
            fprintf(stderr, "failed to open registry.txt!\n");
            return 0;
        }

        // - 1 null byte
        fwrite(record, sizeof(char), record_len - 1, registry);
        fclose(registry);

        endwin();
        return 0;
    }

    endwin();
    return 0;
}
