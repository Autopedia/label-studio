# Building the main container
FROM python:3.6-slim
WORKDIR /label-studio

# Copy and install requirements.txt first for caching
COPY ./requirements.txt /label-studio
RUN pip install -r requirements.txt
COPY . /label-studio
RUN python setup.py develop

# Copy label studio lanuch command and UI configuration
RUN export ENTRY_PATH="./projects/${PROJECT_NAME}/docker-entrypoint.sh"
RUN export UI_CONFIG_PATH="./projects/${PROJECT_NAME}/config.xml"
COPY ${ENTRY_PATH} /label-studio
COPY ${UI_CONFIG_PATH} /label-studio

# Add executable permission
RUN chmod +x docker-entrypoint.sh

EXPOSE ${PORT}
ENTRYPOINT ["./docker-entrypoint.sh"]
