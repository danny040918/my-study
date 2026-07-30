# 1. Nginx 웹 서버 이미지를 기반으로 함
FROM nginx:latest

# 2. 우리가 만든 app 폴더의 내용을 웹 서버의 기본 폴더로 복사
COPY ./app /usr/share/nginx/html

# 3. 80번 포트를 열어둠
EXPOSE 80
