# Smart4Aviation Recruitment Task - IT Administration Intern

### Task description
The script operates on the `/opt/logs/` directory and its subdirectories to achieve the following:
* Find files containing `.log.` in their names.
* Rename the found files to the following format: `<name>.<date>.log.<remaining part of the original name>`.
* Compress the processed files into `.gz` archives.
* Delete `<name>.<date>.log.<remaining part of the original name>.gz` archives that are older than 10 days.

## File Structure and Description

The repository contains three scripts:

* **`task.sh`** 
  The main script implementing the core logic.
  
* **`run.sh`**
  A helper script designed to simplify testing and presentation. It generates a test environment, displays the directory tree before execution, runs the main script, and then displays the modified directory tree. It also supports `--h` (help) and `--v` (version) flags.
  
* **`prepare_data.sh`** 
  A test script that generates dummy data. It creates a dynamic, random multi-level directory structure inside `/opt/logs/` and populates it with test `.txt` and `.log.` files.


##  How to Run and Requirements

### Prerequisites
Because the scripts operate directly on the system path `/opt/logs/`, **they must be executed with root privileges**
The `tree` package must be installed on your system for the helper script to display the directory structure properly.

### How to test?

**1. Full test with environment generation (Recommended)**
If you want to test the solution from scratch, run the helper script. It will automatically generate the necessary dummy files and directories, and then execute the task:
```bash
sudo ./run.sh
```
**2.** If you already have the necessary test data in `/opt/logs/` you are free to run the script below and display the data on your own.
```bash
sudo ./task.sh
```
