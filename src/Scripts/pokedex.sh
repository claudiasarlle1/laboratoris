#!/bin/bash

# Constantes
POKEDEX_FILE="pokedex.txt"

# Funciones
function pokedex_help() {
    echo "Uso: ./pokedex.sh <comando> <argumentos>"
    echo "Comandos:"
    echo "  help: Mostrar esta ayuda"
    echo "  list: Listar pokémon"
    echo "  search <nombre>: Buscar un pokémon"
    echo "  delete <nombre>: Eliminar un pokémon"
    echo "  new <nombre> <tipo> <hp> <ataque> <defensa> <velocidad>: Agregar un pokémon"
}
function pokedex_list() {
    if [[ ! -f "$POKEDEX_FILE" ]]; then
        echo "El archivo $POKEDEX_FILE no existe."
        return 1
    fi
    cat "$POKEDEX_FILE"
}
function pokedex_search() {
    if [[ -z "$1" ]]; then
        echo "Debes indicar el nombre del pokémon."
        echo "Uso: ./pokedex.sh search <nombre>"
        return 1
    fi
    if [[ ! -f "$POKEDEX_FILE" ]]; then
        echo "El archivo $POKEDEX_FILE no existe."
        return 1
    fi
    grep -i "$1" "$POKEDEX_FILE" || echo "Pokémon '$1' no encontrado."
}
function pokedex_delete() {
    if [[ -z "$1" ]]; then
        echo "Debes indicar el nombre del pokémon."
        echo "Uso: ./pokedex.sh delete <nombre>"
        return 1
    fi
    if [[ ! -f "$POKEDEX_FILE" ]]; then
        echo "El archivo $POKEDEX_FILE no existe."
        return 1
    fi
    sed -i "/$1/d" "$POKEDEX_FILE"
    echo "Pokémon '$1' eliminado de la pokédex."
}
function pokedex_new() {
    if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" || -z "$5" || -z "$6" ]]; then
        echo "Debes indicar el nombre, tipo, hp, ataque, defensa y velocidad del pokémon."
        echo "Uso: ./pokedex.sh new <nombre> <tipo> <hp> <ataque> <defensa> <velocidad>"
        return 1
    fi
    if [[ ! -f "$POKEDEX_FILE" ]]; then
        touch "$POKEDEX_FILE"
    fi
    echo "$1 $2 $3 $4 $5 $6" >> "$POKEDEX_FILE"
    echo "Pokémon '$1' agregado a la pokédex."
}


# Main
# Implementamos el menú
case $1 in
    help)
        pokedex_help
        ;;
    list)
        pokedex_list
        ;;
    search)
        pokedex_search "$2"
        ;;
    delete)
        pokedex_delete "$2"
        ;;
    new)
        pokedex_new "$2" "$3" "$4" "$5" "$6" "$7"
        ;;
    *)
        echo "Comando no encontrado."
        pokedex_help
        ;;
esac

exit 0
# Usamos exit 0 en vez de return ya que exit finaliza un script y return
# se utiliza dentro de funciones
