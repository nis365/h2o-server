#!/bin/bash

# First try running java.

# java -version

# Check that we can at least run H2O with the given java.
# java -jar h2o.jar -version
gbm_model_version='GBM_model_python_1584541984902_1'
if [ -z "$node_name" ] ; then node_name='H2ONode' ; fi
if [ -z "$port_num" ] ; then port_num=54321  ; fi
if [ -z "$mem_size" ] ; then mem_size='2g'  ; fi
java -Xmx${mem_size} -jar /opt/h2o-3.28.0.3/h2o.jar -name ${node_name}  -port ${port_num} -ice_root /tmp/ice_root