Sure! Here is the updated README file with a section to download the APK file.

---

# Flutter Assessment for Mobile Developer Role at Busha

## Overview

This is a Flutter project designed with a clean and modular structure. The project aims to provide a seamless user experience with the integration of various Flutter packages for enhanced functionality.

## Project Structure

```plaintext
lib
├── core
│   ├── const
│   ├── models
│   └── widget
├── screens
│   ├── bottomNav
│   ├── home_page.dart
│   ├── signIn_page.dart
│   ├── transaction_details_page.dart
│   └── transaction_list_page.dart
├── service
│   └── get_block_service.dart
├── .env
└── main.dart
```

- **core**: Contains core functionalities and utilities like constants, models, and reusable widgets.
- **screens**: Contains all the UI screens of the application.
  - **bottomNav**: Contains the bottom navigation components.
  - **home_page.dart**: Home screen of the application.
  - **signIn_page.dart**: Sign-in screen for user authentication.
  - **transaction_details_page.dart**: Screen showing details of a specific transaction.
  - **transaction_list_page.dart**: Screen listing all transactions.
- **service**: Contains service classes for API calls and data fetching.
  - **get_block_service.dart**: Service class for fetching block-related data.
- **.env**: Environment file for managing sensitive configurations.
- **main.dart**: Entry point of the application.

## Demo Video

[![Watch the demo video](https://img.youtube.com/vi/YOUR_VIDEO_ID/maxresdefault.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)

Click the image above to watch the demo video.

## Download APK

You can download the latest release of the application from the link below:

[Download app-release.apk](build/app/outputs/flutter-apk/)

## Packages Used

- **cupertino_icons**: ^1.0.6
- **gap**: ^3.0.1
- **flutter_svg**: ^2.0.10+1
- **http**: ^1.2.1
- **flutter_riverpod**: ^2.5.1
- **logger**: ^2.3.0
- **shared_preferences**: ^2.2.3
- **flutter_dotenv**: ^5.1.0
- **intl**: ^0.19.0

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/your-repository.git
```

2. Navigate to the project directory:

```bash
cd your-repository
```

3. Install the dependencies:

```bash
flutter pub get
```

### Running the Project

1. Ensure a device is connected or an emulator is running.
2. Run the project:

```bash
flutter run
```

## Configuration

The project uses the `.env` file to manage environment-specific configurations. Ensure you have this file set up with the necessary environment variables before running the project.

## Contribution

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Replace `YOUR_VIDEO_ID` with the actual YouTube video ID for the demo video link, and make sure the APK file is available at the specified path in your repository.
