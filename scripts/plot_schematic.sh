#!/bin/bash

project=$(basename $(pwd))
schematic_file="hardware/${project}.kicad_sch"

mkdir -p schematics

if [[ -f "$schematic_file" ]]; then
  schematic_revision=$(grep '\(rev \"\)' "$schematic_file" | awk -F\" '{print $2}') 
  if [[ -z "$schematic_revision" ]]; then
    echo "Could not determine revision."
    exit 1
  fi

  kicad-cli sch export pdf "hardware/${project}.kicad_sch" -o "schematics/${project}-${schematic_revision}.pdf"
  kicad-cli sch export svg "hardware/${project}.kicad_sch" -o schematics
  mv "schematics/${project}.svg" "schematics/${project}-${schematic_revision}.svg"
  cp "schematics/${project}-${schematic_revision}.svg" "schematics/${project}-latest.svg"
  cp "schematics/${project}-${schematic_revision}.pdf" "schematics/${project}-latest.pdf"
else
  echo "Schematic file not found."
  exit 1
fi

