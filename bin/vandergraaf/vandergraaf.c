#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void hor(double w2, double w1, double h1) {
    double g1, g2, psi, phi, j1, j2, k1, k2, h2, b;
    double d1, d3, m1, m2, m3, m4;
    g1 = hypot(w1, h1);
    g2 = hypot(2.0*w1, h1);
    psi = atan(h1/(2.0*w1));
    phi = atan(h1/w1);
    j1 = ((2.0*w1)/sin(M_PI - psi - phi)) * sin(psi);
    j2 = ((2.0*w1)/sin(M_PI - psi - phi)) * sin(phi);
    k2 = (w2/sin(M_PI - psi - phi)) * sin(phi);
    h2 = (k2/cos(phi)) * sin(psi + phi);
    b = hypot(w2, h2);
    k1 = (w2/sin(M_PI - psi - phi)) * sin(psi);
    d1 = g1 - j1 - k1;
    d3 = g1 - d1 - b;
    m1 = d1*cos(phi);
    m2 = d1*sin(phi);
    m3 = d3*cos(phi);
    m4 = d3*sin(phi);
    printf("%.1f %.1f %.1f %.1f\n", m1, m2, m3, m4);
}

void ver(double h2, double w1, double h1) {
    double g1, g2, psi, phi, j1, j2, k1, k2, w2, b;
    double d1, d3, m1, m2, m3, m4;
    g1 = hypot(w1, h1);
    g2 = hypot(2.0*w1, h1);
    psi = atan(h1/(2.0*w1));
    phi = atan(h1/w1);
    j1 = ((2.0*w1)/sin(M_PI - psi - phi)) * sin(psi);
    j2 = ((2.0*w1)/sin(M_PI - psi - phi)) * sin(phi);
    k2 = (h2/sin(M_PI - psi - phi)) * cos(phi);
    w2 = (k2/sin(phi)) * sin(M_PI - psi - phi);
    b = hypot(w2, h2);
    k1 = (w2/sin(M_PI - psi - phi)) * sin(psi);
    d1 = g1 - j1 - k1;
    d3 = g1 - d1 - b;
    m1 = d1*cos(phi);
    m2 = d1*sin(phi);
    m3 = d3*cos(phi);
    m4 = d3*sin(phi);
    printf("%.1f %.1f %.1f %.1f\n", m1, m2, m3, m4);
}

void van(double w, double h) {
    double m1, m2, m3, m4;
    m1 = w/9.0;
    m2 = h/9.0;
    m3 = 2.0*m1;
    m4 = 2.0*m2;
    printf("%.1f %.1f %.1f %.1f\n", m1, m2, m3, m4);
}

int main(int argc, char** argv) {
    if(argc == 1) {
        printf("Usage: ./vandergraaf -w [TEXT_WIDTH] -s [PAPER_WIDTH] [PAPER_HEIGHT]\n");
        printf("   or: ./vandergraaf -h [TEXT_HEIGHT] -s [PAPER_WIDTH] [PAPER_HEIGHT]\n");
        printf("   or: ./vandergraaf -n [WIDTH] [HEIGHT]\n");
        printf("\nPrints left, top, right and bottom margins for Van der Graaf canon given\n");
        printf("a papersize or given a fixed width or height.\n");
        return 0;
    }
    if(argc == 4) {
        if(strcmp(argv[1], "-n") == 0) {
            van(atof(argv[2]), atof(argv[3]));
            return 0;
        }
        else if(strcmp(argv[1], "-w")) {
            printf("one argument expected for %s\n", argv[1]);
            return 1;
        }
        else if(strcmp(argv[1], "-h")) {
            printf("one argument expected for %s\n", argv[1]);
            return 1;
        }
        else {
            printf("invalid option %s\n", argv[1]);
            return 1;
        }
    }
    else if(argc == 6) {
        if(strcmp(argv[1], "-w") == 0) {
            if(strcmp(argv[3], "-s") == 0) {
                hor(atof(argv[2]), atof(argv[4]), atof(argv[5]));
                return 0;
            }
            else {
                printf("invalid option %s\n", argv[3]);
                return 1;
            }
        }
        else if(strcmp(argv[1], "-h") == 0) {
            if(strcmp(argv[3], "-s") == 0) {
                ver(atof(argv[2]), atof(argv[4]), atof(argv[5]));
                return 0;
            }
            else {
                printf("invalid option %s\n", argv[3]);
                return 1;
            }
        }
        else {
            if(strcmp(argv[1], "-n") == 0)
                printf("bad usage for %s\n", argv[1]);
            else
                printf("invalid option %s\n", argv[1]);
            return 1;
        }
    }
    else {
        printf("bad usage\n");
        return 1;
    }
}
