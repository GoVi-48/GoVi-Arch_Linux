#!/usr/bin/env bash

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

export PATH="/usr/java/jre1.8.0_261/bin/:$PATH"
# export PATH="/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH"
# export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
# export PATH="/usr/lib/jvm/java-14-openjdk/bin/:$PATH"

JDownloader
