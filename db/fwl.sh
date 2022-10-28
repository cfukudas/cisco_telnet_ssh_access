#!/bin/bash
#./tn.sh $ip $usr $frase $host
#./tn.sh $ip $usr $host $usr7
data=$(date +"%F-%H%M%S")
ssh -o StrictHostKeyChecking=no $2@$1 | tee -i logs/$3-$data.log
