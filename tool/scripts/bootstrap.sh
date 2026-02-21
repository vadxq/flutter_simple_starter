#!/usr/bin/env bash
set -euo pipefail

dart pub get
dart run melos bootstrap
