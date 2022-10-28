#!/bin/bash
data=$(date +"%F-%H%M%S")
telnet $1 | tee -i logs/$3-$data.log
