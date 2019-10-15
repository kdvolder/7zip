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
        7z a -sfx7zConWin64.sfx archive.exe .

Explanation: Mounts the current local directory as a volume on path `/tmp/to-zip`. Use that 
directory as working dir and the runs command ` 7z a -sfx7zConWin64.sfx archive.exe .` in the 
container. This will:

  - create a self extracting windows archive file called `archive.exe` at the root of
    the directory. 
  - add all files from the current dir to this archive.

Upon completion of the command you will find a `archive.exe` file at the root of the local dir.

Using the included `rezip` script to download a zip from a url, unpack it, then repack it
as a self extracting windows archive.

    docker run -it \
        -v $(pwd):/output \
        -u $(id -u ${USER}):$(id -g ${USER}) \
        kdvolder/7zip \
        rezip https://download.springsource.com/snapshot/STS4/nightly/dist/e4.12/spring-tool-suite-4-4.4.1.CI-B2008-e4.12.0-win32.win32.x86_64.zip

Upon completion of the command you will find a `archive.exe` file at local directory from which you
called the command.

To convert all sts windows distrubtion zip files in a directory into
self extracting zip files, run this command from the project root:

    docker run -it \
        -v $(pwd):/data \
        -u $(id -u ${USER}):$(id -g ${USER}) \
        kdvolder/7zip \
        rezip-sts

This will find all the files `*.win32.x86_64.zip` unpack and repack them as
7zip self-extracting windows executable with a name `*.win32.x86_64.7z.exe`.