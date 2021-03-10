#!/usr/bin/env bash
dir="$( cd "$( dirname "$0" )" && pwd )"
cd "${dir}"/.. || exit

echo "Format, lint, and test the code"
cargo fmt
cargo clippy -- -D warnings
cargo test