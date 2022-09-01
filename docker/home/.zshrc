# These settings will be copied into the end of an existing ZSHRC

export PROMPT="🐳>${CTX_ICON:-|} ${CTX_NAME:--}%(?:%{%}➜ :%{%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)"
