# Use a lightweight base image
FROM ubuntu:22.04
# Create a non-root user and group
RUN groupadd -r appuser && useradd -r -g appuser appuser
# Create an application directory and set permissions
WORKDIR /app
COPY . /app
RUN chown -R appuser:appuser /app
# Switch to non-root user
USER appuser
# Run your application (example: Python app)
CMD ["echo", "Hello, running as non-root user!"]
