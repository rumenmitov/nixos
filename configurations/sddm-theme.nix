{ pkgs }:

let 

    background_img = pkgs.fetchurl {
        url = "https://cdn.wallpapersafari.com/24/68/sqyix8.jpg";
        sha256 = "1zl5nmzn1b5khhpasr4ya7zvcyig25c7h6gyfvavb46jgnk5jf7l";
    };

in
pkgs.stdenv.mkDerivation {
    name = "sugar-candy";

    src = builtins.fetchGit {
        url = "https://framagit.org/MarianArlt/sddm-sugar-candy.git";
        rev = "2b72ef6c6f720fe0ffde5ea5c7c48152e02f6c4f";
    };

    installPhase = ''
        mkdir -p $out
        cp -R ./* $out
        cd $out/Backgrounds
        rm Mountain.jpg
        cp -r ${background_img} $out/Backgrounds/Mountain.jpg
     '';
}
