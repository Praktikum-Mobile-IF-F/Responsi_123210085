import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'database_favorite.g.dart';

@HiveType(typeId: 1)
class Favorite {
  Favorite({required this.id, required this.cek});

  @HiveField(0)
  String id;

  @HiveField(1)
  String cek;
}
