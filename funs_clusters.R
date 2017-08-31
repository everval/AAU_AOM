get_cent = function(x,ind,K){
  N = length(ind)
  M = ncol(x)
  
  C = matrix(0,K,M)
  for(i in 1:K){
    p = length(x[ind==i,])
    if( p > M){
      C[i,] = apply(x[ind==i,],2,mean)
    }
    else if( p == M){
      C[i,] = x[ind==i,]
    }
    else{
      C[i,] = NaN
    }
  }
  return(C)
}

calc_cent = function(x,C){
  N = nrow(x)
  K = nrow(C)

  ind = rep(0,N)
  for(i in 1:N){
    aux = rep(0,K)
    for(j in 1:K){
     aux[j] = dist(x[i,]-C[j,],method="euclidean")
    }
    ind[i] = which.min(aux)
  }
  return(ind)
}