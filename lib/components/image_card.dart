import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget renderImageCard(
    String imageUrl, String imageTitle, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => {
          GoRouter.of(context)
              .go('/imageDetail?imageUrl=$imageUrl&imageTitle=$imageTitle')
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.network(
                    imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Text(
                  imageTitle.isNotEmpty ? imageTitle : '-',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                )),
              ]),
            )),
      ));
}
