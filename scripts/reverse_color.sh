#!/bin/bash

for i in *.[Pp][Nn][Gg]; do
    no_png_name="${i%.*}"
    convert "$i" -channel RGB -negate "${no_png_name}_reversed.png"
done
