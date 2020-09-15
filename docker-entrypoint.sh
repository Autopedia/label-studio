#!/bin/bash

label-studio start ${PROJECT_NAME} --init -b --host 0.0.0.0 --port ${PORT} \
--username dingbro --password qwer1234 \
-l config.xml \
--sampling uniform \
--log-level ERROR \
--force