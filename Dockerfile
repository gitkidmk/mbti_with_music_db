FROM mariadb:latest

ENV MARIADB_USER=mbti_music \
    MARIADB_PASSWORD=mbti_music \
    MARIADB_DATABASE=mbti_music \
    MARIADB_ROOT_PASSWORD=mariadb

COPY ./script_files/ docker-entrypoint-initdb.d
COPY ./mbti.cnf /etc/mysql/conf.d

# maridb_user, password, database 생성하면 유저 생성 및 db 접근권한 부여까지 됨
# script_file을 docker-entrypoint-initdb.d에 넣으면 실행

# windows에서 volume을 사용하기 위해서는 wsl 접근 필요... wsl은 나중에..!
# docker build --tag db:0.1 .
# docker run -d --name db-cont -p 3306:3306 db:0.1