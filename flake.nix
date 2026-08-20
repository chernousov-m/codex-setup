{
  description = "Personal Codex instructions and skills with a Home Manager module";

  outputs =
    { self }:
    {
      homeModules.default = import ./modules/home-manager.nix;
    };
}
