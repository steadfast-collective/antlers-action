#!/bin/bash
set -e

command_string=("antlersformat format")

if [[ "${INPUT_FILE}" ]]; then
  command_string+=" --f=${INPUT_FILE}"
else
    if [[ "${INPUT_DIRECTORY}" ]]; then
        command_string+=" --d=${INPUT_DIRECTORY}"
    else
        command_string+=" --d=resources/views"
    fi
fi

if [[ "${INPUT_OUTPUT}" ]]; then
  command_string+=" --out=${INPUT_OUTPUT}"
fi

if [[ "${INPUT_DUMP}" ]]; then
  command_string+=" --dd"
fi

if [[ "${INPUT_OPTIONS}" ]]; then
  command_string+=" --options=${INPUT_OPTIONS}"
fi

echo "Running Command: " "${command_string[@]}"

${command_string[@]}
