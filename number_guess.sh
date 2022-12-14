#! /bin/bash

# Database connection
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c "

# Greeting the user
echo -e "\n~~~~~~~ Number Guessing Game ~~~~~~~\n"

# Get user info
echo -e "\nEnter your username:"
read USERNAME

# bring user data
USER_EXISTS=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN guesses USING (user_id) WHERE username = '$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(best_game) FROM users INNER JOIN guesses USING (user_id) WHERE username = '$USERNAME'")

# check if user exists
if [[ -z $USER_EXISTS ]]
then
  # if user is new
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  # insert new user
  INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
else
  # greet returning user
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate random number between 1 and 1000
RAND_NUM=$((1 + $RANDOM % 1000))
# start the count
GUESS=1
# Instructions for the user
echo -e "\nGuess the secret number between 1 and 1000:"

# loop until the number is guessed
while read GUESS_NUMBER
do
  # check the input is a positive INT number
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    # if it's equal
    if [[ $GUESS_NUMBER -eq $RAND_NUM ]]
    then
      break;
    else
      # if it's greater than
      if [[ $GUESS_NUMBER -gt $RAND_NUM ]]
      then
        echo -n "It's lower than that, guess again:"
        # if it's lower than
        elif [[ $GUESS_NUMBER -lt $RAND_NUM ]]
        then
          echo "It's higher than that, guess again:"
      fi
    fi
  fi
  # increment the count
  GUESS=$(( $GUESS + 1 ))
done

# prompting the result
if [[ $GUESS == 1 ]]
then
  echo "You guessed it in $GUESS tries. The secret number was $RAND_NUM. Nice job!"
else
  echo "You guessed it in $GUESS tries. The secret number was $RAND_NUM. Nice job!"
fi

# get the user id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
# insert the results of the game
INSERT_GAME=$($PSQL "INSERT INTO guesses (best_game, user_id) VALUES ($GUESS, $USER_ID)")
