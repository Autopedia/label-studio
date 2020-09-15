# Building the main container
FROM python:3.6-slim
WORKDIR /label-studio

RUN echo "[ Project: ${PROJECT_NAME} ] Start building docker image"

# Copy and install requirements.txt first for caching
COPY ./requirements.txt /label-studio
RUN pip install -r requirements.txt
COPY . /label-studio
RUN python setup.py develop

COPY ./docker-entrypoint.sh /label-studio
COPY ./config.xml /label-studio

# COPY ./projects/task_car_warning/docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

EXPOSE ${PORT}
ENTRYPOINT ["./docker-entrypoint.sh"]

# CMD ["./projects/${PROJECT_NAME}/run.sh"]
