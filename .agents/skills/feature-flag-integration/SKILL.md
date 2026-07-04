---
name: feature-flag-integration
description: 'Add or update feature flags in this chezmoi dotfiles repo, including definition, machine enablement, and template gating. Use when asked to add flags like namespace::domain:type, wire template include/mustEnable logic, and verify changes without committing.'
argument-hint: 'Feature flag name and target template/file to gate'
---

# Feature Flag Integration (Chezmoi Dotfiles)

## What This Skill Produces
A consistent feature-flag rollout in this repo:
- Flag definition added in the correct definitions file.
- Flag enabled in machine settings when requested.
- Target template/file gated by feature flag helper templates.
- Verification evidence via search, diff, and diagnostics.

## When to Use
Use this workflow when the request includes:
- "add new featureFlag"
- "gate this config/template behind a flag"
- "enable/disable optional tool config"
- "wire mustEnable/include/includeOnly"

Do not use this skill for git commit/push/release tasks.

## Procedure
1. Discover current wiring.
- Search for existing feature flag conventions and helper usage.
- Confirm where definitions live (for this repo: `home/.chezmoidata/_base-definitions.*.yaml`).
- Confirm where machine defaults live (for this repo: `home/.chezmoidata/machine.darwin.yaml`).
- Confirm whether target file is currently unconditional.

2. Decide flag placement and behavior.
- If flag belongs to a domain group that already exists, append there.
- If no suitable domain file exists, create `home/.chezmoidata/_base-definitions.<domain>.yaml`.
- Decide whether default machine profile should enable the flag.

3. Implement definition.
- Add the key under `_base.definitions.featureFlags`.
- Follow naming convention: `<namespace>::<domain>:<type>`.
- Keep comments short and purpose-driven.

4. Implement machine enablement (if requested).
- Add the flag to `machine.<os>.settings.featureFlags` list.
- Keep ordering consistent with nearby entries.

5. Gate target template/config.
- For full-file gating: add `featureFlags/helpers/mustEnable` at top.
- For partial snippets: use `featureFlags/helpers/include` or `includeOnly`.
- Reuse patterns already present in repo templates.

6. Verify before completion.
- Check changed files in diff.
- Validate edited files with diagnostics.
- Confirm no unrelated changes were introduced.

## Decision Points
- Full file or snippet gating?
- Enable by default or definition-only?
- Existing definitions file or new domain definitions file?
- `mustEnable` vs `include` vs `includeOnly` based on target output shape.

## Completion Criteria
- New flag exists in definitions and is syntactically valid.
- Requested machine/profile enablement is present.
- Target config/template is actually controlled by the new flag.
- Diagnostics show no new file errors.
- Final summary includes changed paths and what each path now does.

## Example Prompts
- `/feature-flag-integration add flag ai::foo:enable for home/dot_foo/config.tmpl and enable on darwin`
- `/feature-flag-integration create flag dev::bar:config and gate only the tool-specific section`
- `/feature-flag-integration add a flag but do not enable it by default`
