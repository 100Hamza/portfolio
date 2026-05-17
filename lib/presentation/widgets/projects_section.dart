import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../providers/portfolio_provider.dart';
import '../../core/theme/app_colors.dart';
import 'image_viewer_dialog.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  static const int _pageSize = 6;
  bool _showAll = false;

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) return;
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioProvider>();
    final allProjects = provider.projects;
    final displayed = _showAll ? allProjects : allProjects.take(_pageSize).toList();
    final hasMore = allProjects.length > _pageSize;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(width: 60, height: 4, color: AppColors.secondaryAccent),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 700;
            final cardWidth = isWide ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth;
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: displayed.map((project) {
                return SizedBox(
                  width: cardWidth,
                  child: _ProjectCard(project: project, onLaunch: _launchUrl),
                );
              }).toList(),
            );
          },
        ),
        if (hasMore) ...[      
          const SizedBox(height: 24),
          Center(
            child: OutlinedButton.icon(
              onPressed: () => setState(() => _showAll = !_showAll),
              icon: AnimatedRotation(
                turns: _showAll ? 0.5 : 0,
                duration: const Duration(milliseconds: 300),
                child: const Icon(Icons.keyboard_arrow_down),
              ),
              label: Text(_showAll ? 'See Less' : 'See More (${allProjects.length - _pageSize} more)'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryAccent,
                side: const BorderSide(color: AppColors.primaryAccent),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final dynamic project;
  final Function(String) onLaunch;

  const _ProjectCard({required this.project, required this.onLaunch});

  @override
  __ProjectCardState createState() => __ProjectCardState();
}

class __ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;
  int _current = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered
            ? (Matrix4.identity()..translate(0.0, -10.0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? AppColors.secondaryAccent.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.1),
              blurRadius: isHovered ? 20 : 10,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: isHovered
                ? AppColors.primaryAccent.withValues(alpha: 0.5)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Carousel
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: (widget.project.images as List)
                          .cast<String>()
                          .asMap()
                          .entries
                          .map<Widget>(
                            (entry) {
                              final index = entry.key;
                              final item = entry.value;
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierColor: Colors.black.withValues(alpha: 0.9),
                                    builder: (context) => ImageViewerDialog(
                                      images: (widget.project.images as List).cast<String>(),
                                      initialIndex: index,
                                    ),
                                  );
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.grey.shade900,
                                    child: Image.network(
                                      item,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Center(
                                            child: Icon(
                                              Icons.image_not_supported,
                                              size: 50,
                                              color: Colors.grey,
                                            ),
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          )
                          .toList(),
                    ),
                  ),
                  // Gradient overlay so indicators are always visible
                  if ((widget.project.images as List).length > 1)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 48,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xCC000000),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  // Indicators
                  if ((widget.project.images as List).length > 1)
                    Positioned(
                      bottom: 10.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (widget.project.images as List)
                            .asMap()
                            .entries
                            .map<Widget>((entry) {
                              return GestureDetector(
                                onTap: () => _carouselController.animateToPage(
                                  entry.key,
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: _current == entry.key ? 20.0 : 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: _current == entry.key
                                        ? AppColors.primaryAccent
                                        : Colors.white.withValues(alpha: 0.85),
                                  ),
                                ),
                              );
                            })
                            .toList(),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.role,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.secondaryAccent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (widget.project.techStack as List<String>)
                          .map(
                            (tech) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryAccent.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryAccent,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    if (widget.project.link.isNotEmpty)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          onPressed: () =>
                              widget.onLaunch(widget.project.link),
                          icon: Icon(
                            widget.project.linkLabel == 'GitHub'
                                ? FontAwesomeIcons.github
                                : widget.project.linkLabel == 'Play Store'
                                    ? FontAwesomeIcons.googlePlay
                                    : widget.project.linkLabel == 'AppStore'
                                        ? FontAwesomeIcons.appStore
                                        : Icons.open_in_new,
                            size: 16,
                          ),
                          label: Text(widget.project.linkLabel),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primaryAccent,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
