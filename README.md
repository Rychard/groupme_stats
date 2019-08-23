# Download GroupMe Messages

This is a tool to download GroupMe messages to a CSV file and display simple stats about those messages.

Example usage:

- Number of messages by each user
- Number of favorited messages
- Number of times a user spews profanity
- Average length of a user's message
- Number of times a user says "lol"

---

## Getting Access Token

The scripts access data using the GroupMe API, which must be accessed using a user-specific access token.

To obtain this token, follow these steps:

1. Log into the [GroupMe Developer site](https://dev.groupme.com/)
2. Click the `Access Token` link at the top-right corner of the page
3. Copy your 40-character access token that appears in the popup window
   - This token must be provided to the scripts when exporting your messages

---

## Dependencies

- [Python 2.7](https://www.python.org/download/releases/2.7/)
- [Python "requests" library](http://docs.python-requests.org/en/latest/)

  ```bash
  pip install requests
  ```

---

## Usage

### `retrieve_msgs.py`

```text
retrieve_msgs.py [-h] [-a] [-d] [-g GROUP] [-c CSV] [-o] token

Tool to retrieve GroupMe messages and output them to a CSV file.

positional arguments:
  token                 Access token used to authenticate yourself when making
                        API requests.

optional arguments:
  -h, --help            show this help message and exit
  -a, --all             Retrieve all groups
  -d, --dm              Retrieve all direct messages
  -g GROUP, --group GROUP
                        Name of group to retrieve. Run without this flag to
                        see list of groups.
  -c CSV, --csv CSV     Name of csv file to write to.
  -o, --overwrite       overwrite csv file
```

### `run_stats.py`

```text
usage: run_stats.py [-h] [-p PHRASE [PHRASE ...]] [--print_matches]
                    [--count_dups] [--match_exactly] [--print_user PRINT_USER]
                    [--include_groupme] [--average] [--no_compact]
                    csv_file

Tool to show simple stats of GroupMe messages.

positional arguments:
  csv_file              CSV file to read messages from. Outputted by
                        retrieve_msgs.py.

optional arguments:
  -h, --help            show this help message and exit
  -p PHRASE [PHRASE ...], --phrase PHRASE [PHRASE ...]
                        Find phrase(s)
  --print_matches       print all occurances of phrase
  --count_dups          count multiple instances in same message
  --match_exactly       the message must match the phrase exactly
  --print_user PRINT_USER
                        print all matches by this user
  --include_groupme     include messages sent by GroupMe
  --average             take the average rather than the total
  --no_compact          don't return the total num of messages and percentage
```

---

## Examples

### Export all messages from all groups

```bash
python retrieve_msgs.py $ACCESS_TOKEN -a -c output.csv
```

Exports all messages from all groups into a csv file named `output.csv`

### Export all messages from a specific group

```bash
python retrieve_msgs.py $ACCESS_TOKEN -g "Beer League Hockey"
```

Exports all messages from the group "Beer League Hockey" into a file named `beer_league_hockey.csv`

### Export all direct messages

```bash
python retrieve_msgs.py $ACCESS_TOKEN -d -a
```

Exports all direct messages into separate csv files for each person

### Export all direct messages from specific person

```bash
python retrieve_msgs.py $ACCESS_TOKEN -d -g "Jennifer Lawrence" -c jlaw.csv
```

Exports all direct messages from "Jennifer Lawrence" into a file called `jlaw.csv`

### Display simple statistics about your messages

```bash
python run_stats.py $CSV_FILENAME
```

Displays the number of messages sent by each individual

---

## Support

If you run into any issues running this, let me know via the "Issues" tab. Some of the code is not fully tested so please file a bug report if an error occurs and I will try to address it!
