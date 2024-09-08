import 'package:chat_by_socket_samle/core/resources/custom_sizes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.horizontalSpace,
    this.verticalSpace,
    this.hintText,
    this.obscureText,
    required this.controller, this.onChanged,
  });

  final double? horizontalSpace;
  final double? verticalSpace;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  final String? hintText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalSpace != null
            ? horizontalSpace!
            : CustomSize(context).horizontalSpaceLevel4(),
        vertical: verticalSpace != null
            ? verticalSpace!
            : CustomSize(context).verticalSpaceLevel7(),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText != null ? obscureText! : false,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: CustomSize(context).textLevel7(),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalSpace != null
                ? horizontalSpace! / 2
                : CustomSize(context).horizontalSpaceLevel4() / 2,
            vertical: verticalSpace != null
                ? verticalSpace! / 2
                : CustomSize(context).verticalSpaceLevel7() / 2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText ?? 'Type something ...',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: CustomSize(context).textLevel7(),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
