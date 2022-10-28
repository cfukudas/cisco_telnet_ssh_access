#!/bin/bash
#########################################################################################
#
#                               VAR
#
#########################################################################################

logs=logs
data=$(date +"%F-%H%M%S")
usr=`whoami`
pass="pass123"
bd1=db
bd2=database.txt

#########################################################################################
#
#                               FUNCTION
#
#########################################################################################
function SE()   {

                host=$(cat $bd1/$bd2 | grep ^$op | cut -d: -f3)
                ip=$(cat $bd1/$bd2 | grep ^$op | cut -d: -f4)
                how=$(cat $bd1/$bd2 | grep ^$op | cut -d: -f2)
                desc=$(cat $bd1/$bd2 | grep ^$op | cut -d: -f5)
                comp=$(cat $bd1/$bd2 | grep ^$op | cut -d: -f1)

                if [[ $op != $comp ]]
                        then
                                echo "
                                [31;1mINVALID[0m
                                "
                                sleep 1
                                ./$0

                        elif [ $how == "SSH" ]
                                then

                                clear
                                echo "
                                [1;32m$host - $ip - $desc[0m
                                "

                                expect -c "
                                spawn -noecho ./$bd1/sh.sh $ip $usr $host $pass
                                expect \"*ssword:*\"
                                send \"$pass\r\"
                                interact
                                "

                        elif [ $how == "FWL" ]
                                then

                                clear
                                echo "
                                [1;32m$host - $ip - $desc[0m
                                "

                                expect -c "

                                spawn -noecho ./$bd1/fwl.sh $ip $usr $host $pass
                                expect \"*ssword:*\"
                                send \"$pass\r\"
                                interact
                                "

                        else
                                clear
                                echo "
                                [1;32m$host - $ip - $desc[0m
                                "
                                expect -c "

                                spawn -noecho ./$bd1/tn.sh $ip $usr $host $pass
                                expect \"*Username:*\"
                                send \"$usr\r\"
                                expect \"*ssword:*\"
                                send \"$pass\r\"
                                interact

                                "
                fi

}


#########################################################################################
if test -d logs/
        then
                echo ""
        else
                echo "[34;1mCreating folder logs[0m"
                mkdir logs/
                sleep 2
fi
#########################################################################################
clear


echo "# NEW MENU #
"
read -p "ENTER THE OPTION/1 FOR NEXT/0 EXIT:  " op
#
#
case $op in

        0)      exit
                ;;

        1)      ./sw.sh
                ;;

        [1-9][0-9][0-9]) SE;;


        *)      echo "
                        [31;1mINVALID[0m
                "
                sleep 1
                ./$0
                ;;

esac

