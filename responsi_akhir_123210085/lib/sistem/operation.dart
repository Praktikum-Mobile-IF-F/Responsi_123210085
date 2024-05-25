import 'package:responsi_123210085/database/boxes.dart';
import 'package:responsi_123210085/database/database_favorite.dart';

class Operation {
  String id;
  String cek;

  Operation(this.id, this.cek);

  void input() {
    boxFavorite.put('key_$id', Favorite(id: this.id, cek: this.cek));
  }
}
