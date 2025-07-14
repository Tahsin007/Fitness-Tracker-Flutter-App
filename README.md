# Fitness Tracker App

A comprehensive Flutter-based mobile application designed to help users track their fitness goals, monitor their progress, and stay motivated.

## Features

*   **User Authentication:** Secure sign-up and login functionality using Firebase Authentication.
*   **Goal Setting:** Set and manage fitness goals, such as weight, steps, and workout frequency.
*   **Activity Tracking:** Log daily activities, including workouts, meals, and water intake.
*   **Progress Monitoring:** Visualize progress with interactive charts and graphs.
*   **Personalized Dashboard:** A central hub for users to view their daily summary and progress at a glance.
*   **Onboarding Experience:** A smooth and engaging onboarding process for new users.

## Folder Structure

The project follows a feature-based folder structure to maintain a clean and scalable codebase.

```
lib/
├── core/
│   ├── constants/      # Application-wide constants
│   ├── di/             # Dependency injection setup
│   ├── error/          # Error handling utilities
│   ├── theme/          # Application theme and styling
│   └── widgets/        # Reusable widgets
├── features/
│   ├── auth/           # Authentication-related features (login, signup)
│   ├── home/           # Home screen and dashboard
│   └── onboarding/     # Onboarding screens
├── main.dart           # Application entry point
└── router.dart         # Routing logic
```

## Architecture

This application is built using the **BLoC (Business Logic Component)** pattern to separate business logic from the UI. This promotes a clean and testable architecture.

*   **BLoC:** Manages the state of the application and handles business logic.
*   **Dependency Injection:** Utilizes the `get_it` package for service locator-based dependency injection, making it easy to manage dependencies and mock them for testing.
*   **GoRouter:** Handles navigation and routing within the application.

## Dependencies

The project relies on the following key packages:

*   **`flutter_bloc`:** For state management using the BLoC pattern.
*   **`get_it`:** For dependency injection.
*   **`go_router`:** For declarative routing.
*   **`firebase_core`:** To connect to the Firebase project.
*   **`firebase_auth`:** For user authentication.
*   **`cloud_firestore`:** To store and manage user data.
*   **`equatable`:** To compare objects for equality.
*   **`dartz`:** For functional programming constructs.
*   **`google_fonts`:** To use custom fonts from Google Fonts.
*   **`fl_chart`:** For creating beautiful charts and graphs.
*   **`shared_preferences`:** For local data storage.

For a complete list of dependencies, please refer to the `pubspec.yaml` file.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
*   A code editor like Android Studio or VS Code with the Flutter plugin.

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/your_username/fitness_tracker.git
    ```
2.  Install packages
    ```sh
    flutter pub get
    ```

### Running the App

1.  Make sure you have a device or emulator running.
2.  Run the app
    ```sh
    flutter run
    ```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

Don't forget to give the project a star! Thanks again!