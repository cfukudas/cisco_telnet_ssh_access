# ACESSO TELNET E SSH POR LISTA E CRIAÇÃO DE LOGS

Esse é um script shell para acesso de equipamentos **CISCO** por lista e/ou menus com a criação automatica de logs com data e hora 
em sua devida pasta "logs", também preenche automaticamente login e senha. 

Foi escrito de forma que não é necessário a utilização de sshpass.

## Itens necessários para execução do código

- Linux ou WSL
- Expect

## Configurações iniciais

Editar o script "sw.sh e sw2.sh" com o menu que deseja que apareça na tela. 

Para o preenchimento automatico de usuario e senha, as variáveis a seguir deverão ser configuradas:

```
usr="seu_user"
pass="sua_senha" 
```

Caso o usuario para acesso seja o mesmo do linux, mantenha como `whoami`

```
usr=`whoami`
````

Editar o arquivo de banco de dados que está na pasta "db" chamado "database.txt", incluindo como no exemplo:

```
1_NUMERO_DE_ACESSO:2_METODO:3_NOME_DO_DEVICE:4_IP:5_DESCRIÇÃO
```

**1** - Seria o ID para identificar o device no banco de dados, optei por 3 digitos para melhor organização<br>
**2** - O metodo de acesso ssh ou telnet, inclua como "SSH","TLN" ou "FWL"<br>
**3** - Nome do device ou hostname como preferir, sem espaços<br>
**4** - IP do device, em ipv4, não foram testados em ipv6<br>
**5** - Descrição do device, sem espaços<br>

Exemplo de config:
```
101:SSH:DEVICEA-01:10.10.10.1:DEVICE_A_DC1
````
## Executando

```
./sw.sh
```

Caso não exista a pasta "logs", será criado um automaticamente.

Aparecerá o menu/lista que você configurou previamente, onde deverá inserir o ID desejado e apertar enter,
caso o numero for invalido ele avisará que o numero não existe e retorna para o menu inicial, caso esteja 
correto ele fara o acesso.

## Logs

Automaticamente quando acessa o device, ele cria um arquivo .log contendo tudo que você executou no device,

O arquivo de exemplo seria esse:
```
DEVICEA-01-2022-10-28-121013.log
```
Ficaria como a seguir: Hostname_Ano_Mes_Dia_HoraMinutosSegundos.log

## Informações Gerais

Esse script foi criado por mim, com muita pesquisa e ajuda de algumas pessoas que não consigo citar por aqui,
mas sou muito grato a elas. 

Criado em 2017 e atualizado em 2022 para o devido compartilhamento.

## Licença

Copie, crie e melhore.
