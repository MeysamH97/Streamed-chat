import 'package:chat_by_socket_samle/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../resources/custom_sizes.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog({
    super.key,
    required this.title,
    required this.content,
    required this.acceptText,
    required this.acceptFunction,
  });

  final String title;
  final String content;
  final String acceptText;
  final void Function() acceptFunction;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    CustomSize size = CustomSize(context);
    return AlertDialog(
      backgroundColor: color.surface,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: size.textLevel5(),
            color: color.primary,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: TextStyle(
              fontSize: size.textLevel6(),
              color: color.primary,
            ),
          ),
          SizedBox(
            height: size.verticalSpaceLevel5(),
          ),
          Divider(
            color: color.tertiary,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () => Navigator.pop(context),
                text: 'Cancel',
                color: color.inversePrimary,
                textColor: color.tertiary,
                horizontalSpace: size.horizontalSpaceLevel4(),
                verticalSpace: size.verticalSpaceLevel6(),
              ),
              CustomButton(
                onTap: () {
                  acceptFunction(); // Call the function here
                  Navigator.pop(context);
                },
                text: acceptText,
                horizontalSpace: size.horizontalSpaceLevel4(),
                verticalSpace: size.verticalSpaceLevel6(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
