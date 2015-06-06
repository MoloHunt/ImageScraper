#!/bin/bash

#Image Scraper, pulls all images from a given website

#Variables

 #Place holder web page
site='www.tickld.com/all/hot'
#Recursive is declared but not set
recursive= 

#Function
usage(){
  #Sample usage string returned when -h | --help is used
  echo "Usage: ImageScraper [ -d Directory Name ] [ -r ] [ -w Website URL ]" 
}
#If there is no ImagePull directory then one is created
[ -d ImagePull ] || mkdir ImagePull 

#Change directory to ImagePull
cd ImagePull 

#While there are command line arguements
while [ "$1" != "" ]; do 
  case "$1" in
  #Creates a new directory with give name and switches to it
    -d | --directory )  shift 
                        mkdir $1
                        cd $1
                        ;;
    -h | --help )       usage #Gives help
                        exit
                        ;;
  #Sets recursive to 1
    -r | --recursive )  recursive=1 
                        ;;
  #Changes site variable to given URL                      
    -w | --website )    shift 
                        site=$1
                        ;;
  #Unknown arguement so usage is called                      
    * )                 usage 
                        exit 1
  esac
  shift
done

#This searches site recursively if recursive is 1
if [ "$recursive" = "1" ]; then 
  wget -r -nd -H -p -A jpg,jpeg,png,gif -e robots=off "$site"
else 
  #this is the standard one page image scrape
  wget -nd -H -p -A jpg,jpeg,png,gif -e robots=off "$site"
fi

#This line creates a sorted list of all the images and pipes them into a less to allow easy reading of all the images you just scraped
ls -l -h | sort | less 
