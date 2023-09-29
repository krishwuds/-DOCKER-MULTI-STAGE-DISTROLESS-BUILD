# Stage 1: Build the Python application
FROM python:3.11.4 as builder
WORKDIR /app
COPY calculator.py /app/
RUN pip install pyinstaller
RUN pyinstaller --onefile --enconding=utf-8 calculator.py

# Stage 2: Create a distroless final image
FROM gcr.io/distroless/python3
WORKDIR /app
COPY --from=builder /app/dist/calculator /app/calculator
CMD ["./calculator"]




