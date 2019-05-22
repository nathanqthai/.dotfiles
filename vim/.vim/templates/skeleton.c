// vim: set ts=4 sw=4 tw=4 sts=4 et :

// includes
#include <stdbool.h> // bool, true, false
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h> // exit(), EXIT_SUCCESS, EXIT_FAILURE
#include <getopt.h>

int parse_args(int argc, char* argv[]) {
    int status = EXIT_SUCCESS;

    int opt = 0;
    while((opt = getopt(argc, argv, "h")) != -1) {
        switch(opt) {
            case 'h':
                fprintf(stderr, "Usage: %s [-h]\n", argv[0]);
                status = EXIT_FAILURE;
                goto end;
            default:
                break;
        }
    }

end:
    return status;
}

int main(int argc, char* argv[], char *envp[]) {
    int status = EXIT_SUCCESS;

    // parse arguments
    parse_args(argc, argv);

    return status;
}
