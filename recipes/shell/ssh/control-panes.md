# Control multiple panes at once over SSH 🍱
> How to use iTerm2 to SSH tunnel to multiple servers at once and then send commands to all panes

These scripts and instructions are for developers on macOS running iTerm2. They allow splitting the view into multiple planes for different servers. Using an iTerm2 feature, a command only needs to be entered once and the command can be send to all panes at once.

A use-case is when one needs to view Apache logs across say Prod 9 servers at once when debugging a Production bug or incident. 

The start of each script can be customized easily for connecting to any list of host machines.

The scripts are based on this tutorial: [SSH to Multiple Hosts in Split Panes Using iTerm2](https://medium.com/@maharajamandy/ssh-to-multiple-hosts-in-split-panes-using-iterm2-f2c3353fbea2).


## Installation :wrench:

### Install iTerm2

See the [iTerm2](https://www.iterm2.com/index.html) homepage and download it from there.


### Setup script

We're going to use a script in the AppleScript format here. But, don't worry – I've done all the research and testing so now you only have to configure the first line and leave the rest as is.

Note that iTerm2 will _only_ recognize files ending with `.scpt`. So `.applescript` will not work. But if you want syntax highlighting in your IDE, you can associate `.scpt` with `.applescript`.

Create a script.

```sh
$ touch ~/Library/Application\ Support/iTerm2/Scripts/my_script.scpt
```

Then add the content below as is.

- `my_script.scpt`
    ```applescript
    set hostnames to { "foo.bar.com", "fizz.buzz.com"}

    if application "iTerm" is running then
      tell application "iTerm"
        create window with default profile
        tell current tab of current window
          select
          tell current session

            -- make the window fullscreen
            tell application "System Events" to key code 36 using command down
            split horizontally with default profile

            set num_hosts to count of hostnames
            repeat with n from 1 to num_hosts
              if n - 1 is (round (num_hosts / 2)) then
                -- move to lower split
                tell application "System Events" to keystroke "]" using command down
              else if n > 1 then
                -- split vertically
                tell application "System Events" to keystroke "d" using command down
              end if
              delay 1
              write text "ssh " & (item n of hostnames)
            end repeat
          end tell
        end tell
      end tell
    else
      activate application "iTerm"
    end if
    ```

### Set hosts

Replace the hostnames with your own list and add as many as you want. The list can have valid hosts where you have SSH access to, including host aliases in `/etc/hosts`/ or `~/.ssh/config`.


### Restart

Close and reopen iTerm2 to get your script loaded.



## Usage :runner:

### Control multiple panes at once in iTerm2

1. In iTerm2, open the Scripts menu and select your script.
2. To **enable** sending of keyboard input to all panes, press <kbd>CMD</kbd>+<kbd>Shift</kbd>+<kbd>I</kbd>.
3. Enter commands to run for all panes. e.g. `ls` or `cd`.
4. Press the keys from step 2 to **disable**.


### Example

How to tail Apache logs across servers :page_with_curl: :page_with_curl: :page_with_curl:

1. Follow the steps above for a group of servers which have Apache running on them.
2. Switch to a user with permissions to view Apache logs (owned by `admin` group). The `ubuntu` user was sufficient and let's you avoid becoming `root` unnecessarily, but using that user no longer works so become `root`.
    ```sh
    $ sudo su
    ```
3. View the log files.
    ```sh
    $ cd /var/log/apache2
    $ tail -f error.log
    ```
