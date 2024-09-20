import 'package:flutter/material.dart';

import '../../../../core/resources/custom_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar(
      {super.key,
      required this.title,
      this.leading,
      this.avatar,
      this.avatarRadius, required this.context});

  final BuildContext context;
  final Widget title;
  final Widget? leading;
  final Widget? avatar;
  final double? avatarRadius;


  @override
  Widget build(BuildContext context) {
    final CustomSize size = CustomSize(context);
    final ColorScheme color = Theme.of(context).colorScheme;

    return AppBar(
      elevation: 50,
      toolbarHeight: size.verticalSpaceLevel3(),
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
        ),
      ),
      leading: leading,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          avatar != null
              ? Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: color.primary,
                      radius: size.shapeLevel6(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(size.shapeLevel5()),
                        child: avatar,
                      ),
                    ),
                    SizedBox(width: size.horizontalSpaceLevel5()),
                  ],
                )
              : const SizedBox(),
          title,
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.verticalSpaceLevel3());

  get size => CustomSize(context);
}
