#!/bin/bash

label-studio start ${PROJECT_NAME:-keyword_extraction_project} --init -b --host 0.0.0.0 --port 8082 \
--username dingbro --password qwer1234 \
-l config.xml \
--sampling uniform \
--log-level ERROR \
--input-path=tasks --input-format=json-dir \
--force