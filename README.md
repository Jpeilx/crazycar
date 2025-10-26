# Crazy Car Mobile App

## Overview
This mobile app is part of my graduation project, showcasing my skills in Flutter development. The app features authentication, real-time Video Feed ,real-time car control,real time car camera control ,user tracking, and profile management.

## system Design

![image](https://github.com/user-attachments/assets/0856a510-7053-43ac-a699-0f7b104a71ce)

## Technical Skills Used
- Flutter framework
- clean architecture
- Notifications handling
- RESTful APIs
- Bloc as state management
- Responsive UI
- Dependency injection
- Singleton patte


## Features

### Auth Screens
- **Login**: Users can log in with their username and password. The password field includes a visibility toggle. Successful logins store the authentication token securely using Flutter secure storage.
- **Register**: Users can create an account with email, username, password, and confirm password fields. Successful registrations also store the authentication token securely.

 
  ![image](https://github.com/user-attachments/assets/1dc47f48-44ee-4380-903c-083f7513703f)


### Car Leading Options Screen
- Users can switch the car leading option between "mobile", "gloves", and "AI" by sending a character to our Flask server via an API.

  
![photo1720549818 (3)](https://github.com/user-attachments/assets/26bd8ab5-a844-4b03-afbf-88038d75f0c9)

### Car Controller and Live Feed Screen
- **Live Feed**: Displays live video from the car's movable camera using VLC player. Users can control the camera direction by swiping on the video.
- **Real-Time Tracking**: Displays available IDs for tracking, allowing users to set or reset the target.
- **Person Search**: Users can search for a specific person by name, prompting the car to move in different directions to locate them.
- **Joystick Controller**: Allows the car to move in various directions by mapping joystick inputs to the car's drivers.


  ![image](https://github.com/user-attachments/assets/a7c4d8e1-87ee-4ccf-9f45-6deeaa9194e8)


### Track New User Screen
- Users can enter a new username and ID, then start a live video stream to capture the new user's face and add them to the tracking AI list.


  ![image](https://github.com/user-attachments/assets/d0deb0e7-1660-4416-b813-59e2b3e420ec)


### Profile Screen
- Users can manage their app data, including avatar, email, phone number, and password.


![image](https://github.com/user-attachments/assets/51db2156-d190-4303-ae92-05b6a6b6628a)
