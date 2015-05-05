# ImageScraper
Simple BASH program that uses wget to pull images off of a website, done to prove a point to a friend

Usage: ImageScraper [ -d DIRECTORY ] [ -r ] [ -w WEBSITE URL ]

-w [ --website ]   : Use this to specify a website, if not then a placeholder website is used (www.tickld.com/all/hot)
-d [ --directory ] : Specify a directory for the images to go in, if none is specified they end up in a group directory called ImagePull
-r [ --recursive ] : Use if you want wget to search recursively, which is across a whole website, good for small sites, not for meme sites

OPTIONAL

-h [ --help ]: returns the usage string
