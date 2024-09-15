import 'package:chat_by_socket_samle/core/resources/custom_sizes.dart';
import 'package:chat_by_socket_samle/core/widgets/custom_show_dialog.dart';
import 'package:chat_by_socket_samle/features/home/presentation/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth_service/presentation/bloc/auth_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    CustomSize size = CustomSize(context);
    return Drawer(
      backgroundColor: color.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: size.verticalSpaceLevel2() * 2,
                child: DrawerHeader(
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.message,
                          size: size.shapeLevel3(),
                          color: color.primary,
                        ),
                        SizedBox(
                          height: size.verticalSpaceLevel6(),
                        ),
                        Text(
                          "M Y  C H A T  A P P  N A M E",
                          style: TextStyle(
                              fontSize: size.textLevel7(),
                              color: color.primary),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.horizontalSpaceLevel5(),
                  vertical: size.verticalSpaceLevel8(),
                ),
                child: ListTile(
                    onTap: () {},
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: color.primary,
                              size: size.shapeLevel6(),
                            ),
                            SizedBox(
                              width: size.horizontalSpaceLevel4(),
                            ),
                            Text(
                              "P R O F I L E",
                              style: TextStyle(
                                fontSize: size.textLevel6(),
                                color: color.primary,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: color.primary,
                          size: size.shapeLevel7(),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.horizontalSpaceLevel5(),
                  vertical: size.verticalSpaceLevel8(),
                ),
                child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: color.primary,
                              size: size.shapeLevel6(),
                            ),
                            SizedBox(
                              width: size.horizontalSpaceLevel4(),
                            ),
                            Text(
                              "S E T T I N G S",
                              style: TextStyle(
                                fontSize: size.textLevel6(),
                                color: color.primary,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: color.primary,
                          size: size.shapeLevel7(),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.horizontalSpaceLevel5(),
              vertical: size.verticalSpaceLevel8(),
            ),
            child: ListTile(
              onTap: () {
                logOutDialog(context);
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: color.primary,
                        size: size.shapeLevel6(),
                      ),
                      SizedBox(
                        width: size.horizontalSpaceLevel4(),
                      ),
                      Text(
                        "L O G O U T",
                        style: TextStyle(
                          fontSize: size.textLevel6(),
                          color: color.primary,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: color.primary,
                    size: size.shapeLevel7(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  logOutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) {
        return CustomShowDialog(
          title: 'Log out',
          content: 'Are you sure you want to log out?',
          acceptText: 'Log Out',
          acceptFunction: () => logOut(context),
        );
      },
    );
  }

  logOut(context) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    Navigator.pop(context);
    BlocProvider.of<AuthBloc>(context).add(
      SignOutEvent(userId!),
    );

  }
}
