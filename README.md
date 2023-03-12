# Example kivy project


## Development
```
python -m pip install "kivy[full]" --pre --extra-index-url https://kivy.org/downloads/simple/
pip install PyInstaller
```

Change multisamples key value in config file (%HOMEPATH%\.kivy\config.ini for me) from multisamples = 2 to multisamples = 0.


## Packaging

Use the `build.ps1` to generate the exe file.

https://kivy.org/doc/stable/guide/packaging-windows.html

Reference `mypaing.spec` file where the following was added:

- from kivy_deps import sdl2, glew, angle
- *[Tree(p) for p in (sdl2.dep_bins + glew.dep_bins + angle.dep_bins)],

```
# -*- mode: python ; coding: utf-8 -*-
from kivy_deps import sdl2, glew, angle

block_cipher = None


a = Analysis(
    ['..\\paint.py'],
    pathex=[],
    binaries=[],
    datas=[],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='mypaint',
    debug=False,
    bootloader_ignore_signals=False,
    *[Tree(p) for p in (sdl2.dep_bins + glew.dep_bins + angle.dep_bins)],
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
```
