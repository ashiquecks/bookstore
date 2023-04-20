import 'package:bookstore/MODAL/bookListModal.dart';
import 'package:flutter/cupertino.dart';

class BookListProvider extends ChangeNotifier {
  bool _isProcessing = true;
  List<Item> _bookList = [];
  bool get isProcessing => _isProcessing;

  setProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  List<Item> get bookList => _bookList;

  setBookList(List<Item> list) {
    _bookList.addAll(list);
    notifyListeners();
  }

  mergeBookList(List<Item> list) {
    _bookList = list;
    notifyListeners();
  }

  Item getPostByIndex(int index) => _bookList[index];
}
