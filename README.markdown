#You can check the Q2 : Scenario at `theScenario` branch [here](https://github.com/omar3anan/Fawry-DevOps-Intern/tree/theScenario).
# mygrep.sh - A Simplified grep-like Bash Script

This Bash script, `mygrep.sh`, is a simplified version of the `grep` command. It allows users to search for a string in a text file and print matching lines, with support for options like displaying line numbers and inverting the match.

## Features

- **Case-Insensitive Search**: Searches for the specified string regardless of case.
- **Options**:
  - `-n`: Displays line numbers for matching lines.
  - `-v`: Inverts the match, printing lines that do not contain the search string.
  - `--help`: Shows usage information.
- **Error Handling**: Provides appropriate messages for invalid inputs or non-existent files.

## Usage

```bash
./mygrep.sh [options] search_string file_name
```

- `[options]`: Optional flags `-n`, `-v`, or `--help`.
- `search_string`: The string to search for in the file.
- `file_name`: The text file to search in.

## Test Cases

Below are examples of how the script works, with screenshots to demonstrate the output. Replace the placeholder paths with the actual paths or URLs to your uploaded screenshots on GitHub.

1. **Basic Search**
   - **Command**: `./mygrep.sh hello testfile.txt`
   - **Output**:
     ```
     Hello world
     HELLO AGAIN
     ```
   - **Screenshot**: ![App Screenshot](screenshots/1.png)

2. **Search with Line Numbers**
   - **Command**: `./mygrep.sh -n hello testfile.txt`
   - **Output**:
     ```
     1:Hello world
     4:HELLO AGAIN
     ```
   - **Screenshot**: ![App Screenshot](screenshots/2.png)

3. **Inverted Match**
   - **Command**: `./mygrep.sh -v hello testfile.txt`
   - **Output**:
     ```
     This is a test
     another test line
     Don't match this line
     ```
   - **Screenshot**: ![App Screenshot](screenshots/7.png)

4. **Inverted Match with Line Numbers**
   - **Command**: `./mygrep.sh -vn hello testfile.txt`
   - **Output**:
     ```
     2:This is a test
     3:another test line
     5:Don't match this line
     ```
   - **Screenshot**: ![App Screenshot](screenshots/3.png)

5. **Missing Search String**
   - **Command**: `./mygrep.sh -v testfile.txt`
   - **Output**:
     ```
     Usage: ./mygrep.sh [options] search_string file_name
     ```
   - **Screenshot**: ![App Screenshot](screenshots/4.png)

6. **Help Flag**
   - **Command**: `./mygrep.sh --help`
   - **Output**:
     ```
     Usage: ./mygrep.sh [options] search_string file_name
     Options:
       -n   Show line numbers
       -v   Invert match
     ```
   - **Screenshot**: ![App Screenshot](screenshots/5.png)
7. **Improve option parsing using getopts**
   - **Screenshot**:![App Screenshot](screenshots/8.png)


