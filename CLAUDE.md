# ASWF workbench

This is a **multi-repo workspace**, not an application. The root is its own git repo (mani config + helper resources only);
the ASWF repos listed in `mani.yaml` are cloned into subfolders and are gitignored here. Each is an independent git repo.

- Before any git operation run `git rev-parse --show-toplevel` and make sure you are in the intended repo, not the workspace root.
- Repos, descriptions and URLs: `mani.yaml` (`mani list projects`). Not all of them are necessarily cloned.
- Platform is Windows; task commands run through bash, but build tools (cmake, Visual Studio) are Windows-native.
- `tmp/` is scratch space (contents ignored by git).

## Deterministic commands: use mani, not ad-hoc shell

All workspace commands are mani tasks in `mani.yaml` (`mani describe tasks` lists them). Select repos with
`-p <repo>` (folder name, e.g. `MaterialX`) or `--all`; pass task parameters as trailing `KEY=value`.

| Command | Purpose |
|---|---|
| `mani sync` | Clone all missing repos from `mani.yaml` |
| `mani run submodules --all` | Init/update submodules (mani's clone doesn't recurse) |
| `mani run status --all` / `remotes --all` | Branch + status / remotes |
| `mani run update-default --all` (or `-p X`) | Checkout each repo's default branch (`main`, `develop`, ... read from `origin/HEAD`) and pull `origin`; skips dirty repos |
| `mani run add-remote -p <repo> REMOTE=<user>` | Add `https://github.com/<user>/<repo>.git` as remote `<user>` (default `MustafaJafar`) |
| `mani run build-cmake -p <repo>` | **Wipes `<repo>/build`**, then `cmake --preset default` + build. Copies `resources/<repo>/CMakePresets.json` in if the repo has none |

Task commands run in bash (Git Bash) with the repo as working directory. `resources/` holds per-repo files such as CMake presets.

## Conventions
- Default branches differ per repo (some use `main`, some `develop`, which is where feature branches start). Never assume `main`; read `origin/HEAD`.
- Never push, force-push, or delete branches/`build` dirs unless asked; `build-cmake` is destructive to `build/` by design.
- Origin is the upstream ASWF repo; the user's fork is added as a second remote (see `add-remote`).
- Adding a helper: add a task to `mani.yaml` (use `$(basename "$PWD")` for the repo name) and a row above; add a VS Code task in `.vscode/tasks.json` if wanted.
- Adding a repo: add it to `mani.yaml` (with a one-line `desc`), then `mani sync`; add its name to `.gitignore`.

## Repo notes
- **MaterialX** — C++ with Python bindings, viewer and graph editor; built with CMake preset `default` (Visual Studio 17 2022).
- **OpenColorIO** — C++/Python color management; no custom preset yet.
- **OpenAssetIO** — asset-management interoperability API (C++ core, Python bindings). Lives under the `OpenAssetIO` GitHub org, not ASWF, but is treated as part of this workspace. No custom preset yet.
