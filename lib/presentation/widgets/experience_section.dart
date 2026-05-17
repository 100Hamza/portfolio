import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/portfolio_provider.dart';
import '../../core/theme/app_colors.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(width: 60, height: 4, color: AppColors.primaryAccent),
        const SizedBox(height: 24),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.experiences.length,
          itemBuilder: (context, index) {
            final exp = provider.experiences[index];
            return Stack(
              children: [
                if (index != provider.experiences.length - 1)
                  Positioned(
                    left: 7,
                    top: 24,
                    bottom: 0,
                    child: Container(
                      width: 2,
                      color: AppColors.primaryAccent.withValues(
                        alpha: 0.3,
                      ),
                    ),
                  ),
                Positioned(
                  left: 0,
                  top: 24,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryAccent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryAccent,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LayoutBuilder(
                            builder: (context, headerConstraints) {
                              final isWide = MediaQuery.of(context).size.width > 600;
                              if (isWide) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        exp.title,
                                        style: Theme.of(context).textTheme.titleLarge
                                            ?.copyWith(
                                              color: AppColors.primaryAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      exp.date,
                                      style: Theme.of(context).textTheme.bodyMedium
                                          ?.copyWith(fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exp.title,
                                      style: Theme.of(context).textTheme.titleLarge
                                          ?.copyWith(
                                            color: AppColors.primaryAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      exp.date,
                                      style: Theme.of(context).textTheme.bodyMedium
                                          ?.copyWith(fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          Text(
                            exp.company,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),
                          ...exp.responsibilities.map(
                            (r) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '• ',
                                    style: TextStyle(
                                      color: AppColors.secondaryAccent,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      r,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Tools: ${exp.tools}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.secondaryAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
          },
        ),
      ],
    );
  }
}
