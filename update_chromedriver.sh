#!/usr/bin/env bash

set -e

# current_chrome_v=$(chromedriver -v | awk '{print $2}')
dir_installation=$(dirname $(which chromedriver))
chromedriver_json_test="https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json"
curl $chromedriver_json_test > json_chrom_test.json
platform=''
if [ "$(uname)" == "Darwin" ]; then
    # g_chrome_version=$(/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version | awk '{print $3}')
    if [ "$(uname -m)" == 'x86_64' ]; then
      platform='mac-x64'
    elif [ "$(uname -m)" == 'arm64' ]; then
      platform='mac-arm64'
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # g_chrome_version=$(google-chome --version | awk '{print $3}')
    platform='linux64'
fi
# before chrome 115
# chromedriver_to_be_downloaded="https://chromedriver.storage.googleapis.com/113.0.5845.96/chromedriver_mac64.zip"
chromedriver_to_be_downloaded=$(cat json_chrom_test.json | jq -r '.channels.Stable.downloads.chromedriver' | jq --arg platform "$platform" '.[] | select(.platform == $platform)' | jq '.url' | tr -d '"')
echo "Downloading chromedriver in $chromedriver_to_be_downloaded"
curl $chromedriver_to_be_downloaded > chromedriver64

unzip chromedriver64

mv -f chromedriver-mac-x64/chromedriver $dir_installation/

rm chromedriver64 json_chrom_test.json
rm -rf chromedriver-mac-x64

chromedriver -v
echo "Done!"
