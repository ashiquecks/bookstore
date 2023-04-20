import 'package:bookstore/PROVIDER/bookDetailsProvider.dart';
import 'package:bookstore/SERVICE/getBookDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BookDetailsPage extends StatefulWidget {
  final String selfLink;
  const BookDetailsPage({super.key, required this.selfLink});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  getBookDeatailsResponse({required String selfLink}) async {
    var provider = Provider.of<BookDetailsProvider>(context, listen: false);
    var response = await getBookDetailsApi(detailsUrl: selfLink);
    if (response.isSuccessful!) {
      provider.setBookName(response.data!.volumeInfo.title);
      provider.setBookSubtitle(response.data!.volumeInfo.subtitle);
      provider.setBookImage(response.data!.volumeInfo.imageLinks.large);
      provider.setBookDescription(response.data!.volumeInfo.description);
    } else {
      print(response.message);
    }
    provider.setProcessing(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookDeatailsResponse(selfLink: widget.selfLink);
  }

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
      ),
      body: Consumer<BookDetailsProvider>(
        builder: (context, value, child) {
          return value.isProcessing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          value.bookImage.toString(),
                          height: widgetSize.height / 3,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(value.bookName.toString()),
                            subtitle: Text(value.bookSubTitle.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(value.bookDescription.toString()),
                          ),
                        ],
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
