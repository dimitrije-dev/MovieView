




# 🎬 Movie View

**MovieView** is a sleek iOS app built with **Swift** and **SwiftUI**, designed to showcase trending and top-rated movies and TV shows using data from **The Movie Database (TMDB)** API.  
Inspired by popular streaming platforms, it offers a modern, fluid user experience with animated transitions and dynamic poster displays. Based on BlossomMovie Course.

# Course link

https://www.udemy.com/course/blossom-build-swiftui-beginner/?couponCode=25BBPMXINACTIVE

---

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.9-orange?logo=swift" alt="Swift 5.9">
  <img src="https://img.shields.io/badge/iOS-17%2B-blue?logo=apple" alt="iOS 17+">
  <img src="https://img.shields.io/badge/Xcode-15%2B-lightgrey?logo=xcode" alt="Xcode 15+">
  <img src="https://img.shields.io/badge/API-TMDB-green?logo=themoviedatabase" alt="TMDB API">
  <img src="https://img.shields.io/badge/License-MIT-yellow" alt="License MIT">
</p>

---

## ✨ Features

- 🌟 **Trending & Top-Rated:** Explore trending and top-rated movies and TV shows fetched directly from TMDB.  
- 🎨 **Modern UI:** Built entirely with **SwiftUI**, featuring smooth scrolling and subtle animations.  
- 🖼️ **Poster Displays:** Asynchronous poster loading for fast and seamless browsing.  
- 💫 **Splash Screen:** Enjoy a beautiful animated splash screen on launch.  
- 🧭 **Tab Navigation:** Includes **Home**, **Upcoming**, **Search**, and **Downloads** tabs (Home is fully implemented).  
- ⚠️ **Error Handling:** Clear and user-friendly UI for network and configuration errors.  

---

## 📸 Screenshots

<img width="300" height="600" alt="IMG_0294" src="https://github.com/user-attachments/assets/a151a9cc-c8d1-4376-89e8-ef5205425179" />
<img width="300" height="600" alt="IMG_0293" src="https://github.com/user-attachments/assets/ee957828-d707-4ba0-9f30-ddd37340c75e" />



---

## 🚀 Getting Started

### 🧩 Prerequisites

- **Xcode 15** or later  
- **Swift 5.9** or later  
- A valid **TMDB API Key**

---

### 🛠️ Setup

#### 1. Clone the Repository

```bash
git clone https://github.com/dimitrije-dev/MovieView.git
````

#### 2. Configure the TMDB API Key

Copy the template API configuration file:

```bash
cp MovieView/APIConfig.template.json MovieView/APIConfig.json
```

Then open `MovieView/APIConfig.json` and add your personal TMDB API key:

```json
{
  "tmdbBaseURL": "https://api.themoviedb.org",
  "tmdbAPIKey": "YOUR_TMDB_API_KEY_HERE"
}
```

> ⚠️ **Note:** Do **not** commit your API key!
> `APIConfig.json` is already added to `.gitignore`.

---

#### 3. Open the Project

Open the project in Xcode:

```bash
open MovieView.xcodeproj
```

#### 4. Build & Run

Select an iOS simulator (or your physical device) and press **Run ▶️**.

---

## 📱 Usage

1. On launch, enjoy the animated **splash screen**.
2. Navigate to the **Home tab** to view:

   * 🎞️ Trending Movies
   * 📺 Trending TV Shows
   * 🏆 Top Rated Movies
   * 🌍 Top Rated TV Shows
3. Tap on any poster *(future feature: navigate to detailed views).*
4. Other tabs (**Upcoming**, **Search**, **Downloads**) are placeholders for future expansion.

---

## 🧠 Core Project Structure

```
MovieView/
│
├── Model/
│   └── Title.swift               # Movie and TV data models
│
├── Repository/
│   └── DataFetcher.swift         # Networking layer (fetches TMDB data)
│
├── ViewModels/
│   └── ViewModel.swift           # State management for TMDB data
│
├── Views/
│   ├── HomeView.swift
│   ├── SplashView.swift
│   └── HorizontalListView.swift  # Scrollable horizontal lists
│
├── APIConfig.swift
├── APIConfig.template.json       # Template for local API setup
│
├── Utils/
│   └── Constants.swift           # Centralized constants (text, icons, colors)
│
└── Errors/
    └── Errors.swift              # Custom error handling
```

---

## 🧰 Technologies Used

* 🐦 **Swift** & **SwiftUI**
* 🌐 **The Movie Database (TMDB) API**
* ⚙️ **Async/Await** for networking
* 🧩 **MVVM Architecture**

---

## 💡 Future Improvements

* 🔍 Implement Search functionality
* 📅 Add Upcoming Movies section
* ⬇️ Enable Downloads tab functionality
* 🎥 Detailed movie/TV info screens
* ❤️ Watchlist and Favorites support

---

## 👨‍💻 Author

**Dimitrije Dev**
[🌐 GitHub Profile](https://github.com/dimitrije-dev)

---

## 🪪 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

⭐ **If you like this project, consider giving it a star on GitHub!**




