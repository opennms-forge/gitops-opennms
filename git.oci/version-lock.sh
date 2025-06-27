#!/usr/bin/env bash
set -u -o pipefail

VCS_SOURCE="$(git remote get-url --push origin)"
VCS_REVISION="$(git describe --always)"
DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
export VCS_SOURCE
export VCS_REVISION
export DATE
export BASE_IMAGE="alpine:3.22"
export BASH_VERSION="5.2.37-r0"
export GIT_VERSION="2.49.0-r0"
export GITHUB_CLI_VERSION="2.72.0-r1"
