class Project {
  final String name;
  final String description;
  final String link;
  final String projectImage;
  final String projectWebSite;

  Project(this.name, this.description, this.link, this.projectImage, this.projectWebSite);
}

List<Project> projectList = [
  Project(
      'Threads App',
      'Presenting "Coffee" - a Flutter UI application that invites you to indulge in a delightful coffee adventure. Immerse yourself in the world of rich aroma and flavor as you browse through an exquisite selection of specialty coffees. With a user-friendly interface, exploring different blends and discovering their unique details becomes a delightful experience.',
      'https://github.com/bedirhantong/threads_clone/',
      'assets/images/threads_dash.png','https://bedirhantong.github.io/threads_clone/'),
  Project(
    'Personal Health Tracker',
    'EPONA is a personal health tracker Android application. The application allows the user to monitor the performance for various activities such as running, step counting, diving, breath taking.',
    'https://github.com/bedirhantong/PersonalHealthTrackerApp',
    'assets/images/epona_dash.png',''
  ),
  Project(
    'Tenant Manager',
    'This application is a "Tenant Manager" application used to manage tenants. It allows you to keep track of your tenants\' information, manage their subscriptions and perform some operations.',
    'https://github.com/bedirhantong/tenant_management',
    'assets/images/tenant.png',''
  ),
  Project(
    'Interactive Barista',
    'This is an interactive application that teaches users about the ingredients and preparation of different coffees at Starbucks.',
    'https://github.com/bedirhantong/flutter_barista',
    'assets/images/barista.png',''
  ),
  Project(
    'QuizWiz',
    'You can create quizzes for any purpose such as class exc.',
    'https://github.com/bedirhantong/quizwiz',
    'assets/images/barista.png',''
  ),
];
