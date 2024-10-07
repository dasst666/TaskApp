import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  final ScrollController scrollController;

  const AddScreen({super.key, required this.scrollController});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20),
          child: TextField(
            textAlign: TextAlign.start,
            controller: _controller,
            decoration: InputDecoration(
              hintText: "What do you need to do",
              hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.3),
              ),
              border: InputBorder.none,
              alignLabelWithHint: true,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              print(_controller.text);
            },
            child: const Text('Submit'))
      ],
    );
  }
}
