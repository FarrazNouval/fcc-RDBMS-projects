#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

APP() {
  # welcome section
  # if there is an argument
  if [[ $1 ]]
  then
    # check the argument type
    # if the argument is number
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      # get the information
      INFORMATION=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1;")
      # if the argument is not in database
      if [[ -z $INFORMATION ]]
      then
        # inform to user that the argument is not in our database
        echo I could not find that element in the database.
      # if the argument is in our database
      else
        # deliver information to the user
        echo "$INFORMATION" | while read TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
        done
      fi
    # else if argument is symbol or name
    elif [[ $1 =~ ^[A-Za-z]+$ ]]
    then
      # get the information
      INFORMATION=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1';")
      # if the argument is not in database
      if [[ -z $INFORMATION ]]
      then
        echo I could not find that element in the database.
      # if the argument is in database
      else
        echo "$INFORMATION" | while read TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
        done
      fi
    fi
  else
    # if there is no any arguments inserted
    # ask the user to insert an argument
    echo Please provide an element as an argument.
  fi
}

APP $1
