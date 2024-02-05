#!/bin/bash

list_subscription() {
    #Get all availabe subscription
    subscriptions=($(az account list --query [].id --output tsv))
    echo "Available Subscritions"
    for subscription in ${subscriptions[@]}; do
        echo "$subscription"
    done
}

select_subscription() {
    #Set Azure subscription
    local subscription_exist=false
    while [ $subscription_exist = false ]; do
        for i in ${subscriptions[@]}; do
        read -p "Enter subscription id: " selected_subscription
            if [ "$selected_subscription" == "$i" ]; then
                echo "Subscription exist"
                subscription_exist=true
                #Set the subscrption
                az account set --subscription "$selected_subscription"
                echo "Switched to selected subscription"
                break
            else
                echo "Invalid subscription, try again "
                continue
            fi
        done
    done


}

list_subscription
select_subscription