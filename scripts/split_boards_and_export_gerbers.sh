#!/bin/bash

# CONFIGURATION
BOARD1_NAME="io"
BOARD2_NAME="switch"
BOARD3_NAME="ux"


if [[ ! -f `which kikit` ]]; then
  "This script relies on kikit, and it is not installed. Please install then try again."
fi

project=$(basename $(pwd))
parent_pcb_file="hardware/${project}.kicad_pcb"



function generate_gerbers() {
  pcb_file=$1
  boardname=$2
  if [[ -f "$pcb_file" ]]; then
    pcb_revision=$(grep '\(rev \"\)' "$pcb_file" | awk -F\" '{print $2}') 
    if [[ -z "$pcb_revision" ]]; then
      echo "Could not determine revision."
      exit 1
    fi

    mkdir -p fabrication/$pcb_revision/$boardname 2>/dev/null
    pushd fabrication/$pcb_revision/$boardname
    rm * 2>/dev/null
    kicad-cli pcb export drill "../../../$pcb_file" --excellon-separate-th --format gerber --generate-map --map-format gerberx2
    kicad-cli pcb export gerbers "../../../$pcb_file" -l "F.Cu,B.Cu,F.SilkS,B.SilkS,F.Mask,B.Mask,Edge.Cuts"
    zip "$project-$boardname-$pcb_revision-gerbers.zip" *
    popd
  else
    echo "PCB file not found."
    exit 1
  fi
}



BOARD1_DIR="hardware-$BOARD1_NAME"
BOARD1_PCBFILE="$BOARD1_DIR/$project-$BOARD1_NAME.kicad_pcb"
mkdir -p "$BOARD1_DIR"
pushd $BOARD1_DIR

kikit separate --source 'rectangle; tlx: 13mm; tly: 13mm; brx: 71mm; bry: 50mm' "../$parent_pcb_file" "../$BOARD1_PCBFILE"
popd
generate_gerbers $BOARD1_PCBFILE $BOARD1_NAME


BOARD2_DIR="hardware-$BOARD2_NAME"
BOARD2_PCBFILE="$BOARD2_DIR/$project-$BOARD2_NAME.kicad_pcb"
mkdir -p "$BOARD2_DIR"
pushd $BOARD2_DIR
kikit separate --source 'rectangle; tlx: 13mm; tly: 53mm; brx: 71mm; bry: 82mm' "../$parent_pcb_file" "../$BOARD2_PCBFILE"
popd
generate_gerbers $BOARD2_PCBFILE $BOARD2_NAME

BOARD3_DIR="hardware-$BOARD3_NAME"
BOARD3_PCBFILE="$BOARD3_DIR/$project-$BOARD3_NAME.kicad_pcb"
mkdir -p "$BOARD3_DIR"
pushd $BOARD3_DIR
kikit separate --source 'rectangle; tlx: 13mm; tly: 86mm; brx: 71mm; bry: 141mm' "../$parent_pcb_file" "../$BOARD3_PCBFILE"
popd
generate_gerbers $BOARD3_PCBFILE $BOARD3_NAME
