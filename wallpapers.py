#! python3

"""Collect wallpaper images from the Windows 10 download cache.

These are the wallpapers that are shown on the lock screen of Windows 10.

When run this script will:
 - Create a folder 'new' in its directory (DELETING ANY EXISTING FOLDER!)
 - Copy all images from the download cache into the 'new' folder
 - Delete any non-wallpaper images (not .jpg or not 16:9 ratio)
"""

import os
from pathlib import Path
import shutil

assets_dir = Path.home() / "AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets"
wallpaper_dir = Path(__file__).parent / "new"

# Delete the old wallpaper_dir folder
try:
  shutil.rmtree(wallpaper_dir)
except FileNotFoundError:
  print("Directory {} did not exist".format(wallpaper_dir))

# Copy contents of assets_dir to wallpaper_dir
shutil.copytree(assets_dir, wallpaper_dir)

files = os.listdir(wallpaper_dir)
for f in files:
  # Add .jpg extension
  src = os.path.join(wallpaper_dir, f)
  dst = src + ".jpg"
  os.rename(src, dst)

  # Read the file contents
  with open(dst, "rb") as img_file:
    img = img_file.read()

  # Discard if not actually a .jpg
  if not img.startswith(b"\xff\xd8"):
    os.remove(dst)
  else:
    # Find the 'Start Of Frame' bytes
    sof = img.find(b"\xff\xc0")

    # Height is 2 bytes at position sof + 5
    height = int.from_bytes(img[sof+5:sof+7], "big")

    # Width is next 2 bytes
    width = int.from_bytes(img[sof+7:sof+9], "big")

    ratio = width / height

    # Discard if not 16:9
    if ratio != 16/9:
      os.remove(dst)

    print("{} : {}x{} : {}".format(f, width, height, ratio))

input("Press enter to exit...")
