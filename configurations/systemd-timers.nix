{ pkgs, ... }:

{
    systemd.timers."system-backup" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
            OnCalendar = "Sun 14:00:00";
            Persistent = true;
        };
    };

    systemd.services."system-backup" = {
        script = ''
            set -eu
            ${pkgs.btrfs-progs}/bin/btrfs set /snapshots/home-latest ro false
            rm -rf /snapshot/home-latest
            ${pkgs.btrfs-progs}/bin/btrfs subvolume snapshot -r /home /snapshots/home-latest
            '';
        serviceConfig = {
            Type = "oneshot";
            User = "root";
        };
    };
}
