import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/education_section.dart';
import '../../core/theme/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOut,
      );
    }
  }

  IconData _getIconForSection(String label) {
    switch (label) {
      case 'About':
        return Icons.person;
      case 'Experience':
        return Icons.work;
      case 'Projects':
        return Icons.code;
      case 'Education':
        return Icons.school;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 700;

    final navItems = [
      _NavItem(label: 'About', key: _aboutKey),
      _NavItem(label: 'Experience', key: _experienceKey),
      _NavItem(label: 'Projects', key: _projectsKey),
      _NavItem(label: 'Education', key: _educationKey),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Muhammad Hamza',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: !isDesktop
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            : null,
        elevation: 0,
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor.withValues(alpha: 0.7),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        actions: [
          if (isDesktop)
            ...navItems.map((item) {
              return TextButton(
                onPressed: () => _scrollToSection(item.key),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: AppColors.primaryAccent,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: !isDesktop
          ? Drawer(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: SafeArea(
                child: Column(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.primaryAccent.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Muhammad Hamza',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryAccent,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: navItems.map((item) {
                          return ListTile(
                            title: Text(
                              item.label,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            leading: Icon(
                              _getIconForSection(item.label),
                              color: AppColors.secondaryAccent,
                            ),
                            onTap: () {
                              Navigator.of(context).pop(); // Close drawer
                              Future.delayed(const Duration(milliseconds: 250), () {
                                _scrollToSection(item.key);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ), // Max width for desktop
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeroSection(),
                  const SizedBox(height: 100),
                  Container(
                    key: _aboutKey,
                    child: const AboutSection()
                        .animate()
                        .fade(duration: 500.ms)
                        .slideY(begin: 0.1, end: 0),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    key: _experienceKey,
                    child: const ExperienceSection()
                        .animate()
                        .fade(duration: 500.ms)
                        .slideY(begin: 0.1, end: 0),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    key: _projectsKey,
                    child: const ProjectsSection()
                        .animate()
                        .fade(duration: 500.ms)
                        .slideY(begin: 0.1, end: 0),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    key: _educationKey,
                    child: const EducationSection()
                        .animate()
                        .fade(duration: 500.ms)
                        .slideY(begin: 0.1, end: 0),
                  ),
                  const SizedBox(height: 100),
                  // Footer
                  Center(
                    child: Text(
                      '© 2026 Muhammad Hamza. Built with Flutter.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final GlobalKey key;

  _NavItem({required this.label, required this.key});
}
