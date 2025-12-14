{ config, pkgs, ... }:

{
  services.comin = {
    enable = true;
    repository = "github:itDaru/core";
    path = "/home/user/Dev/core/systems/nix/n480s";
    revision = "main";
    
    # SSH Deploy Key
    # You will need to generate a new SSH key for this to work
    # ssh-keygen -t ed25519 -f ~/.ssh/comin_key
    # And add the public key to your repository's deploy keys.
    # The private key should be stored in a secure location and 
    # the path should be updated below.
    
    sshKey = "/home/user/.ssh/id_ed25519.pub";
  };
}
