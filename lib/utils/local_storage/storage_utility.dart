// Yerel depolama alanı

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

// Veri Depolama Bloc
class StorageBloc extends Cubit<Map<String, dynamic>> {
  final GetStorage _storage = GetStorage();

  StorageBloc() : super({});

  // Veri Okuma
  void readData(String key) {
    emit({...state, key: _storage.read(key)});
  }

  // Veri Yazma
  void writeData(String key, dynamic value) {
    _storage.write(key, value);
    emit({...state, key: value});
  }

  // Veri Silme
  void removeData(String key) {
    _storage.remove(key);
    emit({...state, key: null});
  }

  // Tüm Verileri Temizleme
  void clearAll() {
    _storage.erase();
    emit({});
  }
}

// Kullanım Örneği
void main() {
  final storageBloc = StorageBloc();

  // Veri Yazma
  storageBloc.writeData('username', 'john_doe');

  // Veri Okuma
  storageBloc.readData('username');

  // Veri Silme
  storageBloc.removeData('username');

  // Tüm Verileri Temizleme
  storageBloc.clearAll();
}
