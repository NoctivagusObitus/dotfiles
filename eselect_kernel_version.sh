#!/bin/sh

eselect kernel list | grep "*$" | sed -E 's/.*linux-([^ ]+).*/\1/'
