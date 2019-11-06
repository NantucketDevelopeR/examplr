nr_desc <-  function(x){
  if (!inherits(x, "phylo")){
    stop("This function only works on trees of class phylo!")
  }
  x <- reorder(x, "postorder")
  res <- numeric(max(x$edge))
  res[1:Ntip(x)] = 1L
  for(i in 1:nrow(x$edge)){
    tmp = x$edge[i,1]
    res[tmp] =  res[tmp] + res[x$edge[i,2] ]
  }
  res
}

root_to_tip <-  function(x){
  x <- reorder(x)
  res <- numeric(max(x$edge))
  for(i in 1:nrow(x$edge)){
    pa <- x$edge[i,1]
    ch <- x$edge[i,2]
    res[ch] =  res[pa] + x$edge.length[i]
  }
  res
}
