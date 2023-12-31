#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Login screen
LOGIN_SCREEN () {
  # If function called with argument
  if [[ $1 ]]
  then

    # Print argument
    echo -e "\n$1"
  fi

  # Ask for username
  echo -e "\nEnter your username:"
  read USERNAME

  # Get user_id from database
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

  # If doesn't exist
  if [[ -z $USER_ID ]]
  then

    # Welcome user
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    # Add to database
    ADD_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")

    # Fetch new user_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
    
    # Go to game
    GAME "$USER_ID" "$USERNAME" "0" "0"
    return


  fi
  # Fetch games_played and best number of guesses from database
  USER_INFORMATION=$($PSQL "SELECT games_played, best_game FROM users WHERE user_id = $USER_ID")
  
  IFS="|" read -r GAMES_PLAYED BEST_NUMBER_GUESSES <<< $USER_INFORMATION

  # Display user information
  echo -e "\nWelcome back, $(echo $USERNAME | sed -E 's/^ *| *$//g')! You have played $(echo $GAMES_PLAYED | sed -E 's/^ *| *$//g') games, and your best game took $(echo $BEST_NUMBER_GUESSES | sed -E 's/^ *| *$//g') guesses."

  # Go to game
  GAME "$USER_ID" "$USERNAME" "$GAMES_PLAYED" "$BEST_NUMBER_GUESSES"
}

GAME () {
  USER_ID=$1
  USERNAME=$2
  GAMES_PLAYED=$3
  BEST_NUMBER_GUESSES=$4
  GUESSES=0


  # Generate random number between 1 and 1000 
  NUMBER_TO_GUESS=$(( $RANDOM % 1000 + 1 ))

  # Display game message
  echo -e "\nGuess the secret number between 1 and 1000:"

  # Input while loop
  while true
  do
    # Increment number of guesses
    let "GUESSES++"

    # Ask for user input
    read NUMBER

    # If input isn't an integer 
    if [[ ! $NUMBER =~ ^[0-9]+$ ]]
    then 

      # Print error message
      echo -e "\nThat is not an integer, guess again:"

      # Ask for input again
      continue
    fi

    # If input is higher than number
    if [[ $NUMBER -gt $NUMBER_TO_GUESS ]]
    then

      # Display appropriate message
      echo -e "\nIt's lower than that, guess again:"

      # Ask for input again
      continue
    fi

    # Else if input is lower than number
    if [[ $NUMBER -lt $NUMBER_TO_GUESS ]]
    then

      # Display appropriate message
      echo -e "\nIt's higher than that, guess again:"

      # Ask for input again
      continue
    fi

    # Display congrats message and exit the loop
    echo -e "\nYou guessed it in $(echo $GUESSES | sed -E 's/^ *| *$//g') tries. The secret number was $(echo $NUMBER_TO_GUESS | sed -E 's/^ *| *$//g'). Nice job!"

    # Add game to database
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_guesses) VALUES($USER_ID, $GUESSES)")

    # If number of games played is zero or this game has lower guesses
    if [[ $GAMES_PLAYED = 0 ]] || [[ $GUESSES -lt $BEST_NUMBER_GUESSES ]]
    then

      # Update user's best_game
      UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $GUESSES WHERE user_id = $USER_ID")
    fi
    # Insert incremented number of games to database
    INCREMENT_NUMBER_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")
    

    break
  done

}

LOGIN_SCREEN "~~~~ Welcome to the number guessing game ~~~~"
