cd ../../

export PROJECT_NAME=task_car_warning
export PORT=10000

mkdir temp
cp ./projects/${PROJECT_NAME}/docker-entrypoint.sh temp/docker-entrypoint.sh
cp ./projects/${PROJECT_NAME}/config.xml temp/config.xml

docker-compose up --build

rm -rf temp