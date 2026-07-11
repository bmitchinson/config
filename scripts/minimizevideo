#!/usr/bin/env bash

# MP4/MOV Minimize Script
# Compresses MP4 and MOV files to target size in MB
# Usage: ./minimize-video.sh <size> <input_file>
# Example: ./minimize-video.sh 20 input.mp4
# Example: ./minimize-video.sh 50 input.mov
# Example: ./minimize-video.sh 5.5 input.mp4

set -e  # Exit on any error

# Check if correct number of arguments provided
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <size> <input_file>"
    echo "Size: Target size in MB (e.g., 8, 20, 50, 5.5)"
    echo "Example: $0 20 myvideo.mp4"
    echo "Example: $0 5.5 myvideo.mov"
    exit 1
fi

TARGET_SIZE=$1
INPUT_FILE=$2

# Validate target size is a positive number
if ! [[ "$TARGET_SIZE" =~ ^[0-9]+([.][0-9]+)?$ ]] || (( $(echo "$TARGET_SIZE <= 0" | bc -l) )); then
    echo "Error: Size must be a positive number (MB)"
    exit 1
fi

# Check if input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: Input file '$INPUT_FILE' does not exist"
    exit 1
fi

# Check if input file is an MP4 or MOV
if [[ ! "$INPUT_FILE" == *.mp4 && ! "$INPUT_FILE" == *.MP4 && ! "$INPUT_FILE" == *.mov && ! "$INPUT_FILE" == *.MOV ]]; then
    echo "Error: Input file must be an MP4 or MOV file"
    exit 1
fi

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed or not in PATH"
    exit 1
fi

# Generate output filename in same directory as input
INPUT_DIR=$(dirname "$INPUT_FILE")
BASENAME=$(basename "$INPUT_FILE" .mp4)
BASENAME=$(basename "$BASENAME" .MP4)   # Handle uppercase MP4 extension
BASENAME=$(basename "$BASENAME" .mov)   # Handle MOV extension
BASENAME=$(basename "$BASENAME" .MOV)   # Handle uppercase MOV extension
OUTPUT_FILE="${INPUT_DIR}/${BASENAME}_${TARGET_SIZE}MB.mp4"

echo "Compressing '$INPUT_FILE' to approximately ${TARGET_SIZE}MB..."
echo "Output file: '$OUTPUT_FILE'"

# Get video duration in seconds
DURATION=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$INPUT_FILE")
if [[ -z "$DURATION" ]]; then
    echo "Error: Could not determine video duration"
    exit 1
fi

# Calculate target bitrate
# Target size in bits = TARGET_SIZE * 8 * 1000000 (convert MB to bits)
# Audio bitrate assumption: 128k
# Video bitrate = (target_bits / duration) - audio_bitrate
# Add 10% buffer to account for overhead
TARGET_BITS=$(echo "scale=0; $TARGET_SIZE * 8 * 1000000" | bc)
AUDIO_BITRATE=128000  # 128k audio bitrate
VIDEO_BITRATE=$(echo "scale=0; ($TARGET_BITS / $DURATION - $AUDIO_BITRATE) * 0.9" | bc)

# Ensure minimum bitrate
if (( $(echo "$VIDEO_BITRATE < 100000" | bc -l) )); then
    VIDEO_BITRATE=100000
    echo "Warning: Video is very long for target size. Using minimum bitrate."
fi

echo "Calculated video bitrate: ${VIDEO_BITRATE} bits/s"

# Run FFmpeg compression
ffmpeg -i "$INPUT_FILE" \
    -c:v libx264 \
    -preset fast \
    -crf 23 \
    -maxrate "${VIDEO_BITRATE}" \
    -bufsize "$(echo "scale=0; $VIDEO_BITRATE * 2" | bc)" \
    -c:a aac \
    -b:a 128k \
    -movflags +faststart \
    -y \
    "$OUTPUT_FILE"

# Check if output file was created successfully
if [[ ! -f "$OUTPUT_FILE" ]]; then
    echo "Error: Output file was not created"
    exit 1
fi

# Show file sizes
INPUT_SIZE=$(du -h "$INPUT_FILE" | cut -f1)
OUTPUT_SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)

echo ""
echo "Compression complete!"
echo "Input file:  $INPUT_FILE ($INPUT_SIZE)"
echo "Output file: $OUTPUT_FILE ($OUTPUT_SIZE)"

# Calculate actual file size in MB for verification
ACTUAL_MB=$(echo "scale=1; $(stat -f%z "$OUTPUT_FILE") / 1000000" | bc)
echo "Target: ${TARGET_SIZE}MB | Actual: ${ACTUAL_MB}MB"
