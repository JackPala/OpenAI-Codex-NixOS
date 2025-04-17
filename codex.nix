# Basic Starter Place
{ pkgs, ... }:

let
  # 1) Node.js LTS + npm
  nodejs = pkgs.nodejs;               # Node.js LTS alias
  npm    = pkgs.nodePackages.npm;     # npm CLI

  # 2) Fetch the Codex repo
  codexRepo = pkgs.fetchFromGitHub {
    owner  = "openai";
    repo   = "codex";
    rev    = "refs/heads/main";
    sha256 = "AnxbfkYEuIljqvGL+bPgADuAKb0SIrrb1lJPZIsQcyg=";
  };

  # 3) Build the CLI from codex-cli/
  codex-cli = pkgs.buildNpmPackage rec {
    pname   = "codex-cli";
    version = "unstable";

    # point at the subfolder containing package.json
    src = "${codexRepo}/codex-cli";

    buildInputs   = [ nodejs npm ];

    # this exact hash fixed the npm‑deps mismatch error you saw
    npmDepsHash = "sha256-Upq467farJjMcbpswqz2U40RXbA8APq145Z0pgaSzgs=";
  };
in
{
  environment.systemPackages = with pkgs; [
    nodejs     # the runtime
    npm        # the CLI
    codex-cli  # makes `codex` available globally
  ];
}
