# Exercice 1

salaire_net_cadre = function(salaire_brut=2500, temps_de_travail = 1){
  if(! is.numeric(salaire_brut)){
    return("erreur, la valeur du salaire brut n'est pas une valeur numérique")}
  
  if(! is.numeric(temps_de_travail)){
    return("erreur, la valeur du temps de travail n'est pas une valeur numérique")}
  
  if (temps_de_travail>1 | temps_de_travail<0){
    return("erreur, le temps de travail doit être comprise entre 0 et 1")
  }
  
  salaire_resultat = salaire_brut*0.75*temps_de_travail
  return(salaire_resultat)
  
}

#mettre l'argumentdans la fonction si on veut une valeur quand l'utilisateur ne renseigne rien
# mettre | pour avoir un ou

salaire_net_cadre(salaire_brut =  4000, temps_de_travail =0.5)



salaire_net = function(salaire_brut=2500, temps_de_travail = 1, statut){
  if(! statut %in% c("cadre" , "non cadre")){
    return("erreur,le statut n'est pas cadre ou non cadre")
  }
  if(! is.numeric(salaire_brut)){
    return("erreur, la valeur du salaire brut n'est pas une valeur numérique")
  }
  
  if(! is.numeric(temps_de_travail)){
    return("erreur, la valeur du temps de travail n'est pas une valeur numérique")
  }
  
  if (temps_de_travail>1 | temps_de_travail<0){
    return("erreur, le temps de travail doit être comprise entre 0 et 1")
  }
  
  if( statut == "cadre"){
    salaire_resultat = salaire_brut*0.75*temps_de_travail
  }else{
    salaire_resultat = salaire_brut*0.78*temps_de_travail
    }
  
  return(salaire_resultat)
  
}




salaire_net(salaire_brut =  4000 ,
            temps_de_travail = 0.8,
            statut = "cadre")




















