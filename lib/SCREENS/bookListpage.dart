import 'package:bookstore/MODAL/bookListModal.dart';
import 'package:bookstore/PROVIDER/bookDetailsProvider.dart';
import 'package:bookstore/PROVIDER/bookListProvider.dart';
import 'package:bookstore/SCREENS/bookDetailsPage.dart';
import 'package:bookstore/SERVICE/getBookDetails.dart';
import 'package:bookstore/SERVICE/getBooksList.dart';
import 'package:bookstore/WIDGET/listCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  getBookListResponse() async {
    var provider = Provider.of<BookListProvider>(context, listen: false);
    var response = await getBookListApi();
    if (response.isSuccessful!) {
      provider.setBookList(response.data!);
    } else {
      print(response.message);
    }
    provider.setProcessing(false);
  }

  @override
  void initState() {
    super.initState();
    getBookListResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        leadingWidth: 0,
        title: const Text("Book Store"),
      ),
      body: Consumer<BookListProvider>(
        builder: (context, value, child) {
          return value.isProcessing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: value.bookList.length,
                  itemBuilder: (context, index) {
                    Item responsePost = value.getPostByIndex(index);
                    return listCard(
                      context: context,
                      imageResponse:
                          responsePost.volumeInfo.imageLinks.smallThumbnail,
                      titleResponse: responsePost.volumeInfo.title,
                      cardAction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsPage(
                              selfLink: responsePost.selfLink,
                            ),
                          ),
                        );
                      },
                      subTitelResponse: responsePost.volumeInfo.subtitle,
                    );
                  },
                );
        },
      ),
    );
  }
}
