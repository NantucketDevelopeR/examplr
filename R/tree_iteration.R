#' Root-to-tip calculates the distance between the root and each node
#'
#' Root-to-tip calculates distance from root of phylogenetic tree object
#' to each tip. Returns a vector of distances.
#'
#' @param x Tree of class 'phylo'
#' @return A vector of root distances (numeric)
#' @examples
#' sample_tree <- ape::rtree(5)
#' root_to_tip(sample_tree)
#' @export

root_to_tip <-  function(x){
  x <- ape::reorder.phylo(x)
  res <- numeric(max(x$edge))
  for(i in 1:nrow(x$edge)){
    pa <- x$edge[i,1]
    ch <- x$edge[i,2]
    res[ch] =  res[pa] + x$edge.length[i]
  }
  res
}
