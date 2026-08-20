# codex-setup

Personal global instructions and skills for Codex.

The Home Manager module installs:

- `AGENTS.md` as `~/.codex/AGENTS.md`.
- `skills` as `~/.agents/skills`.

Codex reads global instructions from `~/.codex/AGENTS.md`, loads user skills
from `~/.agents/skills`, and follows symlinked skill directories. See the
official documentation for [AGENTS.md][agents-docs] and [skills][skills-docs].

## Home Manager

Add the flake input:

```nix
inputs.codex-setup.url = "github:chernousov-m/codex-setup";
```

Import and enable the module:

```nix
{
  imports = [ inputs.codex-setup.homeModules.default ];

  programs.codexSetup.enable = true;
}
```

By default, Home Manager installs an immutable copy from the Nix store. For a
local checkout that should update without rebuilding, use an absolute path:

```nix
programs.codexSetup = {
  enable = true;
  mutableSourceDirectory = "/Users/me/Projects/codex-setup";
};
```

Restart Codex if a newly added skill does not appear automatically.

[agents-docs]: https://developers.openai.com/codex/guides/agents-md
[skills-docs]: https://developers.openai.com/codex/skills
