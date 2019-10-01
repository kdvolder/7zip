# 7zip Docker Image

Allows running 7zip commands from within docker. Has support for
creating self-extracting windows archive.

## Usage:

Run a 7z command inside the image/container:

    docker run -it kdvolder/7zip 7z <arguments>

Run a 7z command inside the container to zip up all files from current local dir
as a self extracting windows archive:

    docker run -it \
        -v $(pwd):/tmp/tozip \
        -w="/tmp/tozip" \
        -u $(id -u ${USER}):$(id -g ${USER}) \
        kdvolder/7zip \
        7z a -sfx7zConWin32.sfx archive.exe .

Explanation: Mounts the current local directory as a volume on path `/tmp/to-zip`. Use that 
directory as working dir and the runs command ` 7z a -sfx7zConWin32.sfx archive.exe .` in the 
container. This will:

  - create a self extracting windows archive file called `archive.exe` at the root of
    the directory. 
  - add all files from the current dir to this archive.

Upon completion of the command you will find a `archive.exe` file at the root of the local dir.
