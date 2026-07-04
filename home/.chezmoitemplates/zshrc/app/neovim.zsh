{{- $context := .context -}}
{{- if not (get . "disabled") }}
{{- $method := dig "method" "zinit" . }}
{{- if eq $method "zinit" }}

{{- includeTemplate "zshrc/helpers/h3" "Zinit Plugins - neovim" }}

## Setup nvim - vim alternative command
## https://github.com/neovim/neovim
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" nocompletions \
  from"gh-r" bpick"nvim-*.tar.gz" pick"nvim-*/bin/nvim" \
  atinit"
export EDITOR=nvim
export ZVM_VI_EDITOR=nvim"
zinit {{ get . "act" | default "light" }} neovim/neovim

{{- else if eq $method "mise" }}

{{- includeTemplate "zshrc/helpers/h3" "Neovim" }}

export EDITOR=nvim
export ZVM_VI_EDITOR=nvim

{{- end }}

## Setup vim alternative alias
alias v="nvim"

{{ end -}}
