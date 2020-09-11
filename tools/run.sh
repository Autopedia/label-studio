#!/bin/bash

label-studio start ${PROJECT_NAME:-text_header_project} --init -b --host 0.0.0.0 --port 8082 \
--username dingbro --password qwer1234 \
--source s3 --source-path text-header-dataset \
--source-params "{\"use_blob_urls\": true, \"data_key\": \"image\", \"prefix\": \"images1\", \"regex\": \"^.*.(jpeg|jpg|JPG|JPEG|png|PNG)\" }" \
--target s3-completions --target-path text-header-dataset \
--target-params "{\"prefix\": \"outputs1\", \"create_local_copy\": true}" \
-l config.xml --config project_config.json \
--sampling uniform \
--log-level ERROR \
--force