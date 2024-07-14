#include "kernel/types.h"

#include "kernel/fs.h"
#include "kernel/stat.h"
#include "user/user.h"

#define MAX_DEPTH 12


void traverse(char *path, char *basename, char key, int level, int *file_num,
              int *dir_num) {
    char buf[128], *p;
    int fd;
    struct dirent de;
    struct stat st;
    
    if ((fd = open(path, 0)) < 0) {
        printf("%s [error opening dir]\n", path);
        return;
    }
    if (fstat(fd, &st) < 0) {
        fprintf(2, "tree: cannot stat (new recursion) %s\n", path);
        return;
    } else {
        close(fd);
    }

    printf("%s", path);
    int len = strlen(path), count_key = 0;
    for(int i = 0; i < len; i++){
        if(path[i] == key) count_key++;
    }
    printf(" %d\n", count_key);

    if (st.type == T_FILE) {
        if (level == 0) {
            printf("%s [error opening dir]\n", path);
            return;
        }
        (*file_num)++;
        return;
    } else if (st.type == T_DIR) {
        if (level > 0) {
            (*dir_num)++;
        }
    } else {
        // printf("tree: path %s is a device\n", path);
        return;
    }

    if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
        printf("tree: path too long\n");
        close(fd);
        return;
    }
    strcpy(buf, path);
    p = buf + strlen(buf);
    *p++ = '/';

    int count = 0;
    if ((fd = open(path, 0)) < 0) {
        printf("%s [error opening dir]\n", path);
        return;
    }
    while (read(fd, &de, sizeof(de)) == sizeof(de)) {
        if (de.inum == 0)
            continue;
        memmove(p, de.name, DIRSIZ);
        p[DIRSIZ] = 0;
        if (strcmp(de.name, ".") && strcmp(de.name, "..")) {
            count++;
        }
    }
    close(fd);
    if ((fd = open(path, 0)) < 0) {
        fprintf(2, "tree: cannot open %s after counting files\n", path);
        return;
    }
    // read files under current path
    int cnt = 0;
    while (read(fd, &de, sizeof(de)) == sizeof(de)) {
        if (de.inum == 0)
            continue;

        memmove(p, de.name, DIRSIZ);
        p[DIRSIZ] = 0;
        if (strcmp(de.name, ".") && strcmp(de.name, "..")) {
            
            cnt++;
            traverse(buf, de.name, key, level + 1, file_num, dir_num);
        }
    }

    close(fd);
    return;
}

int main(int argc, char *argv[]) {
    // printf("stdout\n");
    // fprintf(2, "stderr\n");
    // int ret = 0;
    int pid, ret = 0;
    int fds[2];

    // Create pipes
    if (pipe(fds) < 0) {
        printf("tree: pipe failed\n");
        exit(-1);
    }

    // Create child process
    pid = fork();
    if (pid == 0) { // Child
        int file_num = 0, dir_num = 0;
        traverse(argv[1], argv[1], argv[2][0], 0, &file_num, &dir_num);

        write(fds[1], &file_num, sizeof(int));
        write(fds[1], &dir_num, sizeof(int));
        printf("\n");

        exit(0);
    } else if (pid > 0) { // Parent
        // wait for child to exit
        // wait(0);
        int file_num, dir_num;
        if (read(fds[0], &file_num, sizeof(int)) != sizeof(int)) {
            printf("tree: pipe read failed (file_num)\n");
        }
        if (read(fds[0], &dir_num, sizeof(int)) != sizeof(int)) {
            printf("tree: pipe read failed (dir_num)\n");
        }
        printf("%d directories, %d files\n", dir_num, file_num);
    } else {
        printf("tree: fork failed\n");
        ret = -1;
    }

    close(fds[0]);
    close(fds[1]);
    exit(ret);
}
