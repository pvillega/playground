#!/usr/bin/env bash
dir="$(cd "$(dirname "$0")" && pwd)"
cd "${dir}"/.. || exit

echo "Updates cargo and dependencies in Cargo.lock"
cargo update
