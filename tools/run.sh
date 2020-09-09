#!/bin/bash

label-studio start ${PROJECT_NAME:-car_warning_project} --init -b --host 0.0.0.0 --port 8082 \
--username dingbro --password qwer1234 \
--source s3 --source-path car-warning-dataset \
--source-params "{\"use_blob_urls\": true, \"data_key\": \"image\", \"prefix\": \"images1\", \"regex\": \"^.*.(jpeg|jpg|JPG|JPEG)\" }" \
--target s3-completions --target-path car-warning-dataset \
--target-params "{\"prefix\": \"outputs1\", \"create_local_copy\": true}" \
-l config.xml -c project_config.json
--sampling uniform \
--log-level ERROR \
--force