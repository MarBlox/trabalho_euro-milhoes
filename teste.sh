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
    if [ "$aceitar" != s ]; then
        echo "Ok"
        break
    fi
done