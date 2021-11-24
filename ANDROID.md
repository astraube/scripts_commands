

> ## Comandos úteis para Android
> Compilado por [Andrè Straube](www.andrestraube.com.br)


* Estou fazendo uma compilação dos comandos ADB Android que julgo mais úteis.
* Fique a vontade para melhorias
* Próximo passo será organizar por categorias
* Desconsiderar erros de portugues e desorganização :)


[Variáveis de Ambiente](https://developer.android.com/studio/command-line/variables)

[Registros de rastreamento](https://developer.android.com/studio/profile/generate-trace-logs)

> Netstat - Display networking information

```bash
# Default is netstat -tuwx
adb shell netstat

# Routing table
adb shell netstat -r

# All sockets (not just connected)
adb shell netstat -a

# Listening server sockets
adb shell netstat -l

# TCP sockets
adb shell netstat -t

# UDP sockets
adb shell netstat -u

# Raw sockets
adb shell netstat -w

# Unix sockets
adb shell netstat -x

# Extended info
adb shell netstat -e

# Don't resolve names
adb shell netstat -n

# Wide display
adb shell netstat -w

# Show PID/program name of sockets
adb shell netstat -p
```


#### fastboot update
```bash
adb reboot-bootloader
adb reboot bootloader
fastboot flash system system.img
fastboot flash recovery recovery.zip
fastboot flash boot boot-new-V2.img
fastboot reboot
```
-----------------------------------------------
```bash
fastboot devices
fastboot -i 0x0fce oem unlock 0x <insert your unlock code>
fastboot oem unlock
```
-----------------------------------------------

#### recovery mode
```bash
adb reboot recovery
adb sideload update.zip
```
-----------------------------------------------

##### mount remount system ready-only (necessário ROOT)
```bash
su

# permissao de escrita
mount -o remount,rw none /system 

# permissao de leitura
mount -o remount,ro none /system
```

-----------------------------------------------

#### getprop
```bash
# Ver todas as propriedades disponíveis com este comando:
adb shell getprop

# Para obter a versão do Android, você pode usar:
adb shell getprop ro.build.version.release 

# Para obter o nível de API:
adb shell getprop ro.build.version.sdk 
```
-----------------------------------------------

#### am start
```bash
# iniciar um APP diretamente em uma Activity especifica
adb shell am start -a android.intent.action.MAIN "[package app]/.LauncherActivity"

# Configurações do sistema
adb shell am start -n com.android.settings/.Settings

adb shell am start -a android.intent.action.MAIN -n com.android.settings/.Settings

adb shell am start -a android.settings.SETTINGS

# GPS
adb shell am start -a android.settings.LOCATION_SOURCE_SETTINGS

# wifi-settings
adb shell am start -a android.intent.action.MAIN -n com.android.settings/.wifi.WifiSettings

# LAUNCHER
adb shell am start -a android.intent.action.MAIN -c android.intent.category.HOME

# HOME
adb shell am start -c android.intent.category.HOME -a android.intent.action.MAIN
```
-----------------------------------------------

##### Habilitar/Desabilitar wifi
```bash
adb shell svc wifi disable [enable]
```

##### Get device Android Id
```bash
adb shell settings get secure android_id
```

##### enviar comando por content provider
```bash
adb shell content call --uri content://[package app].Commands --method sendGeoTest
```


## Alterar Configuracoes Globais
 * Para descobrir novas configurações basta abrir o ADB DEBUG e procurar eventos do tipo `call_put(...)`

###### ativar GPS (alta precisão)
```bash
adb shell settings put secure location_providers_allowed gps,network
adb shell settings put secure location_providers_allowed '+gps,network'
adb shell settings put secure location_providers_allowed -gps,network
```

###### tempo de desligamento da tela
```bash
adb shell settings put system screen_off_timeout -1
```

###### instalacao de aplicativos de fontes desconhecidas (0 off | 1 on)
```bash
adb shell settings put global install_non_market_apps 0
adb shell settings put global install_non_market_apps 1
```

###### instalacao de aplicativos de fontes desconhecidas (Android mais recente)
```bash
adb shell settings put secure install_non_market_apps 1
```

###### Seguranca - Nenhum Bloqueio de Tela
```bash
adb shell settings put global voice_unlock_screen null
adb shell settings put global voice_unlock_and_launch1 null
adb shell settings put global voice_unlock_and_launch2 null
adb shell settings put global voice_unlock_and_launch3 null
```

###### Permanecer Ativo enquanto estiver carregando
```bash
adb shell settings put global stay_on_while_plugged_in 0
adb shell settings put global stay_on_while_plugged_in 3
```

###### Modo avião  (0 off | 1 on)
```bash
adb shell settings put global airplane_mode_on 1
adb shell settings put global airplane_mode_on 0
```

-----------------------------------------------
###### Listar processos
```bash
adb -d ps
```
###### Parar processos
```bash
adb -d kill <PID>
```

###### Parar APP
```bash
adb shell stop [package app]
```

###### Forçar parada do APP
```bash
adb shell am force-stop [package app]
```

###### broadcast-boot-completed
```bash
adb shell am broadcast -a android.intent.action.BOOT_COMPLETED
```

## adb shell top

###### Show process activity in real time
```bash
adb shell top
```
> *Cursor LEFT/RIGHT to change sort, UP/DOWN move list, space to force update, R to reverse sort, Q to exit*

###### Show process activity in real time (Show threads)
```bash
adb shell top -H
```
###### Show process activity in real time (Show threads by PID)
```bash
adb shell top -H -p 6677
```
###### Show FIELDS (def PID,USER,PR,NI,VIRT,RES,SHR,S,%CPU,%MEM,TIME+,CMDLINE)
```bash
adb shell top -H -o %CPU,%MEM,TIME+,CMDLINE
```
###### Maximum number of tasks to show
```bash
adb shell top -m 50
```

## adb shell ps

###### List processes. Which processes to show (selections may be comma separated lists)
```bash
adb shell ps -A
```
###### All processes
```bash
adb shell ps -A
```
###### filter PIDs (--pid)
```bash
adb shell ps -p 1256
```
###### Show threads
```bash
adb shell ps -t
```

## adb shell readlink 

###### ler link
```bash
adb shell readlink /proc/self/exe

adb shell readlink /proc/self/cwd
```

## adb shell pm

###### listar packages
```bash
adb shell pm list packages -f
```

###### apagar arquivos de cache para alcançar o espaço livre fornecido
```bash
adb shell pm trim-caches
```

###### Limpar preferências compartilhadas do APP
```bash
adb shell pm clear [package app]
```

###### mantenha os diretórios de dados e cache disponíveis após a remoção do pacote.
```bash
adb shell pm uninstall -k [package app]
```

###### desistalar um APP por package
```bash
adb shell pm uninstall [package app]
```

###### recuperar PATH absoluto de um package
```bash
adb shell pm list packages -f [package app]
```

-----------------------------------------------

#### Simulação de Botão Pressionado

###### press-menu-button
```bash
adb shell input keyevent 82
```
###### botão de liga/desliga tela
```bash
adb shell input keyevent 26
```
###### Botão de voltar
```bash
adb shell input keyevent 26
```
-----------------------------------------------

#### copy databases
```bash
adb shell run-as [package app] chmod 666 /data/app/[package app]/databases/[dbname.db]
adb pull /data/data/[package app]/databases/[dbname.db]
```
-----------------------------------------------

> [Dumpsys](https://developer.android.com/studio/command-line/dumpsys)

> [WakeLocks](https://developer.android.com/training/scheduling/wakelock)
```bash
Para ver qual WakeLocks está pendente
adb shell dumpsys power
adb shell dumpsys power | grep -i wake
adb shell dumpsys power | grep WAKE_LOCK
```

> Package infos
`adb shell dumpsys package <PACKAGE> | grep <option>`
```bash
`adb shell dumpsys package com.android.settings | grep versionName`
`adb shell dumpsys package com.android.settings | grep versionCode`
`adb shell dumpsys package com.android.settings | grep userId`
```

> [Screen Resolution](http://www.wikihow.com/Change-the-Screen-Resolution-on-Your-Android)
```bash
adb shell dumpsys display | grep mBaseDisplayInfo
```

###### Encontre o valor da densidade
```bash
adb shell wm density <NEW DENSITY> && adb reboot
```

###### Obter tamanho físico da tela
`adb shell wm size`

-----------------------------------------------

#### Print de tela
```bash
adb shell screencap /sdcard/screen.png

# Copiar print para o computador
adb pull /sdcard/screen.png screen.png

# Salvar captura de tela com o comando 'exec-out' no diretorio de usuario local
adb exec-out screencap -p > screenshot.png

# Salvar captura de tela com o comando 'exec-out' em um diretorio especifico
adb exec-out screencap -p > D:\screenshot.png
```
-----------------------------------------------

#### Video da tela
```bash
adb shell screenrecord /sdcard/demo.mp4 <press Ctrl-C to stop recording>
adb pull /sdcard/demo.mp4
adb pull rm /sdcard/demo.mp4
adb shell screenrecord --bit-rate 7000000 /sdcard/demo.mp4 <7Mbps>
adb shell screenrecord --size 1920x1080
adb shell screenrecord --time-limit <TIME max 180 seconds>

# copiar o vídeo para o computador
adb pull /sdcard/demo.mp4

# Salvar captura de tela com o comando 'exec-out' no diretorio de usuario local
adb exec-out screenrecord /sdcard/demo.mp4 -p > screenshot.png
```
-----------------------------------------------

#### Streaming de tela
* ffplay
```bash
adb exec-out screenrecord --output-format=h264 --size 540x960 - | ffplay -framerate 60 -framedrop -bufsize 16M -

adb exec-out screenrecord --output-format=h264 --size 540x960 --bit-rate=16m - | ffplay -framerate 60 -framedrop -bufsize 16M -

adb exec-out screenrecord --output-format=h264 --size 540x960 - | ffplay -hide_banner -framerate 60 -probesize 32 -sync video  -
```

* mplayer
```bash
adb exec-out screenrecord --output-format=h264 - | mplayer -framedrop -fps 6000 -cache 512 -demuxer h264es -
adb exec-out screenrecord --output-format=h264 --size 540x960 - | mplayer -framedrop -fps 6000 -cache 512 -demuxer h264es -
```


-----------------------------------------------

#### Atualizar google play service manualmente
```bash
adb install -r -d -l [app name]
adb install -r -d -l com.google.android.gms-1-update-play-service-30.10.2018.apk

-r	A instalação de sobreposição é permitida.
-s	Instale o aplicativo para o sdcard.
-d	Permitir instalação de substituição degradada.
```
-----------------------------------------------

#### Modo de depuração do Firebase Analytics - [Abrir Doc](https://firebase.google.com/docs/analytics/debugview?hl=pt-br)
```bash
# Para ativar o modo de depuração do Firebase Analytics (RELEASE)
adb shell setprop debug.firebase.analytics.app [package]

# Para ativar o modo de depuração do Firebase Analytics (DEBUG)
adb shell setprop debug.firebase.analytics.app [package].debug

# Para desativar o modo de depuração
adb shell setprop debug.firebase.analytics.app .none.
```
-----------------------------------------------




#### Links

https://developer.android.com/studio/command-line

http://adbshell.com/commands/adb-shell-netstat

https://gist.github.com/otikev/95d0e163704367048b1d0efcefcc7151

https://www.androidjungles.com/adb-fastboot-commands
