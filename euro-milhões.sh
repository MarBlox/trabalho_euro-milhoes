#!/bin/bash

ger50=0
ger12=0

re=^[SsNn]$
ren=^[a-z0-9_]+$

gerador() {
    clear
    echo "Os 5 números até 50 são"
    for num50 in {1..5}; do
        ger50=$((ger50 + 1))
        echo "O $ger50 numero é ..."
        sleep 1
        numero50=$((RANDOM % 50 + 1))
        numeros50+=("$numero50")
        echo "$numero50"
    done

    echo "Os 2 números até 12 são"
    for num12 in {1..2}; do
        ger12=$((ger12 + 1))
        echo "O $ger12 numero é ..."
        sleep 1
        numero12=$((RANDOM % 12 + 1))
        numeros12+=("$numero12")
        echo "$numero12"
    done
    echo ""
    echo "Os 5 numeros gerados até 50 foram ${numeros50[@]}"
    echo "Os 2 numeros gerados até 12 foram ${numeros12[@]}"
    echo ""
    guardar

    echo ""

    echo "Quer gerar outra vez? (s/n)"
    read gerar
    if [[ $gerar =~ $re ]]; then
        if [[ $gerar == s ]]; then
            gerador
            guardar
        else
            clear
            echo "Adeus"
            sleep 1
            clear
            exit
        fi
    else
        echo "Tens de escrever s ou n para continuar"
    fi

    ger50=0
    ger12=0
    numeros50=()
    numeros12=()
}

guardar() {
    while true; do
    echo "Quer guardar num documento? (s/n)"
    read guardar
    if [[ $guardar =~ $re ]]; then
        if [[ $guardar == s ]]; then
            echo "Qual será o nome?"
            read nome_do_ficheiro
            if [[ $nome_do_ficheiro =~ $ren ]]; then
                if [[ -e "$nome_do_ficheiro.txt" ]]; then
                    echo "O arquivo $nome_do_ficheiro já existe."
                else
                    touch $nome_do_ficheiro.txt
                    echo "Os 5 numeros gerados até 50 foram ${numeros50[@]}" >> $nome_do_ficheiro.txt
                    echo "Os 2 numeros gerados até 12 foram ${numeros12[@]}" >> $nome_do_ficheiro.txt
                    echo "Ficheiro criado com sucesso"
                    numeros50=()
                    numeros12=()
                    break
                fi
            else
                echo "O ficheiro so pode conter letras minusculas, numero inteiro e só aceita esse caracter (_) "
                break
            fi
        else
            break
        fi
    else
        clear
        echo "Tens de escrever s ou n para continuar"
    fi
done
}

clear

while true; do
    echo "Bem vindo ao Euro Milhões vou gerar 5 numeros ate a 50 e 2 numeros ate 12"
    echo "Quer gerar? (s/n)"
    read gerar
    if [[ $gerar =~ $re ]]; then
        if [[ $gerar == s ]]; then
            while true; do
                gerador
                guardar
            done
        else
            clear
            echo "Adeus"
            sleep 1
            clear
            break
        fi
    else
        clear
        echo "Tens de escrever s ou n para continuar"
    fi
done

