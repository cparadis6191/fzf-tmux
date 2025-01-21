{ fzf, stdenv, tmux, ... }:

stdenv.mkDerivation {
  pname = "fzf-tmux";
  version = "0.0.1";

  src = ./.;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -D ./bin/_fzf_tmux_capture_pane_lines $out/bin/
    install -D ./bin/_fzf_tmux_capture_pane_words $out/bin/
    install -D ./bin/__fzf_tmux_fzf               $out/bin/

    install -D ./fzf-tmux.fish $out/share/${pname}/fzf-tmux.fish

    runHook postInstall
  '';

  outputs = [ "out" ];
}
