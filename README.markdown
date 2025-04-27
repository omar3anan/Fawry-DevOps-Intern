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
   - **Screenshot**: ![Basic Search Screenshot](path/to/basic_search_screenshot.png)

2. **Search with Line Numbers**
   - **Command**: `./mygrep.sh -n hello testfile.txt`
   - **Output**:
     ```
     1:Hello world
     4:HELLO AGAIN
     ```
   - **Screenshot**: ![Search with Line Numbers Screenshot](path/to/search_with_line_numbers_screenshot.png)

3. **Inverted Match**
   - **Command**: `./mygrep.sh -v hello testfile.txt`
   - **Output**:
     ```
     This is a test
     another test line
     Don't match this line
     Testing one two three
     ```
   - **Screenshot**: ![Inverted Match Screenshot](path/to/inverted_match_screenshot.png)

4. **Inverted Match with Line Numbers**
   - **Command**: `./mygrep.sh -vn hello testfile.txt`
   - **Output**:
     ```
     2:This is a test
     3:another test line
     5:Don't match this line
     6:Testing one two three
     ```
   - **Screenshot**: ![Inverted Match with Line Numbers Screenshot](path/to/inverted_match_with_line_numbers_screenshot.png)

5. **Missing Search String**
   - **Command**: `./mygrep.sh -v testfile.txt`
   - **Output**:
     ```
     Usage: ./mygrep.sh [options] search_string file_name
     ```
   - **Screenshot**: ![Missing Search String Screenshot](path/to/missing_search_string_screenshot.png)

6. **Invalid File**
   - **Command**: `./mygrep.sh hello non_existent_file.txt`
   - **Output**:
     ```
     File not found: non_existent_file.txt
     ```
   - **Screenshot**: ![Invalid File Screenshot](path/to/invalid_file_screenshot.png)

7. **Help Flag**
   - **Command**: `./mygrep.sh --help`
   - **Output**:
     ```
     Usage: ./mygrep.sh [options] search_string file_name
     Options:
       -n   Show line numbers
       -v   Invert match
     ```
   - **Screenshot**: ![Help Flag Screenshot](path/to/help_flag_screenshot.png)

8. **Combined Options**
   - **Command**: `./mygrep.sh -nv hello testfile.txt`
   - **Output**:
     ```
     2:This is a test
     3:another test line
     5:Don't match this line
     6:Testing one two three
     ```
   - **Screenshot**: ![Combined Options Screenshot](path/to/combined_options_screenshot.png)

9. **Case Insensitivity**
   - **Command**: `./mygrep.sh HeLLo testfile.txt`
   - **Output**:
     ```
     Hello world
     HELLO AGAIN
     ```
   - **Screenshot**: ![Case Insensitivity Screenshot](path/to/case_insensitivity_screenshot.png)

10. **No Matches**
    - **Command**: `./mygrep.sh nonexistent testfile.txt`
    - **Output**: (No output)
    - **Screenshot**: ![No Matches Screenshot](path/to/no_matches_screenshot.png)

## How to Use This README

1. Take screenshots of each test case output after running the commands above.
2. Upload the screenshots to your GitHub repository.
3. Replace the `path/to/...` placeholders in this README with the actual paths or URLs to your screenshots.