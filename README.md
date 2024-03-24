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

<code>► INSERT-TEXT-HERE</code>

---

##  Features

<code>► INSERT-TEXT-HERE</code>

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

| File                                                                                                     | Summary                        
| ---                                                                                                      | ---                            
| [pubspec.yaml](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/pubspec.yaml)                   | SaitamaSays is a Flutter project that aims to capture the essence of the famous hero Saitama from the One Punch Man series. The project leverages Flutter's capabilities to create an interactive and engaging experience for fans of the series.

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

<details closed><summary>lib/Database</summary>

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

<details closed><summary>lib/SaitamaPhrases</summary>

| File                                                                                                                    | Summary                         |
| ---                                                                                                                     | ---                             |
| [SaitamaPhrases.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/SaitamaPhrases/SaitamaPhrases.dart) | <code>► INSERT-TEXT-HERE</code> |

</details>

<details closed><summary>lib.Colors</summary>

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

<details closed><summary>lib.Pages</summary>

| File                                                                                                     | Summary                        
| ---                                                                                                      | ---                            

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

| File                                                                                                     | Summary                        
| ---                                                                                                      | ---       
| [ViewQuote.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Pages/ViewQuote.dart)     | The `ViewQuote.dart` file provides a StatefulWidget called `viewQuote`, which allows users to view a single quote attributed to Saitama from the One Punch Man series. It displays the quote along with the corresponding anime and character in a glassmorphism-style UI.

### Features

- **Quote Display**: Displays a single quote along with the corresponding anime and character.
- **Glassmorphism UI**: Uses the glassmorphism effect to create a visually appealing UI.

## Usage

To use the `ViewQuote.dart` file in your Flutter application, follow these steps:

1. Import the `ViewQuote.dart` file into your project.
2. Use the `viewQuote` widget to display a single quote in your UI.

| File                                                                                                     | Summary                        
| ---                                                                                                      | ---       
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


| File                                                                                                     | Summary                        
| ---                                                                                                      | ---       
| [MainLayout.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Pages/MainLayout.dart)   | The `MainLayout` widget consists of a `BottomNavigationBar` for navigation and an `IndexedStack` to manage the visibility of the different pages.

## Usage

To use the `MainLayout` widget in your Flutter application, follow these steps:

1. Import the `MainLayout.dart` file into your project.
2. Use the `MainLayout` widget as the main layout of your application, passing the required parameters as needed.

</details>

<details closed><summary>lib.Services</summary>

| File                                                                                              | Summary                         |
| ---                                                                                               | ---                             |
| [Quotes.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Services/Quotes.dart) | <code>► INSERT-TEXT-HERE</code> |

</details>

<details closed><summary>lib.Widgets</summary>

| File                                                                                                       | Summary                         |
| ---                                                                                                        | ---                             |
| [SideMenu.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Widgets/SideMenu.dart)       | <code>► INSERT-TEXT-HERE</code> |
| [QuoteCard.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Widgets/QuoteCard.dart)     | <code>► INSERT-TEXT-HERE</code> |
| [QuoteWindow.dart](https://github.com/Iloke-Alusala/Saitama-Says/blob/master/lib/Widgets/QuoteWindow.dart) | <code>► INSERT-TEXT-HERE</code> |

</details>

---

##  Getting Started

**System Requirements:**

* **Dart**: `version x.y.z`

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

##  Project Roadmap

- [X] `► INSERT-TASK-1`
- [ ] `► INSERT-TASK-2`
- [ ] `► ...`

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

This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

##  Acknowledgments

- List any resources, contributors, inspiration, etc. here.

[**Return**](#-overview)

---



An anime quote generation app. The app connects to an online API and retrieves quotes from all the best and the worst anime. It then allows for them to be saved for later and shared across different media platforms

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
