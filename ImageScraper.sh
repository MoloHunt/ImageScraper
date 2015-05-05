#!/bin/bash

#Image Scraper, pulls all images from a given website

#Variables
site='www.tickld.com/all/hot'
recursive=

#Function
usage(){
  echo "Usage: ImageScraper [ -d Directory Name ] [ -r ] [ -w Website URL ]"
}

[ -d ImagePull ] || mkdir ImagePull

cd ImagePull

while [ "$1" != "" ]; do
  case "$1" in
    -d | --directory )  shift
                        mkdir $1
                        cd $1
                        ;;
    -h | --help )       usage
                        exit
                        ;;
    -r | --recursive )  recursive=1
                        ;;
    -w | --website )    shift
                        site=$1
                        ;;
    * )                 usage
                        exit 1
  esac
  shift
done

if [ "$recursive" = "1" ]; then
  wget -r -nd -H -p -A jpg,jpeg,png,gif -e robots=off "$site"
else
  wget -nd -H -p -A jpg,jpeg,png,gif -e robots=off "$site"
fi
