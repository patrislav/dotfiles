#!/bin/bash
xkblayout-state print '%s' | awk '{print toupper($1)}'
