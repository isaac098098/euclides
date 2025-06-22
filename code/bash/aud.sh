#!/bin/bash

upower --dump | grep -A 7 BC:A0:80:2C:AA:18 | grep percentage | awk '{print $2}'
