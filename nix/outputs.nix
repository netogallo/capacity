{ repoRoot, inputs, pkgs, lib, system }:

let
    cabalProject = pkgs.haskell-nix.cabalProject' ({ pkgs, config, ... }:
    let
        name = "capacity";
    in
    {
        name = name;
        compiler-nix-name = "ghc8107";
        src = ../.;
        modules = [
        ];
        sha256map = {
            "https://github.com/input-output-hk/cardano-addresses"."b7273a5d3c21f1a003595ebf1e1f79c28cd72513" = "129r5kyiw10n2021bkdvnr270aiiwyq58h472d151ph0r7wpslgp";
            "https://github.com/input-output-hk/cardano-ledger"."da3e9ae10cf9ef0b805a046c84745f06643583c2" = "sha256-3VUZKkLu1R43GUk9IwgsGQ55O0rnu8NrCkFX9gqA4ck=";
            "https://github.com/input-output-hk/cardano-wallet"."18a931648550246695c790578d4a55ee2f10463e" = "0i40hp1mdbljjcj4pn3n6zahblkb2jmpm8l4wnb36bya1pzf66fx";
            "https://github.com/input-output-hk/marconi"."7285a3bc1ae53bf672c7cc2359210c6c29fbce44" = "sha256-Z1ex1CqsIDzhzE8tbHtFvK+V+W3Fn1me2tHL/D+HhUE=";
            "https://github.com/input-output-hk/plutus-apps"."1551e7b6d08b84bccbd5b4b5bdf1f7985eb6378f" = "sha256-aIAp1mwG+YPANTwa48GH7hDAABtPb3cDv9by9aZLDIE=";
            "https://gitlab.com/netogallo/qtah.git"."da061b7e1fe76f04d5ccda1c390c4c02796bcfe6" = "sha256-/RTTyqyF7ZsDW2G4mvmBEFWzzcGb6TAmLVDM7o67uJM=";
            "https://gitlab.com/netogallo/hoppy.git"."63588ad66262629445aa3cdf0229ba41a7886502" = "sha256-a04VJKcc06foEQxzIFoIUJZHBFJyiP6KuWjL/WubgFI=";
        };
    }
    );

    project = lib.iogx.mkHaskellProject {
        inherit cabalProject;
        shellArgs = repoRoot.nix.shell;
        readTheDocs = {
        enable = true;
        siteFolder = "doc";
        };
        combinedHaddock = {
            enable = true;
            packages = [
                "capacity-app"
            ];
            prologue = ''
            Capacity is a program to create, clean and improve multiple sequence
            alignment files.
            '';
        };
    };
in
[
    project
]