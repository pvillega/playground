#!/usr/bin/env bash
dir="$( cd "$( dirname "$0" )" && pwd )"
cd "${dir}"/.. || exit

echo "Build production binaries"
cargo build --release