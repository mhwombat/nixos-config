{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python3Env = python3.withPackages (ps: with ps; [
      csvkit
      jupyterlab
      matplotlib
      numpy
      pandas
      pandocfilters
      pygraphviz
      pylint
      scikitlearn
    ]);
  };
}
