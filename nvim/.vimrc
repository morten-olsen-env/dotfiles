let configs = [
\  "init",
\  "plugins",
\  "general",
\  "keybindings",
\  "coc",
\  "which",
\  "pluginconfig"
\]
for file in configs
  let x = expand("~/.vim/".file.".vim")
  if filereadable(x)
    execute 'source' x
  endif
endfor
