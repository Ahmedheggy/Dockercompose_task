#build stage from base image
FROM python:3.10-alpine     

#define /code as the working directory in the container (service)                        
WORKDIR /code                                       

#Set app.py as the main Flask application file
ENV FLASK_APP=app.py                          

#Allows Flask to listen on all network interfaces,accessible from outside the container.           
ENV FLASK_RUN_HOST=0.0.0.0     

#Execute command inside the container
RUN apk add --no-cache gcc musl-dev linux-headers  

#copy req. file from local mach to container inside /code  
COPY requirements.txt requirements.txt

#install all Python dependencies in requirements.txt.               
RUN pip install -r requirements.txt                 

#application will listen on port 5000
EXPOSE 5000      

#Copy all files from current directory on the host to the /code inside the container
COPY . .                                             

#default commands that runs when the container starts
CMD ["flask", "run"]                                