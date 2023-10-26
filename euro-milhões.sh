#!/bin/bash

criados50=0
criados20=0
# while [[]]
# do
#     if [ $criados20 -e 2 ]
#     then
#         while [[ $criados50 -ne 5 ]]
#         do
#             echo "$((RANDOM % 50+1))"
#             criados50=($criados50+1)
#         done
        
#         while [[ $criados20 -ne 2 ]]
#     do
#         echo "$((RANDOM % 1+20))"
#         criados20=($criados20+1)
#     done
# done

aceitar=0

while true
do
    echo "Os 5 numeros até 50"
    for i in {1..5}; do
        echo $((RANDOM % 50+1))
    done

    echo "Os 2 numeros até 10"
    for i in {1..2}; do
        echo $((RANDOM % 12+1))
    done

    read "Quer outra vez"
    if [$aceitar != s]; then
        echo "Ok"
        break
    fi
done