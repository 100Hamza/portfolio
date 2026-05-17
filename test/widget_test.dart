import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:hamza_portfolio/main.dart';
import 'package:hamza_portfolio/presentation/providers/portfolio_provider.dart';
import 'package:hamza_portfolio/presentation/providers/theme_provider.dart';

void main() {
  testWidgets('Portfolio smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => PortfolioProvider()),
        ],
        child: const PortfolioApp(),
      ),
    );

    // Verify that the app renders successfully and finds the name.
    expect(find.text('Muhammad Hamza'), findsWidgets);
  });
}
