
imprimeix<-function(nom,df){
  #chek existeix carpeta OUTPUT
  lf<-list.files()
  if(!is.element("OUTPUT",lf)){
    dir.create("OUTPUT")
  }
  write.table(x=df,
              file=paste("OUTPUT",nom,sep="/"),
              quote=FALSE,
              sep=";",
              row.names = FALSE)
  
}
