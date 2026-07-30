# 🚀 My Study Project

나의 첫 번째 Docker 개발 환경 구축 및 GitHub 연동 프로젝트입니다.

## 💻 나의 개발 환경 정보
- **OS**: macOS 15.7.7
- **Shell**: zsh
- **Git**: 2.54.0
- **Docker**: 28.5.2

## 🛠️ 실행 방법 (Docker)
이 프로젝트는 Docker를 통해 파이썬 스크립트를 실행합니다.

```bash
# 1. 도커 이미지 빌드 (터미널에서 실행)
docker build -t my-python-app .

# 2. 도커 컨테이너 실행
docker run my-python-app

📝 주요 학습 내용
터미널 기본 명령어 숙달 (ls, mkdir, touch, cp, mv, rm)
파일 권한 변경 실습 (chmod 777)
Git 3단 콤보 (add, commit, push) 마스터
Dockerfile 작성 및 실행 완료


# 🚀 Docker 웹 서버 구축 및 운영 검증

## 1. Docker 설치 및 기본 점검
### 1.1 Docker 버전 확인
```bash
$ docker --version
Docker version 28.5.2, build ecc6942

$ docker info
Client:
 Version:    28.5.2
 Context:    orbstack
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.29.1
    Path:     /Users/danny0409183979/.docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v2.40.3
    Path:     /Users/danny0409183979/.docker/cli-plugins/docker-compose

Server:
 Containers: 3
  Running: 1
  Paused: 0
  Stopped: 2
 Images: 3
 Server Version: 28.5.2
 Storage Driver: overlay2
  Backing Filesystem: btrfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc version: d842d7719497cc3b774fd71620278ac9e17710e0
 init version: de40ad0
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.17.8-orbstack-00308-g8f9c941121b1
 Operating System: OrbStack
 OSType: linux
 Architecture: x86_64
 CPUs: 6
 Total Memory: 15.67GiB
 Name: orbstack
 ID: 7df6e30e-6c91-4371-b208-85cc55c8dd6a
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  ::1/128
  127.0.0.0/8
 Live Restore Enabled: false
 Product License: Community Engine
 Default Address Pools:
   Base: 192.168.97.0/24, Size: 24
   Base: 192.168.107.0/24, Size: 24
   Base: 192.168.117.0/24, Size: 24
   Base: 192.168.147.0/24, Size: 24
   Base: 192.168.148.0/24, Size: 24
   Base: 192.168.155.0/24, Size: 24
   Base: 192.168.156.0/24, Size: 24
   Base: 192.168.158.0/24, Size: 24
   Base: 192.168.163.0/24, Size: 24
   Base: 192.168.164.0/24, Size: 24
   Base: 192.168.165.0/24, Size: 24
   Base: 192.168.166.0/24, Size: 24
   Base: 192.168.167.0/24, Size: 24
   Base: 192.168.171.0/24, Size: 24
   Base: 192.168.172.0/24, Size: 24
   Base: 192.168.181.0/24, Size: 24
   Base: 192.168.183.0/24, Size: 24
   Base: 192.168.186.0/24, Size: 24
   Base: 192.168.207.0/24, Size: 24
   Base: 192.168.214.0/24, Size: 24
   Base: 192.168.215.0/24, Size: 24
   Base: 192.168.216.0/24, Size: 24
   Base: 192.168.223.0/24, Size: 24
   Base: 192.168.227.0/24, Size: 24
   Base: 192.168.228.0/24, Size: 24
   Base: 192.168.229.0/24, Size: 24
   Base: 192.168.237.0/24, Size: 24
   Base: 192.168.239.0/24, Size: 24
   Base: 192.168.242.0/24, Size: 24
   Base: 192.168.247.0/24, Size: 24
   Base: fd07:b51a:cc66:d000::/56, Size: 64

WARNING: DOCKER_INSECURE_NO_IPTABLES_RAW is set

$ docker build -t my-web-server .

$ docker run -d -p 8080:80 --name web-container my-web-server

$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED             SIZE
my-web-server   latest    a992072a2e9e   31 minutes ago      161MB
my-python-app   latest    7be1bf2b97d1   About an hour ago   122MB
hello-world     latest    e2ac70e7319a   4 months ago        10.1kB

$ docker ps
CONTAINER ID   IMAGE           COMMAND                   CREATED          STATUS          PORTS                                     NAMES
ee95ae80e45c   my-web-server   "/docker-entrypoint.…"   32 minutes ago   Up 32 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   web-container

$ docker logs web-container
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/07/29 20:47:40 [notice] 1#1: using the "epoll" event method
2026/07/29 20:47:40 [notice] 1#1: nginx/1.31.3
2026/07/29 20:47:40 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
2026/07/29 20:47:40 [notice] 1#1: OS: Linux 6.17.8-orbstack-00308-g8f9c941121b1
2026/07/29 20:47:40 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 20480:1048576
2026/07/29 20:47:40 [notice] 1#1: start worker processes
2026/07/29 20:47:40 [notice] 1#1: start worker process 29
2026/07/29 20:47:40 [notice] 1#1: start worker process 30
2026/07/29 20:47:40 [notice] 1#1: start worker process 31
2026/07/29 20:47:40 [notice] 1#1: start worker process 32
2026/07/29 20:47:40 [notice] 1#1: start worker process 33
2026/07/29 20:47:40 [notice] 1#1: start worker process 34
192.168.215.1 - - [29/Jul/2026:20:48:15 +0000] "GET / HTTP/1.1" 200 38 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36" "-"
192.168.215.1 - - [29/Jul/2026:20:48:15 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost:8080/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36" "-"
2026/07/29 20:48:15 [error] 29#29: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 192.168.215.1, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "localhost:8080", referrer: "http://localhost:8080/"
192.168.215.1 - - [29/Jul/2026:20:52:51 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36" "-" 

$ docker stats web-container
CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O          BLOCK I/O         PIDS 
ee95ae80e45c   web-container   0.00%     6.078MiB / 15.67GiB   0.04%     4.63kB / 2.5kB   20.2MB / 8.19kB   7 

```
<img width="1282" height="610" alt="사이트 생성 캡처본(4번)" src="https://github.com/user-attachments/assets/60696f9c-e364-432c-86df-aa7b46e615c7" />



<img width="1282" height="898" alt="사이트 생성 캡처본2(4번)" src="https://github.com/user-attachments/assets/79fb269b-1c4b-42eb-b4d4-7ba8bd5d8a3b" />



### 📌 [실습 6] 컨테이너 종료 및 유지 방식의 차이점 분석

| 구분 | 사용 명령어 / 단축키 | 동작 방식 및 특징 | 컨테이너 최종 상태 |
| :---: | :--- | :--- | :---: |
| **컨테이너 종료** | `exit` 입력 | `run -it`로 접속한 상태에서 메인 프로세스(bash)를 종료하며 빠져나옴. | **Exited** (중지됨) |
| **컨테이너 유지<br>(Detach)** | `Ctrl + P`, `Ctrl + Q` 연속 입력 | 메인 프로세스를 종료하지 않고, 백그라운드에서 실행되도록 둔 채 터미널만 빠져나옴. | **Up** (실행 중) |
| **추가 접속 후 종료<br>(Exec)** | `docker exec -it <이름> bash` 접속 후 `exit` | 이미 실행 중인 컨테이너에 새로운 터미널을 열어 접속함. 이후 `exit`를 해도 원래 컨테이너는 꺼지지 않음. | **Up** (유지됨) |

> **핵심 요약:** 도커 컨테이너의 생존 여부는 최초 실행 시점의 **'메인 프로세스(PID 1)'가 종료되었는지**에 따라 결정됩니다. `exec`로 추가 접속한 터미널을 종료해도 메인 프로세스에는 영향을 주지 않습니다.
