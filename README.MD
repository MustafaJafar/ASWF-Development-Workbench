My ASWF development workbench in compliance to my [AYON-Development-Workbench](https://github.com/MustafaJafar/AYON-Development-Workbench). 
I use it to set up my workspace for developing ASWF projects.

This workbench is designed to group various ASWF projects into one workarea along with some automated VS Code tasks for mundane and repetitive tasks like building a project.

Currently, it only includes a few actions that I use when working with [MaterialX](https://github.com/AcademySoftwareFoundation/MaterialX) repo.

## Claude Code / mani
- `mani.yaml` lists the repos (`mani sync` clones them) and workspace-wide tasks (`mani run status`, `update-default`, ...).
- `resources/` holds per-repo helper files (e.g. CMake presets); `.vscode/tasks.json` just calls mani tasks.
- `CLAUDE.md` tells Claude about the workspace layout and which command to use for what.
