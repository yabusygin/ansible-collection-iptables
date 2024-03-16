#!/bin/sh

set -o errexit
set -o xtrace

ansible-lint roles/ extensions/molecule/
cd extensions/ && molecule test --all
