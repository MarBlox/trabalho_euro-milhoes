#!/bin/bash

ger50=0
ger12=0

re=^[SsNn]$
ren=^[a-z0-9_]+$
numeros50=()
numeros12=()
clear

gerador() {
    clear
    echo "Os 5 números até 50 são"
    sleep 2
    for num50 in {1..5}; do
        while true; do
            numero50=$((RANDOM % 50 + 1))
            if [[ ! " ${numeros50[@]} " =~ " $numero50 " ]]; then
                ger50=$((ger50 + 1))
                echo "O $ger50 número é ..."
                sleep 1
                numeros50+=("$numero50")
                echo "$numero50"
                sleep 1
                clear
                break
            else
                echo "Erro: Número $numero12 já foi gerado."
                echo "A gerar outro ..."
                sleep 2
                clear
            fi
        done
    done

    echo "Os 2 números até 12 são"
    sleep 2
    for num12 in {1..2}; do
        while true; do
            numero12=$((RANDOM % 12 + 1))
            if [[ ! " ${numeros12[@]} " =~ " $numero12 " ]]; then
                ger12=$((ger12 + 1))
                echo "O $ger12 número é ..."
                sleep 1
                numeros12+=("$numero12")
                echo "$numero12"
                sleep 1
                clear
                break
            else
                echo "Erro: Número $numero12 já foi gerado."
                echo "A gerar outro ..."
                sleep 2
                clear
            fi
        done
    done
    echo ""
    echo "Os 5 numeros gerados até 50 foram ${numeros50[@]}"
    echo ""
    echo "Os 2 numeros gerados até 12 foram ${numeros12[@]}"
    echo ""
    guardar
    ger50=0
    ger12=0
    numeros50=()
    numeros12=()
    clear
    
    echo "Quer gerar outra vez? (s/n)"
    read gerar
    if [[ $gerar =~ $re ]]; then
        if [[ $gerar == s ]]; then
            gerador
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