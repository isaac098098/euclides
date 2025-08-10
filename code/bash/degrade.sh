#!/bin/bash

INPUT="$1"
OUTPUT="output.jpg"
ITERATIONS=20
QUALITY=20

cp "$INPUT" step_0.jpg

for i in $(seq 1 $ITERATIONS); do
  prev=$((i - 1))
  magick step_${prev}.jpg \
    -resize 90% \
    -filter point \
    -quality $QUALITY \
    -sampling-factor 4:2:0 \
    step_${i}.jpg
done

mv step_${ITERATIONS}.jpg "$OUTPUT"
rm step_*.jpg
