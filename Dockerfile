FROM node:15-alpine
ARG PORT=3000
ARG NODE_ENV
ENV PORT=$PORT
#Create app directory
WORKDIR app
#Install app dependencies
COPY package*.json ./





#If you are building your code for production
# RUN npm ci --omit=dev

#Bundle app source
COPY controller controller 
COPY cssStyle cssStyle
COPY image image
COPY middleware middleware
COPY models models
COPY views views
COPY config.env config.env
COPY server.js server.js 
COPY js js

#RUN npm install 
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi      

EXPOSE $PORT
#CMD ["npm","run","dev"]    this command will be run in docker compose
#CMD npm run start:dev

#This is use with:   docker build . -t pnguyen/my-node-js-1 
#to run with volumn: docker run --name my-container -p 1234:2000 -d  -v $PWD/views:/app/views  pnguyen/my-node-js-1  
# $PWD/views:/app/views => argumnet on left of ':',it is your machine.  Argument on the right of ':', it is your container  
# $PWD/views:/app/views => any changes under 'views' folder, it will take affect withour rebuild image.
#IMPORTANT to note for command CMD npm run dev,  in package.json, under scripts, 'start' is default, to run it, use
# CMD npm start,  otherwise, has to use CMD npm run <argument>, example: CMD npm run dev

#To pull image from docker hub, use: docker push ninaryan2024/my-node-app:tagname
#To push image from docker hub, first create tag: docker tag imageName:version tagname
#Another way of mount, using local directory, in this case, use local image folder to replace remote image folder
#C:\delete1\expressProject>docker run --name container-test -p 200:8000 -d -v C:\image:/app/image ninaryan2024/my-node-app:dev
#For -v volumn, the left argument can be short by using, if window, use %cd%, if powershell, use ${pwd},if mac or linux, use $(pwd)

#To view inside of docker container, use docker exec -it my-container-name /bin/sh