pkgs: ansi:
pkgs.writeShellScriptBin "tanks" ''

  ${ansi}

  cat << EOF

    $boldon$redf    █    $reset    $boldon$greenf    █    $reset    $boldon$yellowf    █    $reset    $boldon$bluef    █    $reset    $boldon$purplef    █    $reset    $boldon$cyanf    █    $reset
    $boldon$redf▄▄  █  ▄▄$reset    $boldon$greenf▄▄  █  ▄▄$reset    $boldon$yellowf▄▄  █  ▄▄$reset    $boldon$bluef▄▄  █  ▄▄$reset    $boldon$purplef▄▄  █  ▄▄$reset    $boldon$cyanf▄▄  █  ▄▄$reset
    $boldon$redf███▀▀▀███$reset    $boldon$greenf███▀▀▀███$reset    $boldon$yellowf███▀▀▀███$reset    $boldon$bluef███▀▀▀███$reset    $boldon$purplef███▀▀▀███$reset    $boldon$cyanf███▀▀▀███$reset
    $boldon$redf███ █ ███$reset    $boldon$greenf███ █ ███$reset    $boldon$yellowf███ █ ███$reset    $boldon$bluef███ █ ███$reset    $boldon$purplef███ █ ███$reset    $boldon$cyanf███ █ ███$reset
    $boldon$redf██ ▀▀▀ ██$reset    $boldon$greenf██ ▀▀▀ ██$reset    $boldon$yellowf██ ▀▀▀ ██$reset    $boldon$bluef██ ▀▀▀ ██$reset    $boldon$purplef██ ▀▀▀ ██$reset    $boldon$cyanf██ ▀▀▀ ██$reset

    $redf    █    $reset    $greenf    █    $reset    $yellowf    █    $reset    $bluef    █    $reset    $purplef    █    $reset    $cyanf    █    $reset
    $redf▄▄  █  ▄▄$reset    $greenf▄▄  █  ▄▄$reset    $yellowf▄▄  █  ▄▄$reset    $bluef▄▄  █  ▄▄$reset    $purplef▄▄  █  ▄▄$reset    $cyanf▄▄  █  ▄▄$reset
    $redf███▀▀▀███$reset    $greenf███▀▀▀███$reset    $yellowf███▀▀▀███$reset    $bluef███▀▀▀███$reset    $purplef███▀▀▀███$reset    $cyanf███▀▀▀███$reset
    $redf███ █ ███$reset    $greenf███ █ ███$reset    $yellowf███ █ ███$reset    $bluef███ █ ███$reset    $purplef███ █ ███$reset    $cyanf███ █ ███$reset
    $redf██ ▀▀▀ ██$reset    $greenf██ ▀▀▀ ██$reset    $yellowf██ ▀▀▀ ██$reset    $bluef██ ▀▀▀ ██$reset    $purplef██ ▀▀▀ ██$reset    $cyanf██ ▀▀▀ ██$reset
  EOF
  echo ""

''
