# Project Tasks: macOS Setup Automation

## Main Tasks

1. **Initialize Project Structure** [x]
    1.1. [x] Create the root directory `mac-setup`.
    1.2. [x] Create subdirectories: `mac-setup/modules`, `mac-setup/lib`, `mac-setup/tests`.
    1.3. [x] Create an initial `.gitignore` file in `mac-setup` to ignore `config.sh` and other local development files.

2. **Implement Core Utilities** [x]
    2.1. [x] Create `mac-setup/lib/utils.sh`.
    2.2. [x] Add colored logging functions (`log_info`, `log_success`, `log_error`) to `utils.sh`.
    2.3. [x] Add a helper function to check for the existence of a command (e.g., `command_exists`).

3. **Develop the Main Orchestrator Script**
    3.1. [x] Create the main script `mac-setup/setup.sh`.
    3.2. [x] Implement logic in `setup.sh` to source `lib/utils.sh`.
    3.3. [x] Add logic to source `mac-setup/config.sh` if it exists.
    3.4. [x] Implement module discovery to find all `.sh` files in the `modules/` directory.
    3.5. [ ] Implement the main loop in `setup.sh` to execute the discovered modules in alphabetical order.

4. **Implement Feature Flags**
    4.1. [ ] Add argument parsing to `setup.sh` for selective module execution (e.g., `./setup.sh tmux`).
    4.2. [ ] Implement the `--dry-run` flag to show what commands would be executed.

5. **Migrate Ansible Roles to Modules**
    5.1. [ ] Create `mac-setup/modules/00_homebrew.sh` to handle Homebrew installation. This module should be idempotent.
    5.2. [ ] Create `mac-setup/modules/10_zsh.sh` to configure Zsh.
    5.3. [ ] Create `mac-setup/modules/20_tmux.sh` to install and configure tmux.
    5.4. [ ] Ensure each module uses the logging and utility functions from `utils.sh`.

6. **Set Up Configuration Management**
    6.1. [ ] Create `mac-setup/config.sh.example` with commented-out examples of variables.

7. **Create Documentation**
    7.1. [ ] Create a comprehensive `mac-setup/README.md`.
    7.2. [ ] Document the project's purpose, how to run the setup, and how to use features like selective execution and the `config.sh` file.
    7.3. [ ] Add a guide for developers on how to create a new module.

---

## Nice to Have

8. **Implement Testing**
    8.1. [ ] Add `bats-core` as a git submodule or download it into the `mac-setup/tests/` directory.
    8.2. [ ] Create a `mac-setup/tests/test_runner.sh` to execute all tests.
    8.3. [ ] Write a basic test file (e.g., `mac-setup/tests/test_tmux.sh`) to verify the `tmux` module's functionality.

9. **Final Cleanup**
    9.1. [ ] Remove all the old Ansible-related files and directories (`ansible_run`, `install_ansible`, `inventory`, `main.yml`, `tasks/`, `vars.yml`).
    9.2. [ ] Move the new `mac-setup` contents to the root of the project.
    9.3. [ ] Delete the `prd.md` and `generate-tasks.mdc` files.

10. **Implement the `--force` Flag**
    10.1. [ ] Implement the `--force` flag to allow re-running a module.

---

## Relevant Files

- `mac-setup/` (directory): Root directory for the new setup system.
- `mac-setup/.gitignore`: Ignores user config and local files.
- `mac-setup/lib/utils.sh`: Utility functions for logging and command checks.
- `mac-setup/setup.sh`: Main orchestrator script for running setup modules.

---

## Suggested Conventional Commit Messages

- feat(setup): create root mac-setup directory
- feat(setup): add modules, lib, and tests subdirectories
- chore(setup): add initial .gitignore to mac-setup
- feat(utils): add utils.sh with logging and command_exists helpers
- feat(setup): create main setup.sh script
- feat(setup): source lib/utils.sh in setup.sh
- feat(setup): source config.sh if it exists in setup.sh
- feat(setup): discover modules in modules directory 