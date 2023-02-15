# polkacli completion script

_polkacli_subcommands()
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local commands="install service rpc shots dot config"
  COMPREPLY=($(compgen -W "${commands}" -- ${cur}))
  return 0
}

complete -F _polkacli_subcommands polkacli
