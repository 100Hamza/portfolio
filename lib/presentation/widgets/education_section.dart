import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/portfolio_provider.dart';
import '../../core/theme/app_colors.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioProvider>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 850;
        final isMedium = constraints.maxWidth > 550;
        final columnWidth = isWide
            ? (constraints.maxWidth - 48) / 3
            : (isMedium ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Education & Certificates',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(width: 60, height: 4, color: AppColors.primaryAccent),
            const SizedBox(height: 24),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                SizedBox(
                  width: columnWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Education',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.secondaryAccent,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...List.generate(provider.educations.length, (index) {
                        final ed = provider.educations[index];
                        return _buildTimelineTile(
                          context,
                          ed.date,
                          ed.degree,
                          ed.institution,
                          ed.details,
                          index == provider.educations.length - 1,
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  width: columnWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Certificates',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.secondaryAccent,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...List.generate(provider.certificates.length, (index) {
                        final c = provider.certificates[index];
                        return _buildTimelineTile(
                          context,
                          c.date,
                          c.title,
                          c.details,
                          '',
                          index == provider.certificates.length - 1,
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  width: columnWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Courses',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.secondaryAccent,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...List.generate(provider.courses.length, (index) {
                        final c = provider.courses[index];
                        return _buildTimelineTile(
                          context,
                          c.date,
                          c.title,
                          c.institution,
                          '',
                          index == provider.courses.length - 1,
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimelineTile(
    BuildContext context,
    String date,
    String title,
    String subtitle,
    String details,
    bool isLast,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator column
        SizedBox(
          width: 28,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: AppColors.primaryAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: AppColors.primaryAccent, blurRadius: 6),
                  ],
                ),
              ),
              if (!isLast)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: 2,
                  height: 48,
                  color: AppColors.primaryAccent.withValues(alpha: 0.3),
                ),
            ],
          ),
        ),
        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                if (details.isNotEmpty)
                  Text(
                    details,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.secondaryAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
