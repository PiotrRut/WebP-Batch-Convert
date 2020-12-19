# Batch WebP Converter

I had two reasons for writing this piece of code:

- Google's `cwebp` command only lets you compress and convert one file at a time, which is often very tedious with a larger set of files.
- I could've done this very easily in Python, but where's the fun in that? I wanted to learn shell, and what better way to do it than by solving a problem I have just created 🙌🏼

You need the `webp` formula installed through Homebrew to use this script. Alternatively, you can download and run the `cwebp` excutable, which this program can automatically download and configure for you, should you desire. It can also be manually downloaded for your OS from [here](https://storage.googleapis.com/downloads.webmproject.org/releases/webp/index.html) - the latest version is `1.1.0`.

The images are being compressed with a hardcoded factor of 80 - meaning the output file will be 80% its original quality. This can be changed by modyfying the value after the `-q` option in the `cwebp` command. For all available options, visit [Google's docs](https://developers.google.com/speed/webp/docs/cwebp)!

## Usage - Bash/Zsh 👨🏻‍💻

First, make the file executable by running

```bash
$ chmod +x convert.sh
```

Then, run the scrip in current working directory:

```bash
~WebP-Batch-Converter $ ./convert.sh
```

After going through the installation process (should you not have `webp` installed on your machine already), you will be asked to provide an input directory with all your image files.

```bash
# This will take folder named "files" located in the same working directory
"Where are your images located? Provide folder:" > ./files
```

Converted WebP files will be put in the script's working directory

```bash
# Example state after execution:

├── convert.sh
├── file1.webp
└── file2.webp
```

## Usage - PowerShell 👨🏻‍💻

_Credit to [Reece Mercer](https://github.com/Reeceeboii) for helping with the PowerShell solution!_

```PowerShell
    ConvertTo-Webp.ps1 [-downloadLibWebp] [[-compressionFactor] <Int32>] [-directory] <String> [<CommonParameters>]
```

The script takes a switch (`-downloadLibWebp`) that enables the download of the cwebp binary if it isn't already installed and on the system path, otherwise it will just try to call the system's copy. It will run this executable over every file in `-directory`. The output file format is the same as the Bash/Zsh version.

`-compressionFactor` is defaulted to 80 but can be overridden.

For a full Comment-Based Help output, run:

```PowerShell
    Get-Help ./ConvertTo-Webp.ps1 -Full
```
