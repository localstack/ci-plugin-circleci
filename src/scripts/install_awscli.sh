#!/bin/bash
test "$INSTALL_AWSLOCAL" != "true" || pip3 install -q localstack awscli-local[ver1]