
# Start from the latest golang base image
FROM golang:latest

# ADD Maintainer info
LABEL maintainer="Sungtae kim <pchero212gmail.com>"

# Set the current working directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory iinside the container
COPY . .

# Build the go app
RUN go build -o main .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]