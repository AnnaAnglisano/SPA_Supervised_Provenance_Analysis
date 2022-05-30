stack_function<-function(model_list,BASE,seed=101,inf_group=TRUE){
  set.seed(seed)
  all_train<-sapply(model_list,function(x) {predict(x,BASE,type="raw")})
  all_train_df<-as.data.frame(all_train)
  if(inf_group){all_train_df<-cbind(all_train_df,group=BASE$group)}else{all_train_df}
}

bbdd_print<-function(BASE,BASE_STACK,predicciorf1,probstak){
  BASE_IMPRIMIR<-data.frame(c(BASE,BASE_STACK))
  BASE_IMPRIMIR$PRED_STAK<-predicciorf1
  names(probstak)<-paste("STK",names(probstak),sep="_")
  BASE_IMPRIMIR<-as.data.frame(c(BASE_IMPRIMIR,probstak))
  return(BASE_IMPRIMIR)
}


stack_function_prob<-function(model_list,BASE,seed=101,inf_group=TRUE){
  set.seed(seed)
  all_train<-sapply(model_list,function(x) {predict(x,BASE,type="prob")})
  all_train_df<-as.data.frame(all_train)
  model_names<-names(all_train_df)
  d<-dim(all_train)
  #totes les prob menos el primer grup per evitar correlacio de dades
  all_train_df_prob<-as.data.frame(all_train[,model_names[1]])
  names(all_train_df_prob)<-paste(model_names[1],names(all_train_df_prob),sep="_")
    for (i in model_names[!is.element(model_names,model_names[1])]){
      sub_df<-as.data.frame(all_train[,i])
      names(sub_df)<-paste(i,names(sub_df),sep="_")
      
      all_train_df_prob<-as.data.frame(c(all_train_df_prob,sub_df))
      
    }

  if(inf_group){all_train_df_prob<-cbind(all_train_df_prob,group=BASE$group)}else{all_train_df_prob}
}