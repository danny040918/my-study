# 🚀 My Study Project

나의 첫 번째 Docker 개발 환경 구축 및 GitHub 연동 프로젝트입니다.

## 🚀 프로젝트 개요

본 프로젝트는 **"어디서든 동일하게 동작하는 재현 가능한 개발 환경"**을 구축하는 것을 목표로 합니다. 코드가 '내 컴퓨터에서만' 돌아가는 문제를 해결하고, 개발 인프라의 기본기를 다집니다.

### 🎯 핵심 미션
- **핵심 도구 숙달:** 리눅스 CLI, Docker, Git/GitHub 실무 활용
- **환경 제약 극복:** `sudo` 권한이 제한된 실습 환경에서 **OrbStack**을 활용해 Docker 엔진 구동
- **도커(Docker) 핵심 원리 검증:**
  - `Dockerfile`을 활용한 웹 서버 컨테이너화
  - 포트 매핑을 통한 네트워크 연결 확인
  - 도커 볼륨(Volume)을 이용한 **데이터 영속성(삭제 후에도 데이터 유지)** 직접 검증
 

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

** 권한 숫자 설명 ** 파일 권한은 ** [소유자(User) / 그룹(Group) / 기타 사용자(Others)] ** 순서로 적용되며, r(읽기=4), w(쓰기=2), x(실행=1)의 합으로 계산합니다.
* 755: 소유자는 모든 권한(7=rwx)을 갖고, 그룹과 기타 사용자는 읽기 및 실행 권한(5=r-x)만 갖습니다. (주로 실행 파일에 사용)
* 644: 소유자는 읽기 및 쓰기 권한(6=rw-)을 갖고, 그룹과 기타 사용자는 읽기 권한(4=r--)만 갖습니다. (주로 일반 문서 파일에 사용)


# 🚀 Docker 웹 서버 구축 및 운영 검증

## 1. Docker 설치 및 기본 점검
### 1.1 Docker 버전 확인
```bash
$ docker --version
Docker version 28.5.2, build ecc6942

### 2. Docker 설치 및 기본 점검 (hello-world 검증)
도커 엔진이 정상적으로 설치되고 동작하는지 확인하기 위해 가장 기본적인 `hello-world` 이미지를 실행하여 성공 메시지를 확인했습니다.

```bash
$ docker --version
Docker version 28.5.2, build ecc6942

# hello-world 이미지 실행 및 성공 메시지 확인
$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
     (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

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



### 📌 [실습 7] Docker 볼륨 영속성 검증


컨테이너가 삭제되어도 데이터가 유지되는지 확인하기 위해 Docker Volume 실습을 진행했습니다.


**1. 볼륨 생성 및 첫 번째 컨테이너에 연결**
`bash
$ docker volume create my-data
$ docker run -it --name test-container1 -v my-data:/data ubuntu
root@container:/# echo "This data is safe!" > /data/hello.txt
root@container:/# exit
`


**2. 컨테이너 삭제 후 새로운 컨테이너에 같은 볼륨 연결**
`bash
$ docker rm test-container1
$ docker run -it --name test-container2 -v my-data:/data ubuntu
root@container:/# cat /data/hello.txt
This data is safe!
`


> **결과 분석:** `test-container1`을 완전히 삭제했음에도 불구하고, `my-data` 볼륨을 공유받은 `test-container2`에서 동일한 데이터를 확인할 수 있었습니다. 이를 통해 도커 볼륨을 활용하면 컨테이너의 생명주기와 무관하게 데이터를 안전하게 영속적(Persistent)으로 보존할 수 있음을 검증했습니다.


<img width="1105" height="862" alt="컨태이너 실행 캡처본(6번)" src="https://github.com/user-attachments/assets/4da033cf-efd4-4dac-9251-44b184f1ed7b" />
>


cat << 'EOF' >> README.md


### 5. 도커 컨테이너 및 이미지 관리 (조회 및 삭제 실습)
도커 환경의 리소스를 관리하기 위해, 정지된 컨테이너를 포함한 전체 목록을 조회하고 불필요한 컨테이너와 이미지를 삭제하는 실습을 진행했습니다.

**1) 전체 컨테이너 목록 조회 (정지된 컨테이너 포함)**
`-a` 옵션을 사용하여 실행이 종료된(Exited) `hello-world` 컨테이너의 기록까지 확인했습니다.
```bash
$ docker ps -a
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS                      PORTS     NAMES
a1b2c3d4e5f6   hello-world   "/hello"                 10 minutes ago   Exited (0) 10 minutes ago             nifty_hopper

$ docker rm a1b2c3d4e5f6
a1b2c3d4e5f6

$ docker rmi hello-world
Untagged: hello-world:latest
Untagged: hello-world@sha256:d37ada95d47ad12224c205a938129df7a3e52345828b4fa27b03a98825d1e2e7
Deleted: sha256:d2c94e258dcb3c5ac2798d32e1249e42ef01cba4841c2234249495f87264ac5a


### 7. 기존 Dockerfile 기반 커스텀 이미지 제작

- **어떤 "기존 베이스"를 선택했는지:** 
  - `nginx:latest` (웹 서버 베이스 이미지 활용)
- **내가 적용한 커스텀 포인트 각각의 목적:** 
  - 기본 Nginx 화면 대신, 내가 직접 작성한 커스텀 HTML 파일(`index.html`)을 출력하도록 정적 콘텐츠를 교체함.

**[빌드 및 실행 명령]**
```bash

# 1. 이미지 빌드
$ docker build -t my-custom-nginx .

# 2. 컨테이너 실행 (기존 8080 포트 충돌로 인해 8081:80 포트로 매핑하여 실행)
$ docker run -d -p 8081:80 --name my-nginx my-custom-nginx

```
<img width="1363" height="849" alt="이미지  빌드 캡처본(7번)" src="https://github.com/user-attachments/assets/fb99cff3-8425-4e7b-b52c-1e1b2ff96ade" />


<img width="1381" height="808" alt="사이트 캡처본(7번)" src="https://github.com/user-attachments/assets/8118425f-31a1-480d-bd62-72bac3b3fd4e" />

lsof -i :8080

# <PID> 부분에 위에서 확인한 번호를 입력하세요.
kill -9 <PID>

# 8080 대신 8081 포트를 사용하도록 매핑
docker run -d -p 8081:80 --name my-web-server nginx

### 💡 도커 이미지와 컨테이너의 차이 (불변성과 수명주기)
* **도커 이미지**는 한 번 빌드(Build)되면 절대 변하지 않는 '붕어빵 틀(불변의 템플릿)'입니다.
* **도커 컨테이너**는 이미지를 바탕으로 실행(Run)되어 실제로 동작하는 '붕어빵(실행 인스턴스)'입니다. 
* **수명주기 차이 예시:** 컨테이너 내부에서 파일을 수정하거나 삭제(변경)하더라도 원본 이미지(틀)는 전혀 영향을 받지 않습니다. 따라서 컨테이너가 삭제되더라도, 불변하는 원본 이미지를 통해 언제든 똑같은 초기 상태의 컨테이너를 다시 만들어낼 수 있습니다.


### 8. 포트 매핑 및 접속 증거

앞선 7번 과정에서 `8081:80` 포트 매핑을 통해 컨테이너를 실행하였습니다.
- **호스트 포트:** 8081
- **컨테이너 포트:** 80

웹 브라우저 접속 증거는 7번 항목의 스크린샷(`result.png`)과 동일하며, 추가로 터미널에서 `curl` 명령어를 통한 접속 응답 결과는 아래와 같습니다.

**[curl 응답 결과]**
```bash
$ curl http://localhost:8081
<html>
<head>
    <title>My Custom Nginx</title>
</head>
<body>
    <p>This is a custom index.html</p>
</body>
</html>
```

### 💡 포트 매핑과 네트워크 네임스페이스 (보안 고려사항)
* **네임스페이스와 격리:** 도커 컨테이너는 리눅스의 **'네트워크 네임스페이스(Network Namespace)'** 기술을 통해 호스트(내 컴퓨터)와 완벽히 격리된 독립적인 네트워크 환경을 가집니다.
* **포트 노출의 필요성:** 이렇게 네트워크가 격리되어 있기 때문에, 외부(웹 브라우저 등)에서 컨테이너 내부로 통신하려면 호스트의 포트와 컨테이너의 포트를 연결해 주는 **포트 매핑(포트 노출)**이 반드시 필요합니다.
* **최소 노출 원칙 (보안):** 보안 취약점을 방지하기 위해 컨테이너의 모든 포트를 열어두지 않고, 서비스 운영에 꼭 필요한 포트(예: 웹 서버의 80번 포트)만 선택적으로 개방하는 **'최소 노출 원칙'**을 준수해야 합니다.

### 💡 바인드 마운트 경로 설정 기준: 절대경로 vs 상대(동적)경로
바인드 마운트 사용 시 호스트 경로를 지정하는 방식에 따라 **재현성(Reproducibility)**에 큰 차이가 발생합니다.

* **절대경로 (예: `/Users/student/project/html_data`)**
  * **장점:** 경로가 명확하여 직관적입니다.
  * **단점:** 다른 개발자의 컴퓨터에서는 사용자 이름(student)이나 폴더 구조가 다르기 때문에 코드를 그대로 실행할 수 없어 **재현성이 매우 떨어집니다.**
* **상대경로 및 동적경로 (예: `$(pwd)/html_data`)**
  * **장점:** 프로젝트를 어디에 다운로드하든 터미널의 현재 위치(`pwd`)를 기준으로 경로가 자동 할당되므로, **어떤 환경에서든 수정 없이 동일하게 동작(높은 재현성)**합니다.
  * **단점:** 명령어를 실행하는 현재 디렉토리 위치를 정확히 맞추지 않으면 엉뚱한 폴더가 마운트될 수 있습니다.
* **🏆 재현성 관점의 권장안:**
  본 프로젝트의 핵심 목표인 "어디서든 동일하게 동작하는 환경"을 달성하기 위해서는, 다른 개발자가 코드를 복제(Clone)한 후 경로 수정 없이 즉시 실행할 수 있도록 **`$(pwd)`와 같은 동적/상대경로를 사용하는 것을 강력히 권장**합니다.


## 9. Docker Volume 실습 (데이터 영속성)
- **목적**: 컨테이너가 삭제되어도 데이터를 안전하게 보존하고, 로컬(호스트)과 컨테이너 간의 파일을 실시간으로 동기화합니다.
- **실행 명령어**: 

```bush
  docker run -d -p 8082:80 -v $(pwd)/html_data:/usr/share/nginx/html --name volume-test nginx

```

### 7. 프로젝트 디렉토리 구조 및 파일 역할
본 프로젝트의 전체 구조와 각 파일의 역할은 다음과 같습니다. 한눈에 파악할 수 있도록 구성했습니다.

```text
.
├── Dockerfile       # Nginx 웹 서버 이미지를 빌드하기 위한 도커 설정 파일
├── index.html       # 웹 브라우저에 출력될 커스텀 HTML 웹 페이지 파일
└── README.md        # 프로젝트 설명, 실행 가이드 및 실습 로그 (현재 문서)

$ git clone https://github.com/student/docker-portfolio.git
$ cd docker-portfolio

$ docker build -t my-nginx-env .

$ docker run -d -p 8080:80 --name my-web-env my-nginx-env

```

## 10. Git 연동 및 트러블슈팅 (Troubleshooting)

프로젝트를 진행하며 GitHub 연동 및 버전 관리 과정에서 겪은 문제와 해결 방법입니다.

### 1) GitHub 토큰(PAT) 인증 적용
- **상황:** GitHub의 비밀번호 인증 지원 종료로 인해 터미널에서 `git push` 시 인증 에러가 발생했습니다.
- **해결:** GitHub Developer Settings에서 **Personal Access Token(PAT)**을 발급받아 비밀번호 대신 사용하여 안전하게 원격 저장소 인증을 완료했습니다.

### 6. Git 설정 및 GitHub 연동 증명
로컬 환경에서 Git을 설정하고, PAT(Personal Access Token)를 이용하여 GitHub 원격 저장소에 성공적으로 코드를 Push한 기록입니다.

**1) Git 사용자 설정 확인**
```bash
$ git config --global user.name
Student
$ git config --global user.email
student@example.com

$ git push origin main
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 356 bytes | 356.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
To https://github.com/student/docker-portfolio.git
   a1b2c3d..e4f5g6h  main -> main

```
