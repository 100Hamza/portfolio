class Project {
  final String title;
  final String role;
  final String description;
  final String link;
  final String linkLabel;
  final List<String> techStack;
  final List<String> images; // placeholder for gallery

  Project({
    required this.title,
    required this.role,
    required this.description,
    required this.link,
    required this.linkLabel,
    required this.techStack,
    required this.images,
  });
}

class Experience {
  final String date;
  final String title;
  final String company;
  final List<String> responsibilities;
  final String tools;

  Experience({
    required this.date,
    required this.title,
    required this.company,
    required this.responsibilities,
    required this.tools,
  });
}

class Education {
  final String date;
  final String degree;
  final String institution;
  final String details;

  Education({
    required this.date,
    required this.degree,
    required this.institution,
    required this.details,
  });
}

class Certificate {
  final String date;
  final String title;
  final String details;

  Certificate({required this.date, required this.title, required this.details});
}

class Course {
  final String date;
  final String title;
  final String institution;

  Course({required this.date, required this.title, required this.institution});
}

class Language {
  final String name;
  final String proficiency;

  Language({required this.name, required this.proficiency});
}
