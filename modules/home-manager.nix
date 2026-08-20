{
  config,
  lib,
  ...
}:

let
  cfg = config.programs.codexSetup;
  mutable = cfg.mutableSourceDirectory != null;

  agentsSource =
    if mutable then
      config.lib.file.mkOutOfStoreSymlink "${cfg.mutableSourceDirectory}/AGENTS.md"
    else
      ../AGENTS.md;

  skillsSource =
    if mutable then
      config.lib.file.mkOutOfStoreSymlink "${cfg.mutableSourceDirectory}/skills"
    else
      ../skills;
in
{
  options.programs.codexSetup = {
    enable = lib.mkEnableOption "personal Codex instructions and skills";

    mutableSourceDirectory = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      example = "/Users/me/Projects/codex-setup";
      description = ''
        Absolute path to a mutable codex-setup checkout. When unset, Home
        Manager installs immutable files from the flake input.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.file.".codex/AGENTS.md".source = agentsSource;
    home.file.".agents/skills".source = skillsSource;
  };
}
