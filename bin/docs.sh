#!/usr/bin/env bash
dir="$(cd "$(dirname "$0")" && pwd)"
cd "${dir}"/.. || exit

echo "Run cargo doc to view docs of the project"
cargo doc --open
