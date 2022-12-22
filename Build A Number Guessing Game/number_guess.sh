#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

WELCOME() {
  # greetings to the user
  # ask the username
  echo Enter your username:
  read USERNAME

  # query username
  USERNAME_QUERY=$($PSQL "SELECT username FROM player WHERE username = '$USERNAME'")
  # if username not in database
  if [[ -z $USERNAME_QUERY ]]
  then
    # insert username into player table
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    REGISTER_PLAYER=$($PSQL "INSERT INTO player(username) VALUES('$USERNAME')")
  # else
  else
    # query player info
    PLAY_TIMES=$($PSQL "SELECT MAX(play_times) FROM player INNER JOIN game USING(player_id) WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(total_guess) FROM game INNER JOIN player USING(player_id) WHERE username = '$USERNAME'")
    
    # print Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
    echo "Welcome back, $USERNAME! You have played $PLAY_TIMES games, and your best game took $BEST_GAME guesses."
    
    
  fi 
  INIT_GAME
}



INIT_GAME() {
  # generate random number
  SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
  # insert random numer into secret table
  INSERT_SECRET=$($PSQL "INSERT INTO secret(secret_number) VALUES($SECRET_NUMBER)")

  # query game id (now)
  GAME_ID=$($PSQL "SELECT MAX(game_id) FROM secret")
  # query player_id (now)
  PLAYER_ID=$($PSQL "SELECT player_id FROM player WHERE username = '$USERNAME'")

  # insert game_id and player_id into game
  INSERT_ID=$($PSQL "INSERT INTO game(game_id, player_id) VALUES($GAME_ID, $PLAYER_ID)")

  # start the game
  # initialize guesses variable to count player total guesses default 0
  INIT_GUESS=0

  GUESSING $1
}

GUESSING () {
  
  if [[ $1 ]]
  then
    echo "$1"
  else
    # print Guess the secret number between 1 and 1000:
    echo Guess the secret number between 1 and 1000:
  fi
  # read the user input
  read GUESS  
  # if user input not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESSING 'That is not an integer, guess again:'
  # else
  else
    # if user input > secret number
    if [[ $GUESS > $SECRET_NUMBER ]]
    then
      # guesses += 1
      INIT_GUESS=$(($INIT_GUESS + 1))
      # print It's lower than that, guess again:
      GUESSING "It's lower than that, guess again:"
    # elif user input < secret number
    elif [[ $GUESS < $SECRET_NUMBER ]]
    then
      # guesses += 1
      INIT_GUESS=$(($INIT_GUESS + 1))
      # print It's higher than that, guess again:
      GUESSING "It's higher than that, guess again:"
    # else 
    else
      # print You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
      INIT_GUESS=$(($INIT_GUESS + 1))
      echo "You guessed it in $INIT_GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"
      # update play times 
      # insert into game
      UPDATE_TOTAL_GUESS=$($PSQL "UPDATE game SET total_guess = $INIT_GUESS WHERE game_id = $GAME_ID")
      NEW_PLAY_TIMES=$(($PLAY_TIMES + 1))
      UPDATE_PLAY_TIMES=$($PSQL "UPDATE player SET play_times = $NEW_PLAY_TIMES WHERE username = '$USERNAME'")
    fi
  fi
}

WELCOME
