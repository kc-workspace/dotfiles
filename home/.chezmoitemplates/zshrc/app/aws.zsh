{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "AWS CLI" }}

## Setup aws completions
if command -v mise >/dev/null && command -v aws_completer >/dev/null; then
  autoload bashcompinit && bashcompinit && zicompinit
  complete -C aws_completer aws
fi

## Setup aws aliases
alias asl="aws sso login"
alias awsp="aws --cli-auto-prompt"

{{ end -}}
