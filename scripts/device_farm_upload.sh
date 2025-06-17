#!/bin/sh

#set -x
#set -e

upload_package() {
  PACKAGE_PATH="${1}"
  UPLOAD_INFO="${2}"

  echo "${UPLOAD_INFO}" | jq
  UPLOAD_URL=$(echo "${UPLOAD_INFO}" | jq -r '.upload.url')
  UPLOAD_ARN=$(echo "${UPLOAD_INFO}" | jq -r '.upload.arn')
  curl -T "${PACKAGE_PATH}" "${UPLOAD_URL}"

  while true; do
    UPLOAD_RESULT=$(aws devicefarm get-upload --arn "${UPLOAD_ARN}")
    UPLOAD_STATUS=$(echo "${UPLOAD_RESULT}" | jq -r '.upload.status')

    if [ "${UPLOAD_STATUS}" = "FAILED" ]; then
      echo "Upload did not complete successfully, the status was ${UPLOAD_STATUS}"
      echo "Unable to proceed with the tests"
      echo $UPLOAD_RESULT
      exit 1
    elif [ "${UPLOAD_STATUS}" != "SUCCEEDED" ]; then
      echo "Upload of ${PACKAGE_PATH} is not completed, current status is ${UPLOAD_STATUS}"
      echo "Wait until upload is completed ..."
      sleep 5
    else
      echo "Uploading ${PACKAGE_PATH} is completed with status ${UPLOAD_STATUS}"
      break
    fi
  done
}

COMPILATION_DATE=$(date +%s)

# Upload Your Test Scripts Package
echo "Upload test_bundle.zip to Device Farm"
TEST_UPLOAD_INFO=$(aws devicefarm create-upload \
  --project-arn "${AWS_PROJECT_ARN}" \
  --name "$COMPILATION_DATE" \
  --type "APPIUM_PYTHON_TEST_PACKAGE")

TEST_UPLOAD_ARN=$(echo "${TEST_UPLOAD_INFO}" | jq -r '.upload.arn')
upload_package "test_bundle.zip" "${TEST_UPLOAD_INFO}"

