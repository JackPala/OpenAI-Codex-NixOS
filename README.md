# OpenAI-Codex-NixOS
OpenAI Codex on Nixos and Nix. Currently this is only tested on 64bit Linux NixOS and not on ARM or Darwin. If it fails on either please open a ticket and I will help wrestle with it.

## What works
1. Codex seems to run and function as intended
2. The API key seems to ingest properly
3. All required NPM dependencies

## What needs work
1. Nix Darwin MacOS testing
2. NixOS ARM testing
3. Creation of a full fledged NixOS package that can be easily imported without handling the entire codex.nix in this repo manually
4. Smoother SHA versioned update support (This may break with future updates, if it does, please open a ticket and I will try my best to fix)
5. Documentation for NixOS secret management for systemwide API key storage safely without declaring it in plaintext (Useful for version controlled Nix environments on large production servers)

## Installation
1. Download the `codex.nix` into your nixOS `.nix` configuration directory of choice
2. Import the `codex.nix` into your `configuration.nix`
3. Set your API key

## Setting your API Key
There are two methods of setting your API key, the first one is using the official Codex method which is at the time of writing

```
export OPENAI_API_KEY="your-api-key-here"
```

The second method is by defining declaritively systemwide using NixOS, there may be better secrets management for safer storage, but the absolute simplest method for testing is 

```
  environment.sessionVariables = {
    OPENAI_API_KEY = "KEY-GOES-HERE";
  };
}
```
