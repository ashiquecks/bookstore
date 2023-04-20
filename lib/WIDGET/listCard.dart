import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget listCard({
  required BuildContext context,
  required String imageResponse,
  required String subTitelResponse,
  required String titleResponse,
  required void Function() cardAction,
}) {
  return InkWell(
    onTap: cardAction,
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            imageUrl: imageResponse,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Icon(Icons.image),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.7,
          child: ListTile(
            title: Text(titleResponse),
            subtitle: Text(
              subTitelResponse,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}
