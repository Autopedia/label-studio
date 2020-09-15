# Building the main container
FROM python:3.6-slim
WORKDIR /label-studio

# Copy and install requirements.txt first for caching
COPY ./requirements.txt /label-studio
RUN pip install -r requirements.txt
COPY . /label-studio
RUN python setup.py develop

# Copy docker-entrypoint.sh and config.xml from temp directory
COPY temp/* /label-studio/ 

# Add executable permission
RUN ["chmod", "+x", "docker-entrypoint.sh"]

EXPOSE ${PORT}
ENTRYPOINT ["./docker-entrypoint.sh"]
