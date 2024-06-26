# saitamasays

<p align="center">
  <img src="https://img.icons8.com/?size=512&id=55494&format=png" width="100" alt="project-logo">
</p>
<p align="center">
    <h1 align="center">SAITAMA-SAYS</h1>
</p>
<p align="center">
	<!-- Shields.io badges not used with skill icons. --><p>
<p align="center">
		<em>Developed with the software and tools below.</em>
</p>
<p align="center">
	<a href="https://skillicons.dev">
		<img src="https://skillicons.dev/icons?i=c,dart,gradle,java,kotlin,md,swift&theme=light">
	</a></p>

<br><!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary><br>

- [ Overview](#-overview)
- [ Features](#-features)
- [ Repository Structure](#-repository-structure)
- [ Modules](#-modules)
- [ Getting Started](#-getting-started)
  - [ Installation](#-installation)
  - [ Usage](#-usage)
  - [ Tests](#-tests)
- [ Project Roadmap](#-project-roadmap)
- [ Contributing](#-contributing)
- [ License](#-license)
- [ Acknowledgments](#-acknowledgments)
</details>
<hr>

##  Overview

"Saitama Says" is a Flutter mobile application designed to provide users with a collection of anime quotes. The app allows users to browse through a variety of quotes from different anime series and characters, offering a fun and entertaining experience for anime enthusiasts.

---

##  Features

Get Quotes: Users can access a wide range of anime quotes sourced from various anime series. The app retrieves quotes from an external API, ensuring a diverse selection for users to explore.

Save Quotes: Users have the option to save their favorite quotes within the app. This feature enables users to curate their personal collection of memorable quotes for future reference.

Random Quote Generator: The app includes a feature that generates random quotes for users who seek spontaneous inspiration or entertainment. With just a tap, users can discover new and intriguing quotes from their favorite anime series.

Share Quotes: Users can share their favorite quotes with friends and fellow anime enthusiasts through various social media platforms. This feature encourages engagement and interaction among users within the anime community.

Offline Access: The app offers offline access to saved quotes, ensuring that users can enjoy their favorite quotes even when they are not connected to the internet. This feature enhances the app's usability and convenience for users on the go.

---

##  Repository Structure

```sh
└── Saitama-Says/
    ├── Assets
    │   └── Saitama.png
    ├── README.md
    ├── analysis_options.yaml
    ├── android
    │   ├── app
    │   ├── build.gradle
    │   ├── gradle
    │   ├── gradle.properties
    │   ├── gradlew
    │   ├── gradlew.bat
    │   ├── local.properties
    │   ├── saitamasays_android.iml
    │   └── settings.gradle
    ├── ios
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   └── Runner.xcworkspace
    ├── lib
    │   ├── Colors
    │   ├── Database
    │   ├── Pages
    │   ├── SaitamaPhrases
    │   ├── Services
    │   ├── Widgets
    │   └── main.dart
    ├── pubspec.lock
    ├── pubspec.yaml
    └── saitamasays.iml
```

---

##  Modules

<details closed><summary>pubspec.yaml</summary>

| File                                                                                                     | Summary                       |
| ---                                                                                                      | ---                           |
| [pubspec.yaml](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/pubspec.yaml)                   | SaitamaSays is a Flutter project that aims to capture the essence of the famous hero Saitama from the One Punch Man series. The project leverages Flutter's capabilities to create an interactive and engaging experience for fans of the series.

</details>

<details closed><summary>main</summary>

| File                                                                                 | Summary                         |
| ---                                                                                  | ---                             |
| [main.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/main.dart) | 
The `main.dart` file initializes a Flutter application that brings to life the words of the most powerful Hero who does his job for fun. It randomly selects a Saitama phrase to display upon app launch and provides navigation to different pages for exploring more phrases or viewing saved quotes.

### Features

- **Random Saitama Phrases**: Displays a randomly selected Saitama phrase upon app launch.
- **Navigation**: Allows users to navigate between different pages for exploring more phrases or viewing saved quotes.

## Usage

To use the `main.dart` file in your Flutter application, follow these steps:

1. Import the `main.dart` file into your project.
2. Initialize the Flutter application using the `MyApp` widget defined in `main.dart`.

</details>

<details closed><summary>Database</summary>

| File                                                                                                  | Summary                         |
| ---                                                                                                   | ---                             |
| [Database.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Database/Database.dart) | The `Database.dart` file provides functionality for creating, reading, updating, and deleting quotes stored in a local SQLite database. It defines a class called `QuoteDatabase` with methods for initializing the database, creating tables, inserting new quotes, checking if a quote exists in the database, retrieving quotes, updating quote details, and deleting quotes.

### Features

- **SQLite Database**: Utilizes the `sqflite` package to interact with a local SQLite database on the device.
- **CRUD Operations**: Supports Create, Read, Update, and Delete operations for managing quotes.
- **Data Validation**: Implements methods to check if a quote already exists in the database before insertion.

## Usage

To use the `Database.dart` file in your Flutter application, follow these steps:

1. Import the `Database.dart` file into your project.
2. Initialize the `QuoteDatabase` class to perform database operations.

</details>

<details closed><summary>SaitamaPhrases</summary>

| File                                                                                                                    | Summary        |
| ---                                                                                                                     | ---            |
| [SaitamaPhrases.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/SaitamaPhrases/SaitamaPhrases.dart) | Contians all of the phrases that are loaded into the app at startup|

</details>

<details closed><summary>Colors</summary>

| File                                                                                            | Summary                         |
| ---                                                                                             | ---                             |
| [Colors.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Colors/Colors.dart) | The `SaitamaPhrases.dart` file provides a class called `SaitamaLines` with a list of Saitama's phrases. Each phrase is represented as a string and can be accessed from the `lines` list.

### Features

- **Saitama's Phrases**: Contains a collection of Saitama's memorable phrases from the One Punch Man series.

## Usage

To use the `SaitamaPhrases.dart` file in your Flutter application, follow these steps:

1. Import the `SaitamaPhrases.dart` file into your project.
2. Access the `lines` list from the `SaitamaLines` class to retrieve Saitama's phrases.

</details>

<details closed><summary>GetQuotes</summary>

| File                                                                                                     | Summary                      | 
| ---                                                                                                      | ---                          | 
| [GetQuotes.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Pages/GetQuotes.dart)     | The `GetQuotes.dart` file provides a StatefulWidget called `GetQuotes`, which allows users to retrieve random quotes attributed to Saitama from the One Punch Man series. It displays quotes in a carousel slider and provides options to save quotes to a local database. Additionally, it handles internet connectivity issues and displays appropriate messages to the user.

### Features

- **Random Quote Retrieval**: Retrieves random quotes attributed to Saitama.
- **Carousel Slider**: Displays quotes in a carousel slider for easy browsing.
- **Quote Saving**: Allows users to save quotes to a local database.
- **Internet Connectivity Handling**: Displays messages to the user in case of internet connectivity issues.

## Usage

To use the `GetQuotes.dart` file in your Flutter application, follow these steps:

1. Import the `GetQuotes.dart` file into your project.
2. Use the `GetQuotes` widget to retrieve and display quotes in your UI.

</details>

<details closed><summary>ViewQuote</summary>
	
| File                                                                                                     | Summary                      | 
| ---                                                                                                      | ---                          |
| [ViewQuote.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Pages/ViewQuote.dart)     | The `ViewQuote.dart` file provides a StatefulWidget called `viewQuote`, which allows users to view a single quote attributed to Saitama from the One Punch Man series. It displays the quote along with the corresponding anime and character in a glassmorphism-style UI.

### Features

- **Quote Display**: Displays a single quote along with the corresponding anime and character.
- **Glassmorphism UI**: Uses the glassmorphism effect to create a visually appealing UI.

## Usage

To use the `ViewQuote.dart` file in your Flutter application, follow these steps:

1. Import the `ViewQuote.dart` file into your project.
2. Use the `viewQuote` widget to display a single quote in your UI.

</details>

<details closed><summary>SavedQuotes</summary>
	
| File                                                                                                     | Summary                      | 
| ---                                                                                                      | ---                          |
| [SavedQuotes.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Pages/SavedQuotes.dart) | The project consists of several Dart files organized into different directories:

- **lib**: Contains the main Dart files for the project.
  - **main.dart**: Entry point of the application.
  - **Database**: Directory containing Dart files related to database management.
    - **Database.dart**: Defines a database for storing quotes.
  - **Colors**: Directory containing Dart files defining colors used in the application.
  - **Services**: Directory containing Dart files providing services for fetching and managing quotes.
  - **SaitamaPhrases**: Directory containing Dart files with a list of Saitama quotes.
  - **Pages**: Directory containing Dart files defining various pages of the application.
    - **GetQuotes.dart**: Defines a page for displaying random quotes.
    - **SavedQuotes.dart**: Defines a page for displaying saved quotes.
    - **ViewQuote.dart**: Defines a page for viewing a single quote in detail.
  - **Widgets**: Directory containing Dart files defining reusable widgets.
    - **QuoteCard.dart**: Defines a widget for displaying a card with quote details.
    - **QuoteWindow.dart**: Defines a widget for displaying a window with quote details.

## Usage

To use this project, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in your preferred Flutter development environment.
3. Run the project using a compatible device or emulator.

## Features

- Display random quotes attributed to Saitama.
- Save favorite quotes for later viewing.
- View saved quotes with the option to delete or share them.
- View individual quotes in detail, including the anime and character associated with each quote.

</details>

<details closed><summary>MainLayout</summary>

| File                                                                                                     | Summary                      |
| ---                                                                                                      | ---                          |
| [MainLayout.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Pages/MainLayout.dart)   | The `MainLayout` widget consists of a `BottomNavigationBar` for navigation and an `IndexedStack` to manage the visibility of the different pages.

## Usage

To use the `MainLayout` widget in your Flutter application, follow these steps:

1. Import the `MainLayout.dart` file into your project.
2. Use the `MainLayout` widget as the main layout of your application, passing the required parameters as needed.

</details>

<details closed><summary>Quotes</summary>

| File                                                                                              | Summary                         |
| ---                                                                                               | ---                             |
| [Quotes.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Services/Quotes.dart) | This Dart code allows you to generate random quotes from an API. It utilizes the animechan API to fetch quotes related to anime characters and displays them. The code also includes functionality to manipulate and store the quotes.

## Features
- Fetch random quotes from the animechan API.
- Store and manipulate quote data locally.
- Clean and maintainable code structure.

## Usage
To use this code, you can incorporate it into your Dart projects. You can utilize the `Quoter` class to fetch random quotes and manipulate them according to your requirements.

</details>

<details closed><summary>SideMenu</summary>

| File                                                                                                       | Summary                     |
| ---                                                                                                        | ---                         |
| [SideMenu.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Widgets/SideMenu.dart)       | The `NavDrawer` widget is designed to be used as a side menu in a Flutter application. It includes options for navigation and can be customized to fit the design of the application.

## Features
- Displays a drawer with navigation options.
- Customizable design with support for icons and text.
- Easily integrate into Flutter applications.

## Usage
To use this widget, incorporate it into your Flutter application where you need a side menu for navigation. The `NavDrawer` widget provides options for searching quotes and accessing saved quotes.

</details>

<details closed><summary>QuoteCard</summary>

| File                                                                                                       | Summary                     |
| ---                                                                                                        | ---                         |
| [QuoteCard.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Widgets/QuoteCard.dart)     | The `QuoteCard` widget is a customizable Flutter widget that displays a card containing a quote, character name, anime name, and options for sharing and deleting the quote. It provides an aesthetically pleasing design with a blurred background and gradient overlay.

## Usage
To use this widget, simply include it in your Flutter project and pass the required parameters (`quote` and `index`). Customize the widget according to your project's design requirements.

</details>

<details closed><summary>QuoteWindow</summary>

| File                                                                                                       | Summary                     |
| ---                                                                                                        | ---                         |
| [QuoteWindow.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Widgets/QuoteWindow.dart) | The `QuoteWindow` widget is designed to display a quote along with its associated details in a stylized window. It utilizes various Flutter widgets to achieve a visually appealing layout.

## Features
- Display anime, character, and quote in a styled window.
- Customizable design with support for dynamic colors.
- Utilizes Google Fonts for enhanced typography.

## Usage
To use this widget, incorporate it into your Flutter application where you need to display a quote window. Pass the `Quoter` object representing the quote along with its index to the `QuoteWindow` widget.

</details>

---

##  Getting Started

**System Requirements:**

* **Dart**: `version 3.3.2`

###  Installation

<h4>From <code>source</code></h4>

> 1. Clone the Saitama-Says repository:
>
> ```console
> $ git clone https://github.com/Iloke-Alusala/Saitama-Says
> ```
>
> 2. Change to the project directory:
> ```console
> $ cd Saitama-Says
> ```
>
> 3. Install the dependencies:
> ```console
> $ pub get
> ```

###  Usage

<h4>From <code>source</code></h4>

> Run Saitama-Says using the command below:
> ```console
> $ dart main.dart
> ```

###  Tests

> Run the test suite using the command below:
> ```console
> $ dart test
> ```

---

##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Report Issues](https://github.com/Iloke-Alusala/Saitama-Says/issues)**: Submit bugs found or log feature requests for the `Saitama-Says` project.
- **[Submit Pull Requests](https://github.com/Iloke-Alusala/Saitama-Says/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/Iloke-Alusala/Saitama-Says/discussions)**: Share your insights, provide feedback, or ask questions.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/Iloke-Alusala/Saitama-Says
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to github**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="center">
   <a href="https://github.com{/Iloke-Alusala/Saitama-Says/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=Iloke-Alusala/Saitama-Says">
   </a>
</p>
</details>

---

##  License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
