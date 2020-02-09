#!/bin/bash
xkb-switch | cut -c1-2 | awk '{print toupper($1)}'
