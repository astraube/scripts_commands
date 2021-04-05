> ## Comandos úteis para Android
> Compilado por [Andrè Straube](www.andrestraube.com.br)



* Estou fazendo uma compilação dos comandos ADB Android que julgo mais úteis.
* Fique a vontade para melhorias
* Próximo passo será organizar por categorias
* Desconsiderar erros de portugues e desorganização :)


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
`adb shell svc wifi disable [enable]`

##### Get device Android Id
`adb shell settings get secure android_id`

##### enviar comando por content provider
`adb shell content call --uri content://[package app].Commands --method sendGeoTest`


## Alterar Configuracoes Globais
 * Para descobrir novas configurações basta abrir o ADB DEBUG e procurar eventos do tipo `call_put(...)`

###### ativar GPS (alta precisão)
`adb shell settings put secure location_providers_allowed gps,network`
`adb shell settings put secure location_providers_allowed '+gps,network'`
`adb shell settings put secure location_providers_allowed -gps,network`

###### tempo de desligamento da tela
`adb shell settings put system screen_off_timeout -1`

###### instalacao de aplicativos de fontes desconhecidas (0 off | 1 on)
`adb shell settings put global install_non_market_apps 0`
`adb shell settings put global install_non_market_apps 1`


###### instalacao de aplicativos de fontes desconhecidas (Android mais recente)
`adb shell settings put secure install_non_market_apps 1`

###### Seguranca - Nenhum Bloqueio de Tela
`adb shell settings put global voice_unlock_screen null`
`adb shell settings put global voice_unlock_and_launch1 null`
`adb shell settings put global voice_unlock_and_launch2 null`
`adb shell settings put global voice_unlock_and_launch3 null`

###### Permanecer Ativo enquanto estiver carregando
`adb shell settings put global stay_on_while_plugged_in 0`
`adb shell settings put global stay_on_while_plugged_in 3`

###### Modo avião  (0 off | 1 on)
`adb shell settings put global airplane_mode_on 1`
`adb shell settings put global airplane_mode_on 0`

-----------------------------------------------
###### Parar Processos
```bash
pc $ adb -d shell
android $ su
android # ps
android # kill <process id from ps output>
```

###### Parar APP
`adb shell stop [package app]`

###### Forçar parada do APP
`adb shell am force-stop [package app]`

###### broadcast-boot-completed
`adb shell am broadcast -a android.intent.action.BOOT_COMPLETED`
-----------------------------------------------

###### Show process activity in real time
`adb shell top`
###### Show process activity in real time (Show threads)
`adb shell top -H`
###### Show process activity in real time (Show threads by PID)
`adb shell top -H -p 6677`

###### listar processos
`adb shell ps -A`

###### ler link
`adb shell readlink /proc/self/exe`
`adb shell readlink /proc/self/exe`
`adb shell readlink /proc/self/cwd`

###### listar packages
`adb shell pm list packages -f`

###### apagar arquivos de cache para alcançar o espaço livre fornecido
`adb shell pm trim-caches`

###### Limpar preferências compartilhadas do APP
`adb shell pm clear [package app]`

###### mantenha os diretórios de dados e cache disponíveis após a remoção do pacote.
`adb shell pm uninstall -k [package app]`

###### desistalar um APP por package
`adb shell pm uninstall [package app]`

###### recuperar PATH absoluto de um package
`adb shell pm list packages -f [package app]`

-----------------------------------------------

#### Simulação de Botão Pressionado

###### press-menu-button
`adb shell input keyevent 82`

###### botão de liga/desliga tela
`adb shell input keyevent 26`

###### Botão de voltar
`adb shell input keyevent 26`
-----------------------------------------------

#### copy databases
```bash
adb shell run-as [package app] chmod 666 /data/app/[package app]/databases/[dbname.db]
adb pull /data/data/[package app]/databases/[dbname.db]
```
-----------------------------------------------

#### Resolução do dispositivo
http://www.wikihow.com/Change-the-Screen-Resolution-on-Your-Android

`adb shell dumpsys display | grep mBaseDisplayInfo`

###### Encontre o valor da densidade

`adb shell wm density <NEW DENSITY> && adb reboot`

###### Obter tamanho físico da tela
`adb shell wm size`

-----------------------------------------------

#### Tirar um print da tela
```bash
adb shell screencap /sdcard/screen.png

# Copiar print para o computador
adb pull /sdcard/screen.png screen.png
```
-----------------------------------------------

#### Video da tela
```bash
adb shell screenrecord /sdcard/demo.mp4 <press Ctrl-C to stop recording>
adb pull /sdcard/demo.mp4
adb shell screenrecord --bit-rate 7000000 /sdcard/demo.mp4 <7Mbps>
adb shell screenrecord --size <WIDTHxHEIGHT>
adb shell screenrecord --time-limit <TIME max 180 seconds>

# copiar o vídeo para o computador
adb pull /sdcard/demo.mp4
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

###### Verifique a versão do aplicativo (comandos grep funcionam apenas no linux)
`adb shell dumpsys package <PACKAGE> | grep versionName`




#### Links

https://developer.android.com/studio/command-line

http://adbshell.com/commands/adb-shell-netstat

https://gist.github.com/otikev/95d0e163704367048b1d0efcefcc7151

https://www.androidjungles.com/adb-fastboot-commands