ChangeConfSettings() {
    if [[ $inputsettings = "1" ]]; then
        stringchange="rename"
        if [[ $isConfisTrue = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue = false ]]; then
            if [[ $isRooted = false ]]; then
                clear
                whoMadeThis
                echo "${redColorBold}Sorry this only for Rooted device!${whiteColor}"
                echo ""
                echo -n "Press enter for back to Settings!"
                read -r
                settingsScript
                return
            fi
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "2" ]]; then
        stringchange="installcert"
        if [[ $isConfisTrue2 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue2 = false ]]; then
            if [[ $isRooted = false ]]; then
                clear
                whoMadeThis
                echo "${redColorBold}Sorry this only for Rooted device!${whiteColor}"
                echo ""
                echo -n "Press enter for back to Settings!"
                read -r
                settingsScript
                return
            fi
            clear
            whoMadeThis
            echo "${greenColorBold}Do you want to install Certificate as Root?${whiteColor}"
            echo "${yellowColorBold}i'm not take any responsibility if there is something wrong with your Phone"
            echo "or even can't delete for the certficate${whiteColor}"
            echo ""
            echo -n "Enter input (y/n) : "
            read -r installCert
            case $installCert in
                "y" | "Y" ) sleep 0.1s;;
                "n" | "N" ) UIMenu;;
                * ) echo "Wrong Input!"; sleep 1s; settingsScript;;
            esac
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "3" ]]; then
        stringchange="openGenshin"
        if [[ $isConfisTrue3 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue3 = false ]]; then
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "4" ]]; then
        stringchange="setProxy"
        if [[ $isConfisTrue4 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue4 = false ]]; then
            if [[ $isRooted = false ]]; then
                clear
                whoMadeThis
                echo "${redColorBold}Sorry this only for Rooted Device!${whiteColor}"
                echo ""
                echo -n "Press enter for back to Settings!"
                read -r
                settingsScript
                return
            fi
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "5" ]]; then
        clear
        whoMadeThis
        if [[ $isRooted = false ]]; then
            clear
            whoMadeThis
            echo "${redColorBold}Sorry this only for Rooted Device!${whiteColor}"
            echo ""
            echo -n "Press enter for back to Settings!"
            read -r
            settingsScript
            return
        fi
        echo "${cyanColorBold}1. Mode 1       ${whiteColor}3. ${yellowColorBold}Help"
        echo "${cyanColorBold}2. Mode 2       ${whiteColor}0. ${redColorBold}Back${whiteColor}"
        echo
        echo -n "Enter input : "
        read ChangeConfSettings_input
        case $ChangeConfSettings_input in
            "1" ) stringchange="reset"; changeFrom="2"; changeTo="1";;
            "2" ) stringchange="reset"; changeFrom="1"; changeTo="2";;
            "3" ) clear; whoMadeThis; echo -e "${cyanColorBold}1. Mode 1 ${whiteColor} :\n${yellowColorBold}No need to Restart phone for reset proxy\n${cyanColorBold}2. Mode 2 ${whiteColor} :\n${yellowColorBold}Need Restart after delete proxy\nthis not reset but delete for Proxy so need to Restart\n"; read -p "${whiteColor}Press enter for back"; ChangeConfSettings;;
            "0" ) settingsScript;;
            * ) echo "${redColorBold}Wrong input!${whiteColor}"; sleep 1s; ChangeConfSettings;;
        esac
    fi

    if [[ $isConfisTrue = err ]] || [[ $isConfisTrue2 = err ]] || [[ $isConfisTrue3 = err ]]; then
        echo "${redColorBold}Sorry there is Problem can't change the Settings.${whiteColor}"
        echo ""
        echo -n "Press enter for back to Settings!"
        read -r
        settingsScript
        return
    fi

    sed -i "s/$stringchange=$changeFrom/$stringchange=$changeTo/g" "$pathScript"
    settingsScript
}

changeSettings_list() {
    getSettingsConf=$(cat "$pathScript" | grep "rename" | sed "s/.*rename=//g")
    getSettingsConf2=$(cat "$pathScript" | grep "installcert" | sed "s/.*installcert=//g")
    getSettingsConf3=$(cat "$pathScript" | grep "openGenshin" | sed "s/.*openGenshin=//g")
    getSettingsConf4=$(cat "$pathScript" | grep "setProxy" | sed "s/.*setProxy=//g")
    getSettingsConf5=$(cat "$pathScript" | grep "reset" | sed "s/.*reset=//g")

    if [[ $getSettingsConf = true ]]; then
        renameconf="${greenColorBold}ON${whiteColor}"
        isConfisTrue=true
    elif [[ $getSettingsConf = false ]]; then
        renameconf="${redColorBold}OFF${whiteColor}"
        isConfisTrue=false
    elif [[ $getSettingsConf != true ]] || [[ $getSettingsConf != false ]]; then
        isConfisTrue=err
    fi

    if [[ $getSettingsConf2 = true ]]; then
        installcertconf="${greenColorBold}ON${whiteColor}"
        isConfisTrue2=true
    elif [[ $getSettingsConf2 = false ]]; then
        installcertconf="${redColorBold}OFF${whiteColor}"
        isConfisTrue2=false
    elif [[ $getSettingsConf2 != true ]] || [[ $getSettingsConf2 != false ]]; then
        isConfisTrue2=err
    fi

    if [[ $getSettingsConf3 = true ]]; then
        openGenshinConf="${greenColorBold}ON${whiteColor}"
        isConfisTrue3=true
    elif [[ $getSettingsConf3 = false ]]; then
        openGenshinConf="${redColorBold}OFF${whiteColor}"
        isConfisTrue3=false
    elif [[ $getSettingsConf3 != true ]] || [[ $getSettingsConf3 != false ]]; then
        isConfisTrue3=err
    fi

    if [[ $getSettingsConf4 = true ]]; then
        setProxyConf="${greenColorBold}ON${whiteColor}"
        isConfisTrue4=true
    elif [[ $getSettingsConf4 = false ]]; then
        setProxyConf="${redColorBold}OFF${whiteColor}"
        isConfisTrue4=false
    elif [[ $getSettingsConf4 != true ]] || [[ $getSettingsConf4 != false ]]; then
        isConfisTrue4=err
    fi

    if [[ $getSettingsConf5 = 1 ]]; then
        resetProxyConf="${greenColorBold}MODE 1${whiteColor}"
        isConfisErr=false
    elif [[ $getSettingsConf5 = 2 ]]; then
        resetProxyConf="${greenColorBold}MODE 2${whiteColor}"
        isConfisErr=false
    elif [[ $getSettingsConf5 != 1 ]] || [[ $getSettingsConf5 != 2 ]]; then
        isConfisErr=true
    fi

    if [[ $isConfisTrue = err ]] || [[ $isConfisTrue2 = err ]] || [[ $isConfisTrue3 = err ]] || [[ $isConfisTrue4 = err ]] || [[ $isConfisErr = true ]]; then
        rm "$pathScript"
        echo -e -n "# Script made by ElaXan\n# This for Settings Feature. Delete this if have problem on change Settings or you can edit Manual\ninstallcert=false\nrename=false\nopenGenshin=false\nsetProxy=false\nreset=1" > "$pathScript"
        settingsScript
    fi
}