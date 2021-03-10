#!/usr/bin/env bash
dir="$(cd "$(dirname "$0")" && pwd)"
cd "${dir}"/.. || exit

echo "Format, lint, and test the code"
"${dir}"/fmt.sh
"${dir}"/lint.sh
"${dir}"/test.sh
