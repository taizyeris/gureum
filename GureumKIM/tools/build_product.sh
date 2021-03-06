#!/bin/bash
. ready.sh

rm "build/$CONFIGURATION/$pkgname.pkg" "build/$CONFIGURATION/$pkgname.app.tar.gz"
rm "build/$CONFIGURATION/*.app/Contents/Info.plist"

xcodebuild -project 'CharmIM.xcodeproj' -target 'Gureum' -configuration "$CONFIGURATION" && \
cd "build/$CONFIGURATION" && \
productbuild --component "$appname" '/Library/Input Methods' "$pkgname.pkg" && \
tar -zcf "$pkgname.app.tar.gz" "$appname"

