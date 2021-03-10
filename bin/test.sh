#!/usr/bin/env bash
dir="$(cd "$(dirname "$0")" && pwd)"
cd "${dir}"/.. || exit

echo "Run all tests..."
cargo test
