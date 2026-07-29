# 터미널 조작 로그

## 1. 기본 명령어 실습 (파일/폴더 조작)
```bash
danny0409183979@c6r1s4 my-study % pwd
/Users/danny0409183979/my-study
danny0409183979@c6r1s4 my-study % touch test.txt
danny0409183979@c6r1s4 my-study % ls -la
total 16
drwxr-xr-x   6 danny0409183979  danny0409183979  192  7 30 04:11 .
drwx------+ 20 danny0409183979  danny0409183979  640  7 30 04:07 ..
drwxr-xr-x  13 danny0409183979  danny0409183979  416  7 30 03:57 .git
-rw-r--r--   1 danny0409183979  danny0409183979   52  7 30 03:55 hello.py
-rw-r--r--   1 danny0409183979  danny0409183979  122  7 30 03:08 README.md
-rw-r--r--   1 danny0409183979  danny0409183979    0  7 30 04:11 test.txt
danny0409183979@c6r1s4 my-study % mkdir backup_folder
danny0409183979@c6r1s4 my-study % cp test.txt backup_folder/
danny0409183979@c6r1s4 my-study % mv test.txt renamed.txt
danny0409183979@c6r1s4 my-study % rm renamed.txt
```
##2. 권한 변경 실습
danny0409183979@c6r1s4 my-study % touch secret.txt
danny0409183979@c6r1s4 my-study % ls -l secret.txt
-rw-r--r--  1 danny0409183979  danny0409183979  0  7 30 04:30 secret.txt
danny0409183979@c6r1s4 my-study % chmod 777 secret.txt
danny0409183979@c6r1s4 my-study % ls -l secret.txt
-rwxrwxrwx  1 danny0409183979  danny0409183979  0  7 30 04:30 secret.txt
