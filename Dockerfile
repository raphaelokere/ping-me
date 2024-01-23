# Install dependencies
FROM python:3.8
WORKDIR /app
COPY ./src /app
RUN pip install -r requirements.txt
# Expose the necessary ports
EXPOSE 5000
# Define the command to run the application
CMD ["python", "app.py"]
