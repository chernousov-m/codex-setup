Use very concise sentences when reporting of what you do and what you'll do next.
Always answer in english unless explicitly asked otherwise.
Always keep documentation up-to-date.
Always write test code before logic code.
Enumerate files when using `git add`, don't `git add .` or `git commit -a`

If the project is released, you need to keep backward compatibility for updates. That includes API contract and Database Migrations.
If not released yet, amend migration files directly, no need for additional migrations to alter table and so on.
If not stated in Readme, assume released

Use devShells defined in ~/Projects/Nix to get the dev environment you need, unless the project provides its own flake. If there is none, or something's missing, add it there instead of installing it on the system. Stage files with --intent-to-add if staging is required to build/check flake

If your work affects UI, send resulting UI (and initial if the changes are substantial) after you're done

!!! You don't need to *add* tests when you *remove* functionality !!!

## Golang based projects

use Cobra for CLI
use Viper for configuration, include config.example.yml as configuration documentation
golang-migrate for database migrations at the start of app, no \*.down migrations
SQLite as a default database choice, unless it's evident that the project will outscale SQLite
sqlc for typesafe sql layer, don't need a separate schema files if migration files are enough. no inline SQL unless it's truly needed
use go-i18n for localizing user-facing texts. Only if need i18n

## Nix

`nix`-prefixed commands always require approval as they hit the directories outside the sandbox.
When project provides a flake don't assume that anything is installed on the machine. All tools that you need during development and testing belong in the flake. Use it and update if necessary.
Checks only in Nix flakes that actually build some code. Only run actual tests in checks. No checks for the flake contents itself
