#./Dockerfile
FROM node:14
#기반이 될 이미지

# 작업디렉토리(default)설정
WORKDIR /usr/src/app 

## Install packages
#현재 패키지 설치 정보를 도커 이미지에 복사
COPY package*.json ./ 
#설치정보를 읽어 들여서 패키지를 설치
RUN npm install

## Copy all src files
#현재경로에 존재하는 모든 소스파일을 이미지에 복사
COPY . . 


## Run the application on the port 8080
#8000번 포트를 외부에 개방하도록 설정
EXPOSE 5000   


CMD ["npm", "start"]
# gunicorn을 사용해서 서버를 실행
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "iltal.wsgi:application"]