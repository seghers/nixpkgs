{ pkgs, ... }:

{
  imports = [ ./sd-image-aarch64.nix ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # When running from USB device without SD card present, kernel spams log about missing SD card, workaround for this is to set:
  boot.loader.raspberryPi.firmwareConfig = "dtparam=sd_poll_once=on";

  environment.systemPackages = with pkgs; [ git neovim cryptsetup rsync silver-searcher raspberrypi-eeprom ];

  nix = {
      package = pkgs.nixUnstable;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
  };

  console = {
    colors = [
      "f8f8f8"
      "a60000"
      "005e00"
      "813e00"
      "0031a9"
      "721045"
      "00538b"
      "282828"
      "ffffff"
      "972500"
      "315b00"
      "70480f"
      "2544bb"
      "8f0075"
      "30517f"
      "000000"
    ];
    font = "Lat2-Terminus16";
    # keyMap = "us";
    keyMap = "colemak/colemak";
  };

  i18n = {
    defaultLocale = "en_IE.UTF-8";
    # defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "en_GB.UTF-8";
    };
  };
}
