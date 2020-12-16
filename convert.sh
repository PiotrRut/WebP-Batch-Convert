# This program will take all image files inside a folder
# and convert them to WebP format using google's cwebp lib.
# For now compression rate is hardcoded to 80..

# Check if homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install it if not
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # Check if webp is installed
    # brew -ls output is rather slow so need to wait a bit here
    if brew ls --versions webp sleep 2 > /dev/null; then
        # if not - install it
        brew install webp
    fi
    read -p 'Where are your images located? Provide folder: ' dir
    for file in "$dir"/*; do
        ## strip the file name of the path and extension
        ext=${file##*.}
        fname=`basename $file .$ext`
        cwebp -q 80 $file -o $fname".webp"
        # Example cwebp input:
        # cwebp -q 50 file.png -o file.webp
    done
fi
