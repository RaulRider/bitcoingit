import sys #this allows you to use the sys.exit command to quit/logout of the application

def menu():
    print("************MAIN MENU**************")
    #time.sleep(1)
    print()

    choice = input("""
                      U: UPDATE Channels from eclair to channels.json
                      L: LOAD channels from channels.json
                      P: PRINT channels list
                      D: DETAILED info of channels
                      Q: Quit/Log Out

                      Please enter your choice: """)

    if choice == "U" or choice =="u":
        update_channels()
    elif choice == "L" or choice =="l":
        load_channels()
    elif choice == "P" or choice =="p":
        print_channels()
    elif choice=="D" or choice=="d":
        print_details()
    elif choice=="Q" or choice=="q":
        sys.exit
    else:
        print("You must only select either A,B,C, or D.")
        print("Please try again")
        menu()

def update_channels(): #UPDATES FROM ECLAIR AND GENERATES CHANNELS.TXT - CHANNELS.JSON - RETURNS NOTHING
    pass
      

def load_channels(): #READS CHANNELS.JSON AND RETURNS THE JSON 
    pass

    
def print_channels(channels_list=[]): #FORMAT PRINTS ON SCREEN THE LIST PASSED INTO IT
    pass
    #Teacher can input an ID number and display the relevant student's details


def print_details(channels_list=[], position=int(0)):
    if position == 0:
        # IMPRIMIMOS TODOS LOS CHANALES EN DETALLE
    elif:
        # IMPRIMIMOS SOLO EL ELEMENTO channel_list[position]
    pass
    

    
#the program is initiated, so to speak, here
menu()
