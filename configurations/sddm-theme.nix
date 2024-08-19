{ pkgs }:
pkgs.stdenv.mkDerivation {
    name = "sugar-candy";

    src = builtins.fetchGit {
        url = "https://github.com/rumenmitov/sddm-sugar-candy.git";
        rev = "5e25d56d8a9ed51f81210c9f22bfd6d5e0760c25";
    };

    installPhase = ''
        mkdir -p $out
        cp -R ./* $out
     '';
}
