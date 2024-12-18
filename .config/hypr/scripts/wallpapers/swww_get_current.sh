#!/bin/bash

echo $(swww query | grep -op '(?<=image: ).*' | head -n 1)
