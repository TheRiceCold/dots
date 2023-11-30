# Qemu/KVM with virt-manager
{ user, pkgs, ... }:
{
  boot.kernelModules = [ 
    "kvm-amd" # "kvm-intel" 
  ];

  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [ 
    virt-manager 
    spice-vdagent 
  ];

  services.spice-vdagentd.enable = true;
  systemd.user.services.spice-agent = { 
    enable = true;
    wantedBy = ["graphical-session.target"]; 
    serviceConfig = { ExecStart = "${pkgs.spice-vdagent}/bin/spice-vdagent -x"; }; 
    unitConfig = { ConditionVirtualization = "vm"; 
        Description = "Spice guest session agent"; 
        After = ["graphical-session-pre.target"];
        PartOf = ["graphical-session.target"];
    }; 
  };
}
