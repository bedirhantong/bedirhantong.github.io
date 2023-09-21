class Project {
  final String name;
  final String description;
  final String link;
  final String projectWebSite;

  Project(this.name, this.description, this.link, this.projectWebSite);
}

List<Project> projectList = [
  Project(
    'Threads App',
    'Presenting "Coffee" - a Flutter UI application that invites you to indulge in a delightful coffee adventure. Immerse yourself in the world of rich aroma and flavor as you browse through an exquisite selection of specialty coffees. With a user-friendly interface, exploring different blends and discovering their unique details becomes a delightful experience.',
    'assets/readme/screenshots/threads.png',
    'https://bedirhantong.github.io/threads_clone/',
  ),
  Project(
      'Personal Health Tracker',
      'EPONA is a personal health tracker Android application. The application allows the user to monitor the performance for various activities such as running, step counting, diving, breath taking.',
      'assets/readme/screenshots/pht.png',
      'https://bedirhantong.github.io/PersonalHealthTrackerApp/'),
  Project(
      'Interactive Barista',
      'This is an interactive application that teaches users about the ingredients and preparation of different coffees at Starbucks.',
      'assets/readme/screenshots/bar.png',
      'https://bedirhantong.github.io/flutter_barista/'),
  Project(
      'QuizWiz',
      'You can create quizzes for any purpose such as class exc.',
      'assets/readme/screenshots/quiz.png',
      'https://bedirhantong.github.io/quizwiz/'),
];
