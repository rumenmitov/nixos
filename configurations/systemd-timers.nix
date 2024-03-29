{ pkgs, ... }:

{
    systemd.timers = {
        "system-backup" = {
            wantedBy = [ "timers.target" ];
            timerConfig = {
                OnCalendar = "Sun 14:00:00";
                Persistent = true;
            };
        };
    };


    systemd.services = {
        "system-backup" = {
            script = ''
                ${pkgs.btrfs-progs}/bin/btrfs subvolume snapshot -r /home /snapshots/home-$(date +%s)
                '';
            serviceConfig = {
                Type = "oneshot";
                User = "root";
            };
        };
    };
}
