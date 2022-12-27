import numpy as np

def month_hall():

    [[selected_door,winning_door]]=np.random.random_integers(low=1,high=3,size=(1,2))
    print([[selected_door,winning_door]])


    door_options=[1,2,3]

    if selected_door==winning_door:
        door_options.remove(selected_door)
        open_door=np.random.choice(door_options)
        switching_door=door_options.remove(open_door)
        print("You have selected door ", open_door)
        print("Oops, the car was behind door ",winning_door)



    else:
        door_options.remove(selected_door)
        door_options.remove(winning_door)
        open_door=door_options

        switching_door=winning_door
        print("You have selected door ",selected_door)
        print("Oops, the car was behind door ",winning_door)




    if switching_door==winning_door:
        switch=1
        non_switch=0

    else:
        switch=0
        non_switch=1

        return(switch, non_switch)


month_hall()
