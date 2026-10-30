Master List Dynamic Filtering and Interactive Sorting
A professional Flutter master-detail skeleton application demonstrating real-time text search, multi-category filtering, dynamic sorting, and clean screen navigation using Flutter's native state management and navigation stack.
📌 Project Overview
This project provides a robust foundation for handling dynamic dataset displays in Flutter. It demonstrates:
* Clean Navigation: Seamless screen transitions using standard Navigator.push and MaterialPageRoute.
* Real-Time Text Search: Instant UI filtering based on item title or description matching.
* Category Filtering: Multi-criteria filtering using horizontal ChoiceChip selections.
* Interactive Sorting: Real-time dataset reordering (A–Z, Z–A, ID Ascending) via an AppBar menu.
* Optimized UI States: Custom feedback displays for populated and empty list results.
  📁 Directory Architecture
  master_list/
  ├── lib/
  │   ├── models/
  │   │   └── item.dart          # Data model representation
  │   ├── screens/
  │   │   ├── master_screen.dart # Master view with search, filter, & sort logic
  │   │   └── detail_screen.dart # Dedicated item detail view
  │   └── main.dart              # Application entry point & MaterialApp scaffold
  ├── pubspec.yaml               # Package dependencies & assets
  └── README.md                  # Project documentation
  🛠 Prerequisites & Environment Setup
  To ensure compliance with local environment pathing and audit standards:
* Flutter SDK: >=3.0.0
* Dart SDK: >=3.0.0
* IDE: Android Studio or Visual Studio Code with Flutter extensions installed.
  Note on File Paths: Avoid hardcoding personal usernames in workspace directories. Always reference user directories relative to $HOME or ~.
  🚀 Getting Started
1. Initialize Workspace
   If generating from scratch in your home environment (e.g., inside ~/Downloads):
   cd ~/Downloads
   flutter create master_list
   cd master_list
2. Add Project Files
   Organize the source directory layout inside lib/:
   mkdir -p lib/models lib/screens
   Place item.dart inside lib/models/, and place master_screen.dart and detail_screen.dart inside lib/screens/.
3. Run the Application
   Start the application using your preferred local device emulator or desktop environment:
   flutter run
   💻 Features & Usage Guide
   🔍 Real-Time Text Search
* Type into the search input field at the top of the master screen.
* Matching logic evaluates both item titles and subtitles dynamically as you type.
  🏷️ Category Filtering
* Tap any horizontal category chip (All, Technology, Design, Business) to constrain the current view to items belonging to that category.
  🔀 Interactive Sorting
* Tap the Sort popup icon in the AppBar.
* Select from:
    * Title: A to Z (Alphabetical ascending)
    * Title: Z to A (Alphabetical descending)
    * ID Order (Numerical ID ascending)
      📄 Navigation to Detail View
* Tap any item card in the master list to launch DetailScreen.
* The detail view receives the specific Item instance and renders its detailed ID, title, and body text.

