import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final ValueChanged<String?> onSubmitted;

  const SearchField({super.key, required this.hint, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: onSubmitted,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
          isDense: true,
          filled: true,
          hintText: hint,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.black45),
          prefixIconConstraints: BoxConstraints(minWidth: 0),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Colors.grey,
          ).marginOnly(left: 6, top: 6, bottom: 6),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
