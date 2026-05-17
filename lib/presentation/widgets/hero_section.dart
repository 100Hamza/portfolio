import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../core/theme/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Text(
          "HELLO, I'M",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.primaryAccent,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w600,
          ),
        ).animate().fade().slideY(begin: 0.3),
        const SizedBox(height: 8),
        Text(
          'MUHAMMAD HAMZA',
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w900),
        ).animate(delay: 200.ms).fade().slideY(begin: 0.3),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          child: DefaultTextStyle(
            style:
                Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.secondaryAccent,
                  fontWeight: FontWeight.bold,
                ) ??
                const TextStyle(),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Software Engineer ~ Flutter Developer',
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
        ).animate(delay: 400.ms).fade().slideY(begin: 0.3),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _launchUrl('assets/cv/hamza_cv.pdf');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.download),
              label: const Text(
                'Download CV',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _launchUrl('mailto:998.hamza.00@gmail.com'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                side: const BorderSide(color: AppColors.secondaryAccent),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.email),
              label: const Text(
                'Contact Me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ).animate(delay: 600.ms).fade().slideY(begin: 0.3),
        const SizedBox(height: 40),
        Row(
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github),
              onPressed: () => _launchUrl('https://github.com/100Hamza'),
              color: Theme.of(context).iconTheme.color,
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.greenAccent,
              ),
              onPressed: () => _launchUrl('https://wa.me/923343383631'),
              color: Theme.of(context).iconTheme.color,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              onPressed: () => _launchUrl(
                'https://linkedin.com/in/muhammad-hamza-23b222211',
              ),
              color: Theme.of(context).iconTheme.color,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.globe),
              onPressed: () => _launchUrl('https://m-hamza-dev.web.app'),
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ).animate(delay: 800.ms).fade().slideY(begin: 0.3),
      ],
    );
  }
}
