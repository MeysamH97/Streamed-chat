import 'package:chat_by_socket_samle/core/themes/theme_provider.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/custom_sizes.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _HomeState();
}

class _HomeState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;
    final CustomSize size = CustomSize(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.surface,
        appBar: CustomAppBar( context: context, titleText: 'Settings',leading:  InkWell(
          borderRadius: BorderRadius.circular(size.shapeLevel6()),
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: size.shapeLevel6(),
            color: color.primary, // رنگ آیکن منو
          ),
        ),),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.horizontalSpaceLevel4(),
                vertical: size.verticalSpaceLevel6(),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: size.horizontalSpaceLevel4(),
                vertical: size.verticalSpaceLevel7(),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.secondary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: size.textLevel6(),
                      fontWeight: FontWeight.bold,
                      color: color.primary,
                    ),
                  ),
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                    onChanged: (value)
                      => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
