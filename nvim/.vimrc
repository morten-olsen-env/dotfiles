let configs = [
\  "init",
\  "general",
\  "ui",
\  "commands",
\  "plugins",
\  "plugin-settings",
\]
for file in configs
  let x = expand("~/.vim/".file.".vim")
  if filereadable(x)
    execute 'source' x
  endif
endfor
