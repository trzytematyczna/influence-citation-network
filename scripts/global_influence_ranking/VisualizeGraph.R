VisualizeGraph <- function(g, gpr) {
  par(mfrow=c(1, 2))
  layout <- layout_in_circle(g, order=order(V(g)$ema))
  plot(g, 
       vertex.size=rank(V(g)$ema)*0.5,
       edge.arrow.size=.2, 
       layout=layout,
       vertex.label.color="navy",
       vertex.label.cex=1.2)
  title('EMA average')
  
  layout_gpr <- layout_in_circle(gpr, order=order(V(gpr)$pagerank))
  plot(gpr,
       vertex.size=rank(V(gpr)$pagerank)*0.5,  #(seq(20, (20-35*0.35), -0.35)),
       layout=layout_gpr,
       vertex.label.color="navy",
       vertex.label.cex=1.2)
  title('PageRank')
}