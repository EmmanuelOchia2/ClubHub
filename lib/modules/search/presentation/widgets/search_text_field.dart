import 'package:flutter/material.dart';

typedef TextFieldCallback = void Function(String);

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.onChanged,
    required this.controller,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final TextFieldCallback onChanged;
  final TextEditingController controller;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          suffixIcon: IconButton(
              onPressed: () {
                if (onTap != null) onTap!();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.blueAccent,
              )),
        ),
      ),
    );
  }
}
