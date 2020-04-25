let configs = [
\  "init",
\  "general",
\  "keybindings",
\  "plugins",
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
