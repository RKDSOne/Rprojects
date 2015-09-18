# Define deck of 52 cards
cards = paste(rep(c("A", 2:10, "J", "Q", "K"), 4), c("H", "D", "S", "C"))

# Start the clock!
ptm = proc.time()

# Do till we find a pair
notFound = TRUE
iterations = 0
while (notFound) {
  # Pick a sample of cards
  x = sample(cards, 5)
  
  # Check if pair exists
  for (i in x) {
    for (j in x[x != i]) {
      card1 = unlist(strsplit(i, " "))
      card2 = unlist(strsplit(j, " "))
      if (card1[1] == card2[1]) {
        print(card1)
        print(card2)
        notFound = FALSE
        break
      }
    }
    
    if (!notFound){
      break
    }
  }
  
  # Increment iterations
  iterations = iterations + 1
}

# Stop the clock
proc.time() - ptm

# Print the iterations
cat("Number of iterations: ", iterations)