#!/bin/bash

set -e
# Avoid certain problems under MSYS on Windows
export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"

bazelisk build '...'

# No test for this one yet.
# bazelisk test '...' --test_verbose_timeout_warnings --test_output=errors

# In separate windows:
# bazelisk run :frontend
# bazelisk run :service
# visit http://localhost:8080

# Or, to run one of the services directly:

# Build the deployable JAR:
bazelisk build :service-deploy

# Run it:
# java -jar bazelisk-bin/service/src/main/java/com/oasisdigital/grocery/grocery_deploy.jar

# There is a way to retrieve that filename programmaticlaly with "bazelisk aquery", beyond
# the scope of this introduction. Also, in a real build process we would copy the desired
# output artifacts onward.
