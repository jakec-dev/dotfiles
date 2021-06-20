#!/bin/bash
# Compress, encrypt, and upload folder to AWS S3 Glacier vault

default_path=/media/storage/home_media/
vault_name=home_media
aws_profile=iamadmin-jakec-dev

# prompt user for dir to archive
read -e -i $default_path -p "Directory to archive: " media_path_input
media_path=${media_path_input:-$default_path}
while [[ ! -d $media_path ]]; do
    read -e -i $default_path -p "'$media_path' doesn't exist. Please try again: " media_path_input
    media_path=${media_path_input:-$default_path}
done

# set archive consts
archive_name=$(basename $media_path)
temp_dir=$(mktemp -d)
archive_path="$temp_dir/${archive_name}.7z"

# compress dir
echo Compressing $media_path to $archive_name ...
7z a $archive_path $media_path

# validate compression???

# delete/shred original???

# encrypt compressed file
echo Encrypting $archive_name.7z ...
gpg -e -r 'jake@jakec.dev' -o $archive_path.gpg $archive_path

# validate encryption???

# delete compressed, unencrypted file as no longer needed
echo Cleaning up $archive_name.7z ...
rm $archive_path

# upload encrypted file to vault
echo Uploading $archive_name.7z.gpg to AWS ...
$SCRIPTS_HOME/system/upload-homemedia.sh --vault $vault_name --profile $aws_profile --description $archive_name.gpg --split-size 2 $archive_path.gpg

# remove encrypted file
echo Removing encrypted file ...
rm $archive_path.gpg

# remove temp dir
echo Removing temp dir ...
rm -rf $temp_dir

echo Done! $archive_name.7z.gpg has been uploaded to your $vault_name vault.
