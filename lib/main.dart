import 'package:dining_experience/ui/widgets/single_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/state_manager/search_for_place.dart';
import 'ui/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => MysterySearchProvider(),
        ),
      ], child: const HomePage()),
    );
  }
}




