# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Update the package list and install Python 3 and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Set the default Python to Python 3
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1


# Create a working directory (change it to your project directory)
WORKDIR /app

# Copy your Django project files into the container
COPY . /app/

# Install Python dependencies using pip (you might need to adjust this based on your project's requirements)
RUN pip install -r req_new.txt

# Expose the port your Django app will run on (e.g., 8000)
EXPOSE 8000

# Start your Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
