#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# echo ansible-playbook playbook.yaml  --extra-vars \"version=1.23.45 other_variable=foo\"
# exit

cd "${SCRIPT_DIR}/terraform"
terraform init
terraform apply -auto-approve

. "${SCRIPT_DIR}/.env"
SHA1=$( echo -n $STUDENT_EMAIL | sha1sum )
LOG_DIR=${SHA1::10}
DOCKER_ENV_FILE="${SCRIPT_DIR}/app/.env"
echo "LOG_DIR=${LOG_DIR}" > ${DOCKER_ENV_FILE}

echo "PORT=${PORT}" >> ${DOCKER_ENV_FILE}

cd "${SCRIPT_DIR}/ansible"
ansible-playbook playbook.yaml  --extra-vars """student_email=${STUDENT_EMAIL} postgres_user=${POSTGRES_USER} postgres_address=${POSTGRES_ADDRESS} postgres_password=${POSTGRES_PASSWORD} postgres_database=${POSTGRESS_DATABASE}"""