#8
# Sample Space
cards = 52

# Outcomes
aces = 4

# Divide possible outcomes by the sample set
ace_probability = aces / cards

# Print probability rounded to two decimal places
print(round(ace_probability, 2))

#42

# Sample Space
cards = 52

# Determine the probability of drawing a heart
hearts = 13
hearts_probability = hearts/cards

print(round(hearts_probability,2))



#44
# Create function that returns probability percent rounded to one decimal place
def event_probability(event_outcomes, sample_space):
    probability = (event_outcomes / sample_space) * 100
    return round(probability, 1)

# Sample Space
cards = 52

# Determine the probability of drawing a heart
hearts = 13
heart_probability = event_probability(hearts, cards)

# Determine the probability of drawing a face card
face_cards = 12
face_card_probability = event_probability(face_cards, cards)

# Determine the probability of drawing the queen of hearts
ace_of_hearts = 1
ace_of_hearts_probability = event_probability(ace_of_hearts, cards)

# Print each probability
print(str(heart_probability) + '%')
print(str(face_card_probability) + '%')
print(str(ace_of_hearts_probability) + '%')


#46

# Sample Space
cards = 52
hole_cards = 2
turn_community_cards = 4
cards = cards - (hole_cards + turn_community_cards)

# Outcomes
diamonds = 13
diamonds_drawn = 4
# In poker, cards that complete a draw are known as "outs"
outs = diamonds - diamonds_drawn

#Determine river flush probability
river_flush_probability = event_probability(outs, cards)
print(river_flush_probability)