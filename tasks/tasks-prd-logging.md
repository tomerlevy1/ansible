## Relevant Files

- `mac-setup/lib/utils.sh` – Update logging functions to support dual output (terminal and log file, no color codes in file).
- `mac-setup/setup.sh` – Initialize logging, ensure all output is captured, handle log file creation and errors.
- `mac-setup/log/` – Directory to store all generated log files.

### Notes

- All log files should be stored in `mac-setup/log/`.
- The log file name should use the format `YYYY-MM-DD-HHMMSS-[TYPE_OF_EXECUTION].log`.
- If the log file cannot be created, the script should fail immediately.
- Logging is required for the unattended setup script only in this phase.

## Tasks

- [ ] 1.0 Create and manage the log directory and log file
  - [ ] 1.1 Ensure the `mac-setup/log/` directory exists; create it if missing.
  - [ ] 1.2 Generate a unique log file name using the format `YYYY-MM-DD-HHMMSS-[TYPE_OF_EXECUTION].log`.
  - [ ] 1.3 Attempt to create the log file at the start of the run; fail with an error if not possible.
  - [ ] 1.4 Store the log file path in a variable accessible to logging functions.

- [ ] 2.0 Update logging functions in `utils.sh` to support writing to both terminal and log file (without color codes)
  - [ ] 2.1 Refactor `log_info`, `log_warn`, `log_success`, and `log_error` to accept a log file path as an argument or use a global variable.
  - [ ] 2.2 Ensure each function writes the message to the terminal (with color) and to the log file (plain text, no color codes).
  - [ ] 2.3 Format each log entry as `TYPE_OF_LOG message` in the log file.
  - [ ] 2.4 Add error handling to logging functions in case writing to the log file fails during execution.

- [ ] 3.0 Integrate logging into the main setup script (`setup.sh`)
  - [ ] 3.1 Source the updated `utils.sh` at the top of the script.
  - [ ] 3.2 Initialize the log file and set the log file path variable before any logging occurs.
  - [ ] 3.3 Pass the log file path to all logging function calls, or ensure the global variable is set.
  - [ ] 3.4 Update all direct `echo` or print statements to use the logging functions where appropriate.

- [ ] 4.0 Ensure robust error handling and log file creation on failures
  - [ ] 4.1 Ensure the log file is created even if the script fails partway through (e.g., use `trap` to handle errors and log them).
  - [ ] 4.2 Log any errors or abnormal terminations to the log file before exiting.
  - [ ] 4.3 Test failure scenarios to confirm the log file is always created and contains relevant output.

- [ ] 5.0 (Optional/Stretch) Prepare for future extension to interactive setup script
  - [ ] 5.1 Review `setup-interactive.sh` to assess effort required for similar logging integration.
  - [ ] 5.2 Document any changes needed to support logging in the interactive script in the future. 