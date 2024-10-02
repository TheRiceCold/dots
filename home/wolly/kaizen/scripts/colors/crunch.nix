pkgs: ansi:
pkgs.writeShellScriptBin "crunch" ''

  ${ansi}
  cat << EOF
   $reset$redf  ██  ██   $reset$boldon$redf██    $reset$greenf  ██  ██   $reset$boldon$greenf██    $reset$yellowf  ██  ██   $reset$boldon$yellowf██    $reset$bluef  ██  ██   $reset$boldon$bluef██    $reset$purplef  ██  ██   $reset$boldon$purplef██    $reset$cyanf  ██  ██   $reset$boldon$cyanf██
   $reset$redf██████████ $reset$boldon$redf██    $reset$greenf██████████ $reset$boldon$greenf██    $reset$yellowf██████████ $reset$boldon$yellowf██    $reset$bluef██████████ $reset$boldon$bluef██    $reset$purplef██████████ $reset$boldon$purplef██    $reset$cyanf██████████ $reset$boldon$cyanf██
   $reset$redf  ██  ██   $reset$boldon$redf██    $reset$greenf  ██  ██   $reset$boldon$greenf██    $reset$yellowf  ██  ██   $reset$boldon$yellowf██    $reset$bluef  ██  ██   $reset$boldon$bluef██    $reset$purplef  ██  ██   $reset$boldon$purplef██    $reset$cyanf  ██  ██   $reset$boldon$cyanf██
   $reset$redf██████████       $reset$greenf██████████       $reset$yellowf██████████       $reset$bluef██████████       $reset$purplef██████████       $reset$cyanf██████████
   $reset$redf  ██  ██   $reset$boldon$redf██    $reset$greenf  ██  ██   $reset$boldon$greenf██    $reset$yellowf  ██  ██   $reset$boldon$yellowf██    $reset$bluef  ██  ██   $reset$boldon$bluef██    $reset$purplef  ██  ██   $reset$boldon$purplef██    $reset$cyanf  ██  ██   $reset$boldon$cyanf██ 
   $reset
  EOF

''
