import 'dart:io';

import 'package:flutter/material.dart';

class ScannerProvider extends ChangeNotifier {
  List<File> scannedImages = [];

  void addImage(File image) {
    scannedImages.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    scannedImages.removeAt(index);
    notifyListeners();
  }

  void clearAll() {
    scannedImages.clear();
    notifyListeners();
  }
}
