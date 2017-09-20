# go:dev is the alpine image with the go tools added
FROM go:dev
MAINTAINER "Satish Hegde"

WORKDIR /app
ENV GOPATH /gocode

# Set an env var that matches your github repo name
ENV SRC_DIR=/go/src/github.com/hgsat123/dockergo/
# Add the source code:
ADD . $SRC_DIR
# Build it:
RUN cd $SRC_DIR; go build -o myapp; cp myapp /app/
RUN chmod +x /app/myapp

ENTRYPOINT ["./myapp"]
