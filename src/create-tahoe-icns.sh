#!/usr/bin/env bash

# shellcheck disable=SC2012,SC2034,SC2129

# Exit any error
set -e

# Gather the first '1024' PNG file
SRC=$(ls ./*1024*.png 2>/dev/null | head -n 1)
if [ -z "$SRC" ]; then
	echo "❌ No PNG file found with '1024' in the name."
	exit 1
fi

# Output folder based on SRC name
OUT="${SRC%.*}.iconset"
echo "📦 Creating iconset from: $SRC → $OUT"

# Remove previously generated iconset
rm -rf "$OUT"
mkdir "$OUT"

# Resize and pad the icon
resize_icon() {
	TARGET_SIZE=$1
	FILENAME=$2

	# Padding: 10% of target size
	PAD=$((TARGET_SIZE * 10 / 100))

	# Resize original to (TARGET_SIZE - 2*PAD)
	CONTENT_SIZE=$((TARGET_SIZE - 2 * PAD))

	# Resize with sips
	sips -z "$CONTENT_SIZE" "$CONTENT_SIZE" "$SRC" \
		--out "/tmp/tmp_resized.png" >/dev/null

	# Add padding by creating transparent canvas of TARGET_SIZE
	sips -s format png \
		--padToHeightWidth "$TARGET_SIZE" "$TARGET_SIZE" "/tmp/tmp_resized.png" \
		--out "$OUT/$FILENAME" >/dev/null
}

# Handle all required SIZES
SIZES=(
	"16 icon_16x16.png"
	"32 icon_16x16@2x.png"
	"32 icon_32x32.png"
	"64 icon_32x32@2x.png"
	"128 icon_128x128.png"
	"256 icon_128x128@2x.png"
	"256 icon_256x256.png"
	"512 icon_256x256@2x.png"
	"512 icon_512x512.png"
	"1024 icon_512x512@2x.png"
)

# Create all required PNG files
for s in "${SIZES[@]}"; do
	read -r SIZE FILENAME <<<"$s"
	resize_icon "$SIZE" "$FILENAME"
done

# Create the ICNS file
iconutil -c icns "$OUT"
rm -f /tmp/tmp_resized.png

# Output the success message
echo "✅ Created ${OUT%.iconset}.icns"
