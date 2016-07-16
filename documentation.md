<b>Main Features:</b>     
• This is a Shiny app that accepts a typed input from the user and suggests the most probable word that will occur next.     
• The project was developed using Natural Language Processing, Text Mining, and Statistical Inference.     
• The data for this application comes from SwiftKey.     
• The R packages used to implement this application are the following:    
    1) tm → Text Mining in R     
    2) hash → Hash/associative array/dictionary data structure for the R language     
    3) ggplot2 → Elegent Graphics for Data Analysis     
    4) dplyr → A Grammar of Data Manipulation
<br></br>
<b>Development:</b>     
The development phase can be accessed through both the Github repository containing the pertenent files, as well as the Milestone Report published on RPubs.     
• Github: https://github.com/minuseighty/CapstoneDataScienceProject     
• Milestone Report:  https://rpubs.com/zainilj/190536     
<br>
<b>Algorithms</b>     
I have implemented several algorithms and combined them using a Katz-backoff algorthm. These are:     
• Unigram MLE (Maximum Likelihood Estimator) - predicting single words based on frequency counts. Not very useful on it's own but a basis for others.     
• Bigram - predictions using SGT <a href = "https://en.wikipedia.org/wiki/Good%E2%80%93Turing_frequency_estimation">(Simple Good Turing)</a> probability that backs off to Unigram MLE.     
• Trigram - predictions using SGT probability that backs off to Bigram SGT.     
• Quadgram - predictions using SGT probability that backs off to Trigram SGT.     
• Stupid Back-off - Simply reverts to the previous n-1 gram to predict the likelihood of occurance. This is the weakest predictor but also the gives the best performance for a Shiny App.     

<b>References</b>     
<a href = "https://www.jstatsoft.org/article/view/v025i05">Text Mining</a>     
<a href = "https://cran.r-project.org/web/views/NaturalLanguageProcessing.html">Natural Language rocessing</a>           
<a href = "https://www.coursera.org/learn/data-science-project/home/welcome">Coursera Data Science</a>     
<a href = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip">Swiftkey Data</a>     

