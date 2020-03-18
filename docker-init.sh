#!/bin/bash

# First try running java.

# java -version

# Check that we can at least run H2O with the given java.
# java -jar h2o.jar -version

java -Xmx2g -jar /tmp/h2o-3.28.0.3/h2o-3.28.0.3/h2o.jar -name H2ONode  -port 54321