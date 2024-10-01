import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String title;
  final int count;

  const TabItem({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Tab(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
        count > 0
            ? Positioned(
                right: 0,
                top: 7,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }
}
