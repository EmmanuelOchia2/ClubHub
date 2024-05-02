import 'package:clubhub_app/modules/search/data/user_repository.dart';
import 'package:clubhub_app/modules/search/presentation/search_view/search_view.dart';
import 'package:flutter/material.dart';

void main() {
  final userRepository = UserRepository();
  runApp(MyApp(
    userRepository: userRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.userRepository,
    super.key,
  });
  final UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clubhub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SearchView(
        userRepository: userRepository,
      ),
    );
  }
}
