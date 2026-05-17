import 'package:flutter/material.dart';
import '../../domain/entities/portfolio_data.dart';
import '../../data/datasources/local_data_source.dart';

class PortfolioProvider with ChangeNotifier {
  String get summary => LocalDataSource.summary;
  List<String> get skills => LocalDataSource.skills;
  List<Project> get projects => LocalDataSource.projects;
  List<Experience> get experiences => LocalDataSource.experiences;
  List<Education> get educations => LocalDataSource.educations;
  List<Certificate> get certificates => LocalDataSource.certificates;
  List<Course> get courses => LocalDataSource.courses;
  List<Language> get languages => LocalDataSource.languages;
}
