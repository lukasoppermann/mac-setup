# Make elagto lights toggler with camera

Run this to copy the shell script

```bash
mkdir -p ~/bin && cp opal-toggle-lights.sh ~/bin

# change the rights
chmod a+x ~/bin/opal-toggle-lights.sh
```

## plist
In the `.plist` the username and the ips for the ligths must be repalced.

### Copy plist and run

```bash
# copy the plist
cp com.keylight.daemon.plist /Library/LaunchDaemons/com.keylight.daemon.plist

# run
sudo launchctl load -w /Library/LaunchDaemons/com.keylight.daemon.plist  
```