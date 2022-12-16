#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e '\n~~~~~ MY SALON ~~~~~\n'

SALON () {
  # if there is argument
  if [[ $1 ]]
  then
  # print argument
    echo -e "\n$1"
  else
  # else print welcome
    echo -e "welcome to my salon. there is our services"
  fi

  # print services to the customers
  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done

  # get selected service id from customer
  read SERVICE_ID_SELECTED
  SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # if the selected is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # return the customer to the main menu
    SALON "please type a number not a letter"
  
  # else if the selected service id is not in our data base
  elif [[ -z $SERVICE_ID_SELECTED ]]
  then
    SALON "i'm sorry you selected the wrong service id"
  
  # else 
  else
    # get customer phone number
    echo -e '\nYour phone number please'
    read CUSTOMER_PHONE
    PHONE=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # if customer phone number is not in our database
    if [[ -z $PHONE ]]
    then
    # get customer name
      echo -e '\nYour name please'
      read CUSTOMER_NAME
      # insert customer datainto customers database
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      # if inserted successfully
      if [[ $INSERT_CUSTOMER == "INSERT 0 1" ]]
      then
        # ask appointment time
        echo -e '\ntype appointment time'
        read SERVICE_TIME
        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        #insert into appointments
        INSERT_APPOINTMENTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        # if inserted succesfully
        if [[ $INSERT_APPOINTMENTS == "INSERT 0 1" ]]
        then
          # print customer name, service selected, and appointment time
          echo -e "\nI have put you down for a $SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
         else
          SALON "Please insert data correctly" 
        fi
      fi
    else
      # ask appointment time
      echo -e '\ntype appointment time'
      read SERVICE_TIME
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      #insert into appointments
      INSERT_APPOINTMENTS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      if [[ $INSERT_APPOINTMENTS == "INSERT 0 1" ]]
      then
        # print customer name, service selected, and appointment time
        echo -e "\nI have put you down for a$SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
      else
        SALON "Please insert data correctly" 
      fi
    fi
  fi
}

SALON
