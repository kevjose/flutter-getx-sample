# flutter_getx_sample

A new Flutter project built using getX.

## Getting Started

This project uses getX for reactive state management, routing and other most commonly used widgets like snackbar

## Overview of project

All major moving parts are with the `/lib` directory and should be considered the base directory while development is concerned

`/main.dart`

- contains info for maintaining the state of the app for the user. It initializes firebase, sets up routing.

`/controllers/`

- auth_controller.dart — our user and authentication functions for logging in and out our user.

`/models/`

- user_model.dart — contains the model for our firebase user.

`/views/`

- root_screen.dart - decides to show login or home screens
- home_screen.dart
- login_screen.dart

`/helpers/`

- theme.dart - maintains overall theme
- helpers.dart - abstraction for getX utils themed as per apps requirement
