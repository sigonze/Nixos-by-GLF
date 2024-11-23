{ pkgs, ... }:
{
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo'';
  };

  environment.systemPackages = with pkgs;[
    # APP
    discord
    freetube
    thunderbird-latest

    # Bureautique  
    # libreoffice-bin
    hunspell
    hunspellDicts.fr-moderne

    # Montage
    obs-studio
    kdePackages.kdenlive
    gimp
    inkscape
  ];
} 