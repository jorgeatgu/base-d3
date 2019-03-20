# base-d3

🚀 Repositorio base para iniciar cualquier proyecto con d3

La idea es similar a la de [base](https://github.com/jorgeatgu/base) pero en este caso incluyendo cambios para adaptarlo a un proyecto de visualización de datos.

Cambios:

- Babel para usar algunas funcionalidades de ES6.
- Terser para minificar y ofuscar el código.
- Me paso al sistema de modulos que se implemento en la d3v4. Pero con los módulos de la v5

Para crear el bundle necesitamos rollup. Una vez creado usamos uglify para minificar el código.

La configuración para rollup, en entry le indicamos el archivo que contendra todos los módulos que queremos incluir en el bundle. En dest la ruta donde generar el bundle.

Así quedaría el archivo `rollup.config.js`

```
import node from "rollup-plugin-node-resolve";

export default {
  entry: "index.js",
  format: "umd",
  moduleName: "d3",
  plugins: [node()],
  dest: "d3.js"
};
```

El index.js con los módulos que necesitamos

```
export {
    select,
    selectAll
} from "d3-selection";

export {
    area
} from "d3-shape";

export {
    scaleTime,
    scaleLinear
} from "d3-scale";

export {
    axisBottom,
    axisLeft
} from "d3-axis";

export {
    csv
} from "d3-request";

export {
    easeLinear
} from "d3-ease";

export {
    format
} from "d3-format";

import "d3-transition";
```

Todos estos módulos los tenemos que instalar como paquetes de npm.

Ahora lanzaremos con npm el ```build:d3``` que primero creara un bundle y a continuación uglify se encargara de minificar el código y servirlo en la carpeta de js.

```
"build:d3": "rollup -c && uglifyjs d3.js -c -m -o js/d3.min.js"
```

El bundle para hacer la gráfica de area ocupa 84kb. El tamaño de la v4.11.0 de d3 es de 220kb. La diferencia es bastante notable.

Ejemplos de gráficas hechas con d3 y que realmente son responsive: https://aclau-pqh2g6xts.now.sh

Repositorio con todos los ejemplos: [A clau](https://github.com/jorgeatgu/clau)

Inicializar todo con init.sh

Cambiar nombre en now.json para preparar los deploys con ZEIT. Si el proyecto tiene un dominio propio hay que añadir el campo alias.
