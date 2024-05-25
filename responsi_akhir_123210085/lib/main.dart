import 'package:flutter/material.dart';
import 'package:responsi_123210085/database/boxes.dart';
import 'package:responsi_123210085/database/database_favorite.dart';
import 'package:responsi_123210085/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  boxFavorite = await Hive.openBox<Favorite>('favoriteBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}
