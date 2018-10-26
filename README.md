# base-d3

🚀 Repositorio base para iniciar cualquier proyecto con d3

La idea es similar a la de [base](https://github.com/jorgeatgu/base) pero en este caso incluyendo cambios para adaptarlo a un proyecto de visualización de datos.

Cambios: 

- Babel para usar algunas funcionales de ES6
- Terser para minificar y ofuscar el código.
- Por ahora me quedo con la v4.13.0 de d3.js. Próximamente a la v5

Ejemplos de gráficas hechas con d3 y que realmente son responsive: https://aclau-lmdietzfyt.now.sh

Repositorio con todos los ejemplos: [A clau](https://github.com/jorgeatgu/clau)

Inicializar todo con init.sh

Cambiar nombre en now.json para preparar los deploys con Zeit. Si el proyecto tiene un dominio propio hay que añadir el campo alias

```
"alias": [
    "tudominio.co"
],
```

Pequeño script con bash para lanzar deploys sin tener que lanzar ordenes

```
function nowDeploy () {
    npm run build:release &&
    now --static &&
    aliasNow=$(pbpaste)
    now alias ${aliasNow} $1
}
```
