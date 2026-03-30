import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_router.dart';
import 'presentation/providers/game_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final gameProvider = GameProvider();
  await gameProvider.init();

  runApp(
    ChangeNotifierProvider.value(
      value: gameProvider,
      child: const YuliExplorerApp(),
    ),
  );
}

class YuliExplorerApp extends StatelessWidget {
  const YuliExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '于里探索家',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
