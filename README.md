## Proyecto 2: Expresiones aritméticas

**Entrega completa: Jueves 27 de abril de 2023**

*El proyecto podrá realizasrse en equipos de máximo 3 integrantes*

### Instrucciones

1. La carpeta [src](src) contiene la implementación del intérprete de **MiniLisp (Versión 1)** vista en clase, en ella
   encontrarás los siguientes archivos: 

   - `Grammars.y` Archivo con la gramática del lenguaje, la definición del tipo `Token`, la definición de la función
     `lexer` y la especificación del tipo `ASA`. Este archivo es la entrada del generador de analizadores sintácticos
     **Happy**.

   - `Interp.hs` Archivo con la especificación de la semántica del lenguaje vista en clase.

   - `MiniLisp.hs` Archivo con la integración de los distintos tipos de análisis para generar el intérprete completo de
     **MiniLisp (Versión 1)**.

   El primer ejercicio consiste en que revises estos archivos y hagas pruebas con los mismos. Indica al profesor si 
   tienes alguna duda con alguna de las funciones y/o archivos.

   ```bash
   > happy Grammars.y
   > ghci MiniLisp.hs
   GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
   [1 of 3] Compiling Grammars         ( Grammars.hs, interpreted )
   [2 of 3] Compiling Interp           ( Interp.hs, interpreted )
   [3 of 3] Compiling MiniLisp         ( MiniLisp.hs, interpreted )
   Ok, three modules loaded.
   *MiniLisp> run
   Mini-Lisp v1.0. Bienvenidx.
   > (+ 1 2)
   3
   > (* (- 3 5) (/ 10 2))
   -10
   ```

1. Modificaremos la gramática del lenguaje para que tenga más funcionalidades. La siguiente gramática usando EBNF 
   muestra estos cambios.

   ```
   <expr> ::= <num>
            | <bool>
            | (+ <expr> <expr>+)
            | (- <expr> <expr>+)
            | (* <expr> <expr>+)
            | (/ <expr> <expr>+)
            | (not <expr>)
            | (and <expr> <expr>+)
            | (or <expr> <expr>+)
            | (= <expr> <expr>+)
            | (< <expr> <expr>+)
            | (> <expr> <expr>+)
            | (<= <expr> <expr>+)
            | (>= <expr> <expr>+)
            | (/= <expr> <expr>+)

   <num> ::= 1 | 2 | 3 | ...

   <bool> ::= #t | #f
   ```

   El segundo ejercicio consiste en:

   1. Modificar la gramática de **Happy** incluida en el archivo `Grammars.y` para que reconozca este nuevo lenguaje.
   1. Modificar el tipo `Token` para que reconozca los nuevos lexemas que se añadieron.
   1. Modificar la definición de la función `lexer` para que reconozca estos nuevos lexemas.
   1. Modificar la definición del tipo `ASA` para que reconozca los nuevos árboles de sintaxis abstracta.

   ```bash
   > parse (lexer "1729")
   Num 1729
   > parse (lexer "#t")
   Bool True
   > parse (lexer "(+ 1 2 3)")
   Op "+" [Num 1, Num 2, Num 3]
   ```

   **Entrega: Jueves 20 de abril durante la clase**


1. A partir de los análisis léxico y sintáctico definidos en el ejercicio anterior, modifica la función `interp` 
   contenida en el achivo `Interp.hs` añadiendo el comportamiento de los nuevos constructores:

   - **Números**. Al interpretar un número se obtiene el mismo número.

      ```bash
      > interp (Num 1729)
      1729
      ```

   - **Bool**. Al interpretar un valor booleano se obtiene el mismo booleano.

      ```bash
      > interp (Bool True)
      True
      ```

   - **Operaciones aritméticas y lógicas**. Se deben realizar de manera encadenada (de dos en dos) hasta obtener el
     resultado final.

     ```bash
      > interp (Op "+" [Num 1, Num 2, Num 3])
      6
      ```

   **Entrega: Jueves 27 de abril durante la clase**


### Restricciones

- La hora máxima de entrega será a las **23:59:59** de la fecha indicada al inicio de este documento.

- Para poder pedir una prórroga sobre la entrega es requisito **indispensable** que todos los equipos de estudiantes
  hagan cambios (*commit*) constantes a su repositorio a lo largo del periodo de realización de la práctica.

- **Todas las copias serán calificadas automáticamente con cero**.
