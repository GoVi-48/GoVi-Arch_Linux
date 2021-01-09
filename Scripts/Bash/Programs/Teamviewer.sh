#!/usr/bin/env bash

teamviewer --daemon start

/opt/teamviewer/tv_bin/script/teamviewer

teamviewer --daemon stop
