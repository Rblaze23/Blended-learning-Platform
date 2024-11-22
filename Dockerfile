FROM node:14-alpine

LABEL MAINTAINER="Infinity Management <chebil1203@gmail.com>"

# install dependencies & set working directory
COPY ./package.json /app/
WORKDIR /app
RUN ["yarn"]

# Copy project
COPY . /app/

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

EXPOSE 3000


# start the container
CMD yarn start
