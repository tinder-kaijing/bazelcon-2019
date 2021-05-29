#!/bin/bash

set -e
# Avoid certain problems under MSYS on Windows
export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"

bazelisk build '...'
bazelisk test '...' --test_verbose_timeout_warnings --test_output=errors

# bazelisk run //time-server
# bazelisk run //fx-server
# bazelisk run //client

# http://localhost:5432/
# http://localhost:8005/
