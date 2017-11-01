source("pf/Unity.R")
source("pf/Linear.R")
source("pf/Sqrt.R")

  x <- seq(0, 0.99, 0.01);
  par(mfrow=c(1, 3))
  plot(x, Unity(x), type = "l", frame.plot=FALSE, ann=FALSE, xlim=c(0, 1), ylim=c(0.5, 1.5))
  title("Unity")
  plot(x, Linear(x), type = "l", asp=1, frame.plot=FALSE, ann=FALSE, xlim=c(0, 1),  ylim=c(0, 1))
  title("Linear")
  plot(x, Sqrt(x), type = "l", asp=1, frame.plot=FALSE, ann=FALSE, xlim=c(0, 1), ylim=c(0, 1))
  title("Sqrt")
