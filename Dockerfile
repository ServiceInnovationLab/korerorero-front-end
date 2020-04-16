FROM node:13

EXPOSE 3000
ARG ORCHESTRATION_ENDPOINT=set_me_in_docker_compose_or_in_dot_env
ENV ORCHESTRATION_ENDPOINT=${ORCHESTRATION_ENDPOINT}

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
CMD [ "npm", "start" ]
