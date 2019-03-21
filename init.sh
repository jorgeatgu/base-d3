#!/bin/bash

function initd3 {
    echo -n "\e[94m\e[1mVamos a lanzar base-d3 ¿ya has creado una carpeta? (s/n): "

    function launch {
        mkdir css src js img csv &&
        curl -O "https://raw.githubusercontent.com/jorgeatgu/base-d3/master/{.stylelintrc,.gitignore,.stylelintignore,.prettierrc.json,package.json,gulpfile.js,index.html,d3.min.js,rollup.config.js,index.js}" &&
        cd src &&
        mkdir css img js &&
        cd css &&
        curl -O "https://raw.githubusercontent.com/jorgeatgu/base/master/{_variables.css,styles.css}" &&
        cd ../js &&
        touch index.js &&
        cd .. &&
        cd .. &&
        git init &&
        git add . &&
        git commit -m 'initial commit | structure created' &&
        echo -e '\e[94m\e[1mEsto va a costar un poco' &&
        npm i &&
        echo -e '\e[94m\e[1mEl script ha terminado. Es hora de picar código! \U0001f913\n' &&
        afplay /System/Library/Sounds/Submarine.aiff &&
        say El script ha terminado. Es hora de picar código!
    }

    read -r answer
        if echo "$answer" | grep -iq "^s" ;
    then
        echo "Perfecto, vamos a comenzar con Base"
        launch;
    else
        echo -n "Elige el nombre de tu proyecto: "
        read -r var_name &&
        mkdir "$var_name" &&
        cd "$var_name" &&
        launch
    fi
}
