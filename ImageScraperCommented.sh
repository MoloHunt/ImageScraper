#!/bin/bash

#Image Scraper, pulls all images from a given website

#Variables
site='www.tickld.com/all/hot' #Place holder web page
recursive= #Recursive is declared but not set

#Function
usage(){
  echo "Usage: ImageScraper [ -d Directory Name ] [ -r ] [ -w Website URL ]" #Sample usage string returned when -h | --help is used
}

[ -d ImagePull ] || mkdir ImagePull #If there is no ImagePull directory then one is created

cd ImagePull #Change directory to ImagePull

while [ "$1" != "" ]; do #While there are command line arguements
  case "$1" in
    -d | --directory )  shift #Creates a new directory with give name and switches to it
                        mkdir $1
                        cd $1
                        ;;
    -h | --help )       usage #Gives help
                        exit
                        ;;
    -r | --recursive )  recursive=1 #Sets recursive to 1
                        ;;
    -w | --website )    shift #Changes site variable to given URL
                        site=$1
                        ;;
    * )                 usage #Unknown arguement so usage is called
                        exit 1
  esac
  shift
done

if [ "$recursive" = "1" ]; then #This searches site recursively if recursive is 1
  wget -r -nd -H -p -A jpg,jpeg,png,gif -e robots=off "$site"
else #this is the standard one page image scrape
  wget -nd -H -p -A jpg,jpeg,png,gif -e robots=off "$site"
fi

ls -l -h | sort | less #This line creates a sorted list of all the images and pipes them into a less to allow easy reading of all the images you just scraped
