# 노드 버전 정의
FROM node:14

# 설치될 PATH 정의
WORKDIR /usr/src/app

# 앱 의존성 설치
# 가능한 경우(npm@5+) package.json과 package-lock.json을 모두 복사하기 위해
# 와일드카드를 사용
COPY package*.json /usr/src/app

RUN npm install
# 프로덕션을 위한 코드를 빌드하는 경우
# RUN npm ci --only=production

# 앱 소스 추가
COPY . /usr/src/app

# binding 된 포트를 docker 데몬에 매핑
EXPOSE 2008

# 실행 명령어
CMD [ "npm", "start" ]