#!/bin/sh -x
dmd main.d -O -release -inline -w -wi -ofa.out
