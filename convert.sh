# This program will take all image files inside a folder
# and convert them to WebP format using google's cwebp lib.
# For now compression rate is hardcoded to 80..

read -n1 -p "Welcome. This program requires the webp package to be installed. Do you have it installed? [Y/N] " an1
case "$an1" in
    y|Y)
        echo " "
        read -p "Where are your images located? Provide folder: " dir
        for file in "$dir"/*; do
            ## strip the file name of the path and extension
            ext=${file##*.}
            fname=`basename $file .$ext`
            cwebp -q 80 $file -o $fname".webp"
            # Example cwebp input:
            # cwebp -q 50 file.png -o file.webp
        done
        ;;
    n|N)
        echo " "
        read -n1 -p "Would you like me to download it for you? [Y/N] " an2
        case "$an2" in
            y|Y)
                # Download the appropriate file based on user's OS
                if [[ "$OSTYPE" == "linux-gnu"* ]]; then
                    curl https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0-linux-x86-64.tar.gz -o libwebp-1.1.0-linux-x86-64.tar.gz
                    tar -xvzf libwebp-1.1.0-linux-x86-64.tar.gz
                elif [[ "$OSTYPE" == "darwin"* ]]; then
                    curl https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0-mac-10.15.tar.gz -o libwebp-1.1.0-mac-10.15.tar.gz
                    tar -xvzf libwebp-1.1.0-mac-10.15.tar.gz    
                fi
                # After unzipping, run the script
                echo "That's done! All the necessary files have been downloaded and unzipped!\n"
                read -p "Where are your images located? Provide folder: " dir
                for file in "$dir"/*; do
                    # Strip the file name of the path and extension
                    ext=${file##*.}
                    fname=`basename $file .$ext`
                    # Based on OS, run the appropriate file
                    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
                        ./libwebp-1.1.0-linux-x86-64/bin/cwebp -q 80 $file -o $fname".webp"
                    elif [[ "$OSTYPE" == "darwin"* ]]; then
                        ./libwebp-1.1.0-mac-10.15/bin/cwebp -q 80 $file -o $fname".webp"
                    fi
                done
                ;;
            n|N)
                echo "Please install the webp package before continuing!"
                exit
                ;;
            *)
                echo "You have provided incorrect input"
                ;;
        esac
        ;;
    *)
        echo "You have provided incorrect input"
        ;;  
esac


