import '../../domain/entities/portfolio_data.dart';

class LocalDataSource {
  static const String summary =
      "Hi, I'm Hamza! I'm a passionate Flutter developer who genuinely loves bringing ideas to life through clean, intuitive mobile apps. Over the years, I've had the chance to work on everything from live-streaming platforms to health apps, picking up tools like Firebase, GetX, and Stripe along the way. For me, coding is all about solving real problems and building experiences that people actually enjoy using. Whether I'm building from scratch or improving an existing project, I always aim for high quality and a smooth user experience.";

  static const List<String> skills = [
    'Flutter',
    'GetX',
    'Provider',
    'Hive',
    'Stripe',
    'ZegoCloud',
    'Git',
    'GitHub',
    'CI/CD Basics',
    'Firebase',
  ];

  static List<Project> get projects => [
    Project(
      title: 'Luma: Expense & Budget Tracker',
      role: 'Flutter, Dart · Luminex Labs',
      description:
          'A premium, production-ready financial management app built for Android. Luma helps users track expenses, manage budgets, and generate detailed financial insights — seamlessly, both offline and online.\n\n'
          '🏗 Architecture: Offline-first hybrid using Drift (type-safe SQL) for instant local reads/writes, syncing in real-time with Cloud Firestore when online. Powered by Clean Architecture with Provider for full separation of business logic and UI.\n\n'
          '🔒 Security: Custom Flutter Method Channel integrates native Kotlin code to trigger Android lock screen authentication, ensuring financial data stays private at the device level.\n\n'
          '📊 Analytics: Category-wise expense breakdowns, real-time budget threshold warnings, and beautifully rendered financial insight charts built in Flutter.\n\n'
          '✅ Production-Tested: Successfully completed Google Play\'s closed testing mandate (20+ testers, 14+ days) before public release. Zero crashes recorded via Firebase Crashlytics post-launch.',
      link:
          'https://play.google.com/store/apps/details?id=com.luminexlabs.luma.expense',
      linkLabel: 'Play Store',
      techStack: [
        'Flutter',
        'Drift',
        'Firebase',
        'Firestore',
        'Crashlytics',
        'Provider',
        'Method Channels',
      ],
      images: [
        'assets/images/projects/luma_expense/1.png',
        'assets/images/projects/luma_expense/2.jpg',
        'assets/images/projects/luma_expense/3.jpg',
        'assets/images/projects/luma_expense/4.jpg',
        'assets/images/projects/luma_expense/5.jpg',
        'assets/images/projects/luma_expense/6.jpg',
        'assets/images/projects/luma_expense/7.jpg',
        'assets/images/projects/luma_expense/8.jpg',
        'assets/images/projects/luma_expense/9.jpg',
        'assets/images/projects/luma_expense/10.jpg',
      ],
    ),
    Project(
      title: 'Luma Notes - Private Notepad',
      role: 'Flutter, Dart, Drift · Luminex Labs',
      description:
          'A premium, production-ready private notepad and markdown-based organizer built for ultimate security on Android.\n\n'
          '🏗️ Offline-First & Reactive: Powered by Drift database (SQLite) for high-performance, type-safe offline storage and reactive data streams, ensuring fluid page transits and instant note state reads/writes.\n\n'
          '🔒 Privacy Vault (Biometrics): Integrates hardware-level secure biometric unlock (Fingerprint / Face ID recognition) and encrypted PIN safeguards to isolate sensitive meeting memos, financial ideas, or journal entries.\n\n'
          '🎨 Minimal UI & Folder Sync: Employs a state-of-the-art dark theme, interactive markup tools (checklists, study/meeting drafts), custom media voice-note attachments, and clean folder-hierarchy organization.\n\n'
          '📦 Accident Recovery: Safeguards workflows via an intelligent Local Backup & Restore utility alongside a recently deleted safety net trash bin.',
      link:
          'https://play.google.com/store/apps/details?id=com.luminexlabs.lumanotes',
      linkLabel: 'Play Store',
      techStack: [
        'Flutter',
        'Drift',
        'SQLite',
        'Biometrics',
        'Dart',
        'Provider',
      ],
      images: [
        'assets/images/projects/luma_notes/1.jpg',
        'assets/images/projects/luma_notes/2.jpg',
        'assets/images/projects/luma_notes/3.jpg',
        'assets/images/projects/luma_notes/4.jpg',
        'assets/images/projects/luma_notes/5.jpg',
      ],
    ),
    Project(
      title: 'Quit Smoking (Puffless – iOS App)',
      role: 'Flutter, Dart',
      description:
          'Contributed to the development of a health-focused mobile application aimed at helping smokers reduce and eventually quit smoking. The app enables users to track their daily cigarette consumption and spending, visualize savings over time, and receive motivational daily tips for quitting. Successfully published and live on the Apple App Store, providing real-world impact for users striving toward a healthier lifestyle.',
      link: 'https://apps.apple.com/pk/app/puffless-quit-smoking/id6740874361',
      linkLabel: 'AppStore',
      techStack: ['Flutter', 'Dart'],
      images: [
        'assets/images/projects/puffless/1.png',
        'assets/images/projects/puffless/2.png',
      ],
    ),
    Project(
      title: 'Shouse (Live Streaming Platform)',
      role: 'Flutter, Dart',
      description:
          'Developed a live streaming application similar to Airbnb, enabling users to book professional locations for events. Integrated Livepeer for decentralized video streaming and configured OBS Studio as the encoder to ensure smooth, high-quality broadcasts. Used Vercel serverless functions to automatically create Livepeer streams upon admin approval and update stream status in Firebase when users start broadcasting via OBS, ensuring seamless real-time event management.',
      link: '',
      linkLabel: '',
      techStack: ['Flutter', 'Livepeer', 'Firebase'],
      images: [
        'assets/images/projects/shouse/1.png',
        'assets/images/projects/shouse/2.png',
      ],
    ),
    Project(
      title: 'S24',
      role: 'Flutter, Dart',
      description:
          'Developed an application, where users can add each others and after adding they call, chat with each others. A user can book call or send an invitation according or the user preferences.',
      link: '',
      linkLabel: '',
      techStack: ['Flutter', 'Dart'],
      images: [
        'assets/images/projects/s24/1.png',
        'assets/images/projects/s24/2.png',
      ],
    ),
    Project(
      title: 'Services App (Kubrra Travels)',
      role: 'Flutter, Dart',
      description:
          'Developed a services application that enabled administrators to create and manage events while allowing users to book tickets seamlessly. The app featured an intuitive interface for event browsing, booking, and ticket management, ensuring a smooth and user-friendly experience for both admins and users.',
      link: '',
      linkLabel: '',
      techStack: ['Flutter', 'Dart'],
      images: [
        'assets/images/projects/kubrra/1.png',
        'assets/images/projects/kubrra/2.png',
      ],
    ),
    Project(
      title: 'Social App',
      role: 'Flutter, Dart',
      description:
          'Developed a feature-rich social media application designed to provide users with an engaging and interactive platform. The app allowed users to upload their free and paid content, creating a unique revenue-generating opportunity within a social environment. Integrated Stripe for secure and seamless payment processing, ensuring smooth financial transactions for paid content. Additionally, the app featured real-time live streaming functionality to enhance user interaction and engagement. A dedicated trading section was also implemented, enabling users to trade assets directly within the platform.',
      link: '',
      linkLabel: '',
      techStack: ['Flutter', 'Stripe'],
      images: [
        'assets/images/projects/social/1.png',
        'assets/images/projects/social/2.png',
      ],
    ),
    Project(
      title: 'Sunversum Admin',
      role: 'Flutter, Dart',
      description:
          'This is app where buyer and seller can interact and the adim will be able to get payment and monitor the customers as well the Distributers activity. I was resonsible to develop the admin side from end.',
      link: 'https://github.com/100Hamza/sunversum_admin',
      linkLabel: 'GitHub',
      techStack: ['Flutter', 'Dart'],
      images: [
        'assets/images/projects/sunversum/1.png',
        'assets/images/projects/sunversum/2.png',
      ],
    ),
    Project(
      title: 'Innovated Innovations',
      role: 'Flutter, Dart',
      description:
          'This app was a Ticket Management and I was responsible to make the admin side front end of it.',
      link: 'https://github.com/100Hamza/innovated_innovations',
      linkLabel: 'GitHub',
      techStack: ['Flutter', 'Dart'],
      images: [
        'assets/images/projects/innovated/1.png',
        'assets/images/projects/innovated/2.png',
      ],
    ),
    Project(
      title: 'Spish Application',
      role: 'Flutter, Dart',
      description:
          'Developed the front end of a social media Android application using Flutter. Admin can view user activity through charts, and users can post captions, images, and report content.',
      link: 'https://github.com/100Hamza/spish',
      linkLabel: 'GitHub',
      techStack: ['Flutter', 'Dart'],
      images: [
        'assets/images/projects/spish/1.png',
        'assets/images/projects/spish/2.png',
      ],
    ),
    Project(
      title: 'Employee Management System',
      role: 'Flutter, Dart',
      description:
          'Built an Android application using Flutter, Dart, and SQLFlite. Admin/Manager can add new employees with security measures, including camera-based log-in/out.',
      link: 'https://github.com/100Hamza/employee_record',
      linkLabel: 'GitHub',
      techStack: ['Flutter', 'SQLFlite'],
      images: [
        'assets/images/projects/emp/1.png',
        'assets/images/projects/emp/2.png',
      ],
    ),
  ];

  static List<Experience> get experiences => [
    Experience(
      date: 'Feb 2024 - Present',
      title: 'Flutter Developer - DIC',
      company: 'DIC',
      responsibilities: [
        'Responsible for developing mobile applications in Flutter.',
        'Front End & Backend Integration',
        'Firebase, Hive',
        'Live Streaming (Agora)',
      ],
      tools: 'Flutter / Dart',
    ),
    Experience(
      date: 'Nov 2023 - Feb 2024',
      title: 'Flutter Developer (Intern)',
      company: 'Tech Induc Innovations',
      responsibilities: [
        'Responsible for developing mobile applications in Flutter.',
        'Front End, Getx, Firebase',
      ],
      tools: 'Flutter / Dart',
    ),
    Experience(
      date: 'Feb 2023 - Dec 2023',
      title: 'Flutter Developer',
      company: 'Work From Home',
      responsibilities: [
        'Contributed to the development of the Spish application front end.',
        'Implemented the Employee Management System.',
        'Worked on an Auction System project.',
      ],
      tools: 'Flutter / Dart',
    ),
  ];

  static List<Education> get educations => [
    Education(
      date: '2019 - 2023',
      degree: 'BS- Software Engineering',
      institution:
          'Kohat University of Science and Technology, Kohat, Pakistan',
      details: 'CGPA: 3.34/4',
    ),
    Education(
      date: '2015 - 2018',
      degree: 'ICS',
      institution: 'Govt. Degree College No. 2, KDA, Kohat, Pakistan',
      details: 'Marks: 642/1100',
    ),
    Education(
      date: '2013 - 2015',
      degree: 'Matric',
      institution: 'Al-Nasir Public School and College, Kohat, Pakistan',
      details: 'Marks: 672/1100',
    ),
  ];

  static List<Certificate> get certificates => [
    Certificate(
      date: '12/2022',
      title: 'Startup Pitching Competition (2nd Position)',
      details:
          'Participation and outstanding performance in the startup Pitching Competition at NEP-NIC KUST.',
    ),
    Certificate(
      date: '10/2022',
      title: 'Digital Marketing Training',
      details:
          'Participate in the Digital Marketing Training by Meta, KPIT, DEMO at NEP NIC KUST',
    ),
  ];

  static List<Course> get courses => [
    Course(
      date: '01-03/2023',
      title: 'Flutter Development',
      institution: 'KBIT board, KUST, Kohat.',
    ),
    Course(
      date: '08-12/2022',
      title: 'Flutter Development',
      institution: 'KAMYAB NAUJAWAM (NEVTCC), KUST, Kohat.',
    ),
    Course(
      date: '10/03/2020',
      title: 'Computer Operator',
      institution: 'KAMYAB NAUJAWAM (NEVTCC), Kohat, KPK.',
    ),
    Course(
      date: '11/09/2015',
      title: 'Computer Software #24',
      institution:
          'Fauji Foundation Walfare Division Technical Training Center, Kohat, KPK.',
    ),
    Course(
      date: '25/12/2011',
      title: 'CIT',
      institution: 'Future Vision Organization (FVO), Kohat, KPK.',
    ),
  ];

  static List<Language> get languages => [
    Language(name: 'English', proficiency: 'Limited Working Proficiency'),
    Language(name: 'Urdu', proficiency: 'Native or Bilingual Proficiency'),
  ];
}
