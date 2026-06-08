# Resumo dos Arquivos do Projeto

## config.py

Armazena as configurações gerais do projeto, como tamanho da janela, quantidade de células do labirinto e cores utilizadas na interface.

## cell.py

Define a classe `Cell`, que representa cada célula do labirinto. Cada célula possui posição, paredes e um indicador de visitação usado durante a geração do mapa.

## maze_generator.py

Responsável por criar e gerar o labirinto de forma aleatória utilizando o algoritmo de busca em profundidade (**DFS - Depth First Search**) com *backtracking*, garantindo que todas as células estejam conectadas.

## astar.py

Implementa o algoritmo **A\***, responsável por encontrar o melhor caminho entre o ponto inicial e o ponto final do labirinto.

## renderer.py

Cuida da parte visual da aplicação, desenhando o labirinto, o caminho encontrado pelo algoritmo A\* e os pontos de início e fim.

## animation.py

Possui uma função para animar um agente percorrendo automaticamente o caminho encontrado. Atualmente essa funcionalidade não é utilizada no programa principal.

## main.py

É o arquivo principal do projeto. Ele inicializa o jogo, gera o labirinto, controla a movimentação do jogador, verifica a vitória e permite reiniciar a partida.

# Resumo Geral da Aplicação

O projeto consiste em um jogo de labirinto desenvolvido com **Pygame**. A cada partida, um labirinto aleatório é gerado e o jogador deve encontrar o caminho até a saída utilizando as teclas **W**, **A**, **S** e **D**.

O algoritmo **A\*** calcula automaticamente a melhor rota até o objetivo e a exibe como uma dica visual. Conforme o jogador avança, essa indicação é atualizada.

Ao chegar ao destino, uma mensagem de vitória é exibida, e o usuário pode gerar um novo labirinto pressionando a tecla **R**.

A aplicação possui uma estrutura organizada, separando configuração, geração do labirinto, busca de caminhos, renderização gráfica e controle do jogo em módulos independentes.