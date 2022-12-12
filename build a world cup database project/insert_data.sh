#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# truncate all tables
echo $($PSQL "TRUNCATE games, teams")

# insert all teams names into  teams test table
cat games.csv | while IFS=',' read YEARS ROUNDS WINS OPP WG OG
do
  # exclude the first line of the file
  if [[ $YEARS != 'year' ]]
  then
    # get winner id and opponent id
    WINS_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINS'")
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")

    # if not found insert winner and opponent teams names into teams table
    if [[ -z $WINS_ID ]]
    then
      INSERT_WIN=$($PSQL "INSERT INTO teams(name) VALUES('$WINS')")
      if [[ $INSERT_WIN == 'INSERT 0 1' ]]
      then
        echo inserted win into teams, $WINS
      fi
    fi
    if [[ -z $OPP_ID ]]
    then
      INSERT_OPP=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
      if [[ $INSERT_OPP == 'INSERT 0 1' ]]
      then
        echo inserted opp into teams, $OPP
      fi
    fi
  fi

done

# input data into games table
cat games.csv | while IFS=',' read YEARS ROUNDS WINS OPP WG OG
do
  # exclude the first line of the file
  if [[ $YEARS != 'year' ]]
  then
    # get the winner and opponent id
    WINS_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINS'")
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'") 

    # insert games data into games table in our worldcup database
    INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, opponent_goals, winner_goals, opponent_id, winner_id) VALUES($YEARS, '$ROUNDS', $OG, $WG, $OPP_ID, $WINS_ID)")
    if [[ $INSERT_GAMES == 'INSERT 0 1' ]]
    then
      echo inserted $YEARS, $ROUNDS, $OG, $WG, $OPP_ID, $WINS_ID
    fi
  fi  
done
