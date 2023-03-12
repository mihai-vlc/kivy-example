$buildFolder = '_dist'

# generate spec file
if (-not (Test-Path -Path $buildFolder)) {
    mkdir -p $buildFolder
    pushd $buildFolder
    python -m PyInstaller --onefile --windowed --log-level ERROR --name mypaint ../paint.py
    popd
}

pushd $buildFolder
python -m PyInstaller --log-level ERROR mypaint.spec 
popd

