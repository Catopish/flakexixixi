{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "al";
  home.homeDirectory = "/home/al";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.lunarvim
    pkgs.nodejs_22
    pkgs.yarn
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
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

#services.polybar={
#enable=true;
#config={
#"bar/top" = {
#    monitor = "\${env:MONITOR:eDP1}";
#    width = "100%";
#    height = "3%";
#    radius = 0;
#    modules-center = "date";
#  };
#
#  "module/date" = {
#    type = "internal/date";
#    internal = 5;
#    date = "%d.%m.%y";
#    time = "%H:%M";
#    label = "%time%  %date%";
#  };
#  script=./polybar/startpolybar.sh;
# };
#};
 #home.file.".config/polybar/pipewire.sh" = {
 #   source = pkgs.polybar-pipewire;
 #   executable = true;
 # };
 # services.polybar = mkIf withGUI {
 #   enable = true;
 #   package = pkgs.polybarFull;
 #   config = pkgs.substituteAll {
 #     src = ./polybar-config;
 #     interface = networkInterface;
 #   };
 #   script = ''
 #     for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
 #       MONITOR=$m polybar nord &
 #     done
 #   '';
 # };

#kitty
programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 10;
      };
      shellIntegration.enableZshIntegration = true;
      theme = "Catppuccin-Macchiato";
      #Also available: Catppuccin-Frappe Catppuccin-Latte Catppuccin-Macchiato Catppuccin-Mocha
      # See all available kitty themes at: https://github.com/kovidgoyal/kitty-themes/blob/46d9dfe230f315a6a0c62f4687f6b3da20fd05e4/themes.json
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
theme ="agnoster";
   };
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
