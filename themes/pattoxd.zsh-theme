# Define el prompt principal
PROMPT='$(git_user_info)'

# Define el prompt a la derecha (RPROMPT)
RPROMPT='$(branch)'

# Configuración de los prompt para git
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="💩"
ZSH_THEME_GIT_PROMPT_CLEAN="✨"

# Función para obtener el nombre de usuario y correo de git
git_user_info() {
    local user_name="$(git config --get user.name)"
    local user_email="$(git config --get user.email)"

    # Si no hay información de usuario de git, no mostrar nada
    if [ -z "$user_name" ] && [ -z "$user_email" ]; then
        echo "%{$fg[cyan]%}[%c]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b"
    fi

    # Si hay información de usuario de git
    if [ -n "$user_name" ]; then
        echo -n "%F{cyan}$user_name%f"
    fi

    if [ -n "$user_email" ]; then
        echo -n " (%F{magenta}$user_email%f)"
    fi

    if [ -n "$user_name" ] || [ -n "$user_email" ]; then
        echo "
%{$fg[cyan]%}[%c]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b"
    fi
}

# Función para mostrar el nombre de la rama de git
branch() {
    echo "%(?.%{$fg[green]%}.%{$fg[red]%})$(git_prompt_info)%f"
}
