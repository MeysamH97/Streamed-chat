import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/custom_sizes.dart';
import '../../../../core/widgets/custom_text_field.dart';

class CustomSendMessageBar extends StatelessWidget {
  const CustomSendMessageBar({super.key, required this.textFieldController});

  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    final CustomSize size = CustomSize(context);
    final ColorScheme color = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.horizontalSpaceLevel7(),
        vertical: size.verticalSpaceLevel7(),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: textFieldController,
              horizontalSpace: size.horizontalSpaceLevel5(),
            ),
          ),
          InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(
                size.shapeLevel5() * 2,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.horizontalSpaceLevel7()/2,
                  vertical: size.verticalSpaceLevel7()/2,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: size.horizontalSpaceLevel7()/2,
                  vertical: size.verticalSpaceLevel7()/2,
                ),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.blue,
                  size: size.shapeLevel5(),
                ),
              )),
        ],
      ),
    );
  }
}
