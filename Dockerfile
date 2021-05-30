# Use the Go image to build our application.
FROM golang:1.16 as builder

# Copy the present working directory to our source directory in Docker &
# make it the current working directory.
COPY . /src/myapp
WORKDIR /src/myapp

# Build our application as a static build.
RUN go build -ldflags '-s -w -extldflags "-static"' -tags osusergo,netgo,sqlite_omit_load_extension -o /usr/local/bin/myapp .



# This starts our final image; based on alpine to make it small.
FROM alpine

# Copy executable from builder.
COPY --from=builder /usr/local/bin/myapp /usr/local/bin/myapp

# Create default data directory (although this will likely be mounted for persistence)
RUN mkdir -p /var/lib/myapp

# Notify Docker that the container wants to expose a port.
EXPOSE 8080

# Run the application process on entry.
CMD [ "/usr/local/bin/myapp", "-dsn", "/var/lib/myapp/db" ]

