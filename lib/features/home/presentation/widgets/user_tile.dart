import 'package:chat_by_socket_samle/core/resources/custom_sizes.dart';
import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, this.onTap, required this.user});

  final void Function()? onTap;
  final UserModelEntity user;

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: CustomSize(context).horizontalSpaceLevel4(),
            vertical: CustomSize(context).verticalSpaceLevel7(),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: CustomSize(context).horizontalSpaceLevel4(),
            vertical: CustomSize(context).verticalSpaceLevel8(),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.secondary,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: CustomSize(context).shapeLevel6(),
                    child: (user.profilePictureUrl != '' &&
                            user.profilePictureUrl != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                                CustomSize(context).shapeLevel6()),
                            child: Image.network(
                              user.profilePictureUrl!,
                              width: CustomSize(context).shapeLevel6() * 2,
                              height: CustomSize(context).shapeLevel6() * 2,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: CustomSize(context).shapeLevel5(),
                          ),
                  ),
                  if (user.isOnline) ...[
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: CustomSize(context).shapeLevel7() / 3,
                      ),
                    )
                  ],
                ],
              ),
              SizedBox(
                width: CustomSize(context).horizontalSpaceLevel5(),
              ),
              Text(
                user.email ?? user.email,
                style: TextStyle(
                  fontSize: CustomSize(context).textLevel6(),
                  color: theme.inversePrimary,
                ),
              ),
            ],
          )),
    );
  }
}
