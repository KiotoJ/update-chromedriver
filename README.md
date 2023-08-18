This script is for updating chromedriver to the latest version

Because of the bellow issue:
```
Selenium::WebDriver::Error::SessionNotCreatedError:

           session not created: This version of ChromeDriver only supports Chrome version "driver version"
           Current browser version is ""chrome version"" with binary path /Applications/Google Chrome.app/Contents/MacOS/Googl
e Chrome
```

## Prerequisites
- JQ

## install Jq
### Mac
```
brew install jq
```
### Linux
```
apt-get install jq
```

## How to use it

```
git clone https://github.com/KiotoJ/update-chromedriver.git
```

## Make it executable
```
chmod u+x update-chromedriver/chromedriver-updator.sh
```

## Launch it
```
update-chromedriver/chromedriver-updator.sh
```

## Report issues

Feel free to create issues when you faced it.
