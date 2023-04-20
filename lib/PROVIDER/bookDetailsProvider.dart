import 'package:flutter/cupertino.dart';

class BookDetailsProvider with ChangeNotifier {
  String? bookName;
  String? bookSubTitle;
  String? bookImage;
  String? bookDescription;

  bool _isProcessing = true;

  bool get isProcessing => _isProcessing;

  setProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  setBookName(String setBookName) {
    bookName = setBookName;
    notifyListeners();
  }

  setBookSubtitle(String setBookSubTitle) {
    bookSubTitle = setBookSubTitle;
    notifyListeners();
  }

  setBookImage(String setBookImage) {
    bookImage = setBookImage;
    notifyListeners();
  }

  setBookDescription(String setBookDescription) {
    bookDescription = setBookDescription;
    notifyListeners();
  }
}
