## DOWNLOAD THE SWIFTKEY DATA FROM COURSERA WEBSITE


data.source <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-Swiftkey.zip"
data.destination <- "Coursera-Swiftkey.zip"

download.file(data.source, data.destination) ## download

unzip(data.destination)  ## extraction