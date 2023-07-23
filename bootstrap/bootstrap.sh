#!/bin/bash
# This script exports `bootstrap`, which will download and run a shell script from
# the `bootstrap` directory of this repo
CURL_COMMAND="curl -sfL -H 'Cache-Control: no-cache, no-store'"

BOOTSTRAP_BASE_URL="https://raw.githubusercontent.com/siddthesquid/env/main/bootstrap"
BOOTSTRAP_PRE_SCRIPT_NAME="pre.sh"
BOOTSTRAP_CMD_SCRIPT_NAME="cmd.sh"
BOOTSTRAP_POST_SCRIPT_NAME="post.sh"

BOOTSTRAP_PARAMS_FILE="params.sh"
BOOSTRAP_PARAMS_OVERRIDES_FILE="params.overrides.sh"

check_env() {
  local var_name=$1
  if [ -z "${!var_name}" ]; then
    echo "ERROR: ${var_name} is not set"
    exit 1
  fi
}

error() {
  echo "ERROR: $1"
  exit 1
}

# `reload_params` will download `params.sh`, source it, and also source
# `params.overrides.sh` in case the user wants to override any of the params
reload_params() {
  local script_name=$1

  # Download the params file
  curl -sfL -H 'Cache-Control: no-cache, no-store' \
    "${BOOTSTRAP_BASE_URL}/${script_name}/${BOOTSTRAP_PARAMS_FILE}" \
    > "${BOOTSTRAP_PARAMS_FILE}"

  # Source the params file
  echo "SOURCING ${BOOTSTRAP_PARAMS_FILE}"
  source "${BOOTSTRAP_PARAMS_FILE}"

  if [ -f "${BOOSTRAP_PARAMS_OVERRIDES_FILE}" ]; then
    echo "SOURCING ${BOOSTRAP_PARAMS_OVERRIDES_FILE}"
    source "${BOOSTRAP_PARAMS_OVERRIDES_FILE}"
  fi
  "SOURCED BOOTSTRAP PARAMS"
}

download_pre() {
  local script_name=$1
  local output_file=$2
  curl -sfL -H 'Cache-Control: no-cache, no-store' \
    "${BOOTSTRAP_BASE_URL}/${script_name}/${BOOTSTRAP_PRE_SCRIPT_NAME}" \
    > "${output_file}"
}

download_cmd() {
  local script_name=$1
  local output_file=$2
  curl -sfL -H 'Cache-Control: no-cache, no-store' \
    "${BOOTSTRAP_BASE_URL}/${script_name}/${BOOTSTRAP_CMD_SCRIPT_NAME}" \
    > "${output_file}"
}

download_post() {
  local script_name=$1
  local output_file=$2
  curl -sfL -H 'Cache-Control: no-cache, no-store' \
    "${BOOTSTRAP_BASE_URL}/${script_name}/${BOOTSTRAP_POST_SCRIPT_NAME}" \
    > "${output_file}"
}

bootstrap() {
  local script_name=$1

  echo "RUNNING ${script_name}"

  # Download the pre script and run it if it exists
  echo "PRE SCRIPT STARTED"

  local pre_script="$(mktemp)"
  if download_pre "${script_name}" "${pre_script}"; then
    bash "${pre_script}"
    if [ $? -ne 0 ]; then
      echo "PRE SCRIPT FAILED"
      rm "${pre_script}"
      return 1
    fi
  fi
  rm "${pre_script}"

  echo "PRE SCRIPT FINISHED"

  # Download the cmd script and run it if the pre script succeeded or didn't
  # exist
  echo "CMD SCRIPT STARTED"

  local cmd_script="$(mktemp)"
  if download_cmd "${script_name}" "${cmd_script}"; then
    bash "${cmd_script}"
  fi
  rm "${cmd_script}"

  echo "CMD SCRIPT FINISHED"

  # Download the post script and run it if it exists
  echo "POST SCRIPT STARTED"

  local post_script="$(mktemp)"
  if download_post "${script_name}" "${post_script}"; then
    bash "${post_script}"
    if [ $? -ne 0 ]; then
      echo "POST SCRIPT FAILED"
      rm "${post_script}"
      return 1
    fi
  fi
  rm "${post_script}"

  echo "POST SCRIPT FINISHED"
}