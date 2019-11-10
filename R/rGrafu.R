#' This function is used to to generate summary tables and graphs showing frequencies and percentages.
#'
#' @param data  The data to be used
#' @param group_var The variable that you want to analyse
#' @param xlab The x axis label
#' @param flip TRUE/FALSE: Whether the graph should be flipped or not
#' @param title The title of your graph
#' @param theme The theme you want to use for your graphs
#'
#' @return A table and a graph
#' @export
#'
#' @examples rGraf(data = wafanyikazi,group_var = Gender, xlab = "Gender",flip = FALSE, theme = theme_bw(), title = "Distribution of Gender")

#'
rGraf<-function(data, group_var, xlab, flip, theme, title){

  ## Summary table
  summ_table<-data%>%
    group_by({{ group_var }}) %>%
    summarise(count = n())%>%
    filter(!is.na({{ group_var }})) %>%
    mutate(perc = round((count/sum(count)*100),0))


  #print(summ_table)
  print(kable_styling(kable(summ_table,col.names = c(xlab,"Frequency","Percentage")),bootstrap_options = "striped", full_width = F))


  ## Frequency Graph
  bargraph<- ggplot(data=summ_table, aes(x={{ group_var }}, y = perc)) +
    geom_bar(stat = "identity",fill = "#154360") +
    theme+
    #theme(axis.text.x =element_text(angle = 25))+
    labs(title =paste("",title, sep=" "),x = xlab, y = "Percentage")

  if(flip == TRUE){
    bargraph=ggplot(data=summ_table, aes_string(x= paste0("reorder(",colnames(summ_table)[1],", perc)")  , y = "perc")) +
      geom_bar(stat = "identity",fill = "#154360") +
      theme+
      #theme(axis.text.x =element_text(angle = 25))+
      labs(title =paste("",title, sep=" "),x = xlab, y = "Percentage")+
      geom_text(aes(label = perc), family="Source Sans Pro Semibold",
                vjust = 0.5,hjust = -0.5, size = 5)+
      coord_flip()+
      ylim(c(0,max(summ_table$perc + 10)))
  }else
    {
    bargraph=bargraph+
      geom_text(aes(label =perc),vjust = -0.25, size = 5)
}
  print(bargraph)
}

rGraf(data = wafanyikazi,group_var = Gender, xlab = "Gender",flip = FALSE, theme = theme_bw(), title = "Distribution of Gender")
