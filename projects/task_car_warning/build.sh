cd ../../

export PROJECT_NAME=task_car_warning
export PORT=10000

mkdir temp
cp ./projects/${PROJECT_NAME}/docker-entrypoint.sh temp/docker-entrypoint.sh
cp ./projects/${PROJECT_NAME}/config.xml temp/config.xml
cp ./projects/${PROJECT_NAME}/project_config.json temp/project_config.json


docker-compose up --build -d

echo "\n========================================"
echo "Server running at http://0.0.0.0:${PORT}"
echo "========================================\n"

rm -rf temp