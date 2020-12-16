# Batch WebP Converter

🚨 **This script is only to be run on machines running macOS or Linux!!**

I had two reasons for writing this piece of code:

- Google's `cwebp` command only lets you compress and convert one file at a time, which is often very tedious with a larger set of files.
- I wanted to learn shell, and what better way to do it than by solving a problem I have just created 🙌🏼

You need the `webp` formula installed on your machine - the program will check whether it's installed or not, and will install it if necessary. It will also install [Homebrew](http://brew.sh) for you if you don't have it installed 🍺

The images are being compressed with a hardcoded factor of 80 - meaning the output file will be 80% its original quality. This can be changed by modyfying the value after the `-q` option in the `cwebp` command. For all available options, visit [Google's docs](https://developers.google.com/speed/webp/docs/cwebp)!

## Usage 👨🏻‍💻

First, make the file executable by running

```bash
$ chmod +x convert.sh
```

You will be asked for a directory in which your files are located - this can be either relative or absolute!

```bash
# This will take folder named "files" located in the same working directory
$ ./convert.sh ./files
```

Converted WebP files will be put in the script's working directory

```bash
# Example state after execution:

├── convert.sh
├── file1.webp
└── file2.webp
```

## Ideas for the future 🚩

- Let users pass `args` which will be passed to the `cwebp` command
- Support Windows
- Learn more shell and have a nicer code
