lines <- readLines(con="http://simplystatistics.tumblr.com", 150)
q2 <- c(nchar(lines[2]), nchar(lines[45]), nchar(lines[122]))
q2