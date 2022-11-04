# TELNET AND SSH ACCESS BY LIST AND LOGGING

This is a shell script for accessing **CISCO** devices by list and/or menus with automatic creation of logs with date and time
in its proper "logs" folder, it also automatically fills in login and password.

It was written in such a way that it is not necessary to use sshpass.

## Comments

Sorry for any grammar and/or translation errors.

## Items needed for code execution

- Linux or WSL
- Expect

## Initial Settings

Edit the "sw.sh and sw2.sh" script with the menu you want to appear on the screen.

For example:
```
 = DC1 ================ DC2 ============== DC3 ================ DC4 === ==========
 # 101. DEVICEA-01 # 201. DEVICEB-01 # 301. DEVICEC-01 # 350. DEVICED-01 #
 # 102. DEVICEA-02 # 202. DEVICEB-02 # 302. DEVICEC-02 # 351. DEVICED-02 #
 ========================================================== ===============================
```
For the automatic filling of username and password, the following variables must be configured:

```
usr="your_user"
pass="your_password"
```

If the user to access is the same as linux, keep it as `whoami`

```
usr=`whoami`
````

Edit the database file that is in the "db" folder called "database.txt", including as in the example:

```
1_ACCESS_NUMBER:2_METHOD:3_DEVICE_NAME:4_IP:5_DESCRIPTION
```

**1** - It would be the ID to identify the device in the database, I chose 3 digits for better organization<br>
**2** - The ssh or telnet access method, include as "SSH","TLN" or "FWL"<br>
**3** - Device name or hostname as you prefer, without spaces<br>
**4** - Device IP, in ipv4, not tested in ipv6<br>
**5** - Device description, no spaces<br>

Config example:
```
101:SSH:DEVICEA-01:10.10.10.1:DEVICE_A_DC1
````
## Running

```
./sw.sh
```

If there is no "logs" folder, one will be created automatically.

The menu/list that you previously configured will appear, where you must enter the desired ID and press enter,
if the number is invalid, it will warn that the number does not exist and return to the initial menu, if it is
correct, he will access.

## logs

Automatically when accessing the device, it creates a .log file containing everything you have executed on the device,

The example file would be this:
```
DEVICEA-01-2022-10-28-121013.log
```
It would look like the following: Hostname_Ano_Mes_Dia_HoraMinutosSegundos.log

## General information

This script was created by me, with a lot of research and help from some people that I can't name here,
but I am very grateful to them.

Created in 2017 and updated in 2022 for proper sharing.

## License

Copy, create and improve.

-----------------------------------------------------------

(Portuguese, Brazil)

# ACESSO TELNET E SSH POR LISTA E CRIAÇÃO DE LOGS

Esse é um script shell para acesso de equipamentos **CISCO** por lista e/ou menus com a criação automatica de logs com data e hora 
em sua devida pasta "logs", também preenche automaticamente login e senha. 

Foi escrito de forma que não é necessário a utilização de sshpass.

## Itens necessários para execução do código

- Linux ou WSL
- Expect

## Configurações iniciais

Editar o script "sw.sh e sw2.sh" com o menu que deseja que apareça na tela. 

Por exemplo:
```
 = DC1 ============== DC2 ============== DC3 ============== DC4 =============
 # 101. DEVICEA-01  # 201. DEVICEB-01  # 301. DEVICEC-01  # 350. DEVICED-01 # 
 # 102. DEVICEA-02  # 202. DEVICEB-02  # 302. DEVICEC-02  # 351. DEVICED-02 # 
 ============================================================================
``` 
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
