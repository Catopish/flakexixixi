{ config, pkgs,nixvim, ... }:

{
  imports=[
  # nixvim.homeManagerModules.nixvim
  ];
  home.username = "al";
  home.homeDirectory = "/home/al";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.lunarvim
    pkgs.nodejs_22
    pkgs.yarn

    pkgs.starship
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
programs.neovim.enable =true;

services.polybar={

  enable=true;
  config=./polybar/polybar.ini;
  # script=/home/al/.dotfiles/polybar/launch.sh;
  script=''
  polybar bar &
  '';
};

 ##kitty
programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 10;
      };
      shellIntegration.enableZshIntegration = true;
      theme = "Catppuccin-Mocha";
      #Also available: Catppuccin-Frappe Catppuccin-Latte Catppuccin-Macchiato Catppuccin-Mocha
      # See all available kitty themes at: https://github.com/kovidgoyal/kitty-themes/blob/46d9dfe230f315a6a0c62f4687f6b3da20fd05e4/themes.json
    };

programs.starship={
settings ={
  add_newline = false;
  format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
  shlvl = {
    disabled = false;
    symbol = "ﰬ";
    style = "bright-red bold";
  };
  shell = {
    disabled = false;
    format = "$indicator";
    fish_indicator = "";
    bash_indicator = "[BASH](bright-white) ";
    zsh_indicator = "[ZSH](bright-white) ";
  };
  username = {
    style_user = "bright-white bold";
    style_root = "bright-red bold";
  };
};
};
programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake .#al";
homeupdate = "home-manager switch --flake .#al ";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
};
oh-my-zsh = {
enable =true;
plugins = ["git"];
   };
   initExtra = ''
   eval "$(starship init zsh)"
   '';
  };



programs.zoxide={
enable=true;
enableZshIntegration=true;
};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/al/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
