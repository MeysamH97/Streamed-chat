import 'package:flutter/material.dart';

import '../../../../core/resources/custom_sizes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.profilePictureUrl,
    this.leading
  });

  final String title;
  final String? profilePictureUrl;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final CustomSize size = CustomSize(context);
    final ColorScheme color = Theme.of(context).colorScheme;

    return AppBar(
      key: ValueKey<String>(title), // برای مدیریت انیمیشن‌ها در AnimatedSwitcher
      toolbarHeight: size.shapeLevel4(),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.tertiary,
              color.tertiary.withOpacity(0.5),
              color.tertiary.withOpacity(0.25),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      leading: leading,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.primary,
            radius: size.shapeLevel6(),
            child: (profilePictureUrl != null && profilePictureUrl != '')
                ? ClipRRect(
              borderRadius: BorderRadius.circular(size.shapeLevel5()),
              child: Image.network(
                profilePictureUrl!,
                width: size.shapeLevel5() * 2,
                height: size.shapeLevel5() * 2,
                fit: BoxFit.fill,
              ),
            )
                : Icon(
              Icons.person,
              color: color.onPrimary,
              size: size.shapeLevel7(),
            ),
          ),
          SizedBox(width: size.horizontalSpaceLevel5()),
          Text(
            title,
            style: TextStyle(
              fontSize: size.textLevel4() / 2,
              color: color.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
