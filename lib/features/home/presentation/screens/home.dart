import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_entity.dart';
import 'package:chat_by_socket_samle/features/home/presentation/bloc/get_current_user_data_status.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/custom_drawer.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../core/resources/custom_sizes.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  final String currentUserId;

  const Home({super.key, required this.currentUserId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModelEntity> users = [];
  late GlobalKey<ScaffoldState> _scaffoldKey;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.currentUserId);
    BlocProvider.of<HomeBloc>(context)
        .add(GetCurrentUserDataEvent(widget.currentUserId));
   _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;
    final CustomSize size = CustomSize(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.getCurrentUserDataStatus is GetCurrentUserDataLoading) {
          print(widget.currentUserId);
          return SafeArea(
            child: Scaffold(
              drawer: CustomDrawer(context: context),
              appBar: AppBar(
                // تنظیم ارتفاع بیشتر برای AppBar
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
                      bottomLeft: Radius.circular(15), // افکت خمیده در گوشه‌ها
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                leading: InkWell(
                  borderRadius: BorderRadius.circular(size.shapeLevel6()),
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: Icon(
                    Icons.menu,
                    size: size.shapeLevel6(),
                    color: color.primary, // رنگ آیکن منو
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: color.primary,
                      radius: size.shapeLevel6(),
                      child: Icon(
                        Icons.person,
                        color: color.onPrimary,
                        size: size.shapeLevel5(),
                      ),
                    ),
                    SizedBox(width: size.horizontalSpaceLevel5()),
                    Text(
                      'Connecting ... ',
                      style: TextStyle(
                        fontSize: size.textLevel4() / 2,
                        color: color.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              body: Center(
                child: LoadingWidget(
                  size: CustomSize(context).shapeLevel5(),
                ),
              ),
            ),
          );
        }

        if (state.getCurrentUserDataStatus is GetCurrentUserDataCompleted) {
          final GetCurrentUserDataCompleted getCurrentUserDataCompleted =
              state.getCurrentUserDataStatus as GetCurrentUserDataCompleted;
          UserModelEntity currentUser =
              getCurrentUserDataCompleted.userModelEntity;
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey, // استفاده از GlobalKey برای Scaffold
              drawer: CustomDrawer(context: context),
              appBar: AppBar(
                toolbarHeight: size.shapeLevel4(),
                // تنظیم ارتفاع بیشتر برای AppBar
                backgroundColor: Colors.transparent,
                // ایجاد پس‌زمینه شفاف
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
                      bottomLeft: Radius.circular(15), // افکت خمیده در گوشه‌ها
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                leading: InkWell(
                  borderRadius: BorderRadius.circular(size.shapeLevel6()),
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: Icon(
                    Icons.menu,
                    size: size.shapeLevel6(),
                    color: color.primary, // رنگ آیکن منو
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: color.primary,
                      radius: size.shapeLevel6(),
                      child: (currentUser.profilePictureUrl != null &&
                              currentUser.profilePictureUrl != '')
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(size.shapeLevel5()),
                              child: Image.network(
                                currentUser.profilePictureUrl!,
                                width: size.shapeLevel5() * 2,
                                height: size.shapeLevel5() * 2,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Icon(
                              Icons.person,
                              color: color.onPrimary,
                              size: size.shapeLevel5(),
                            ),
                    ),
                    SizedBox(width: size.horizontalSpaceLevel5()),
                    Text(
                      'My Chat App Name',
                      style: TextStyle(
                        fontSize: size.textLevel4() / 2,
                        color: color.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: users.isNotEmpty
                        ? ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return UserTile(user: user);
                            },
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.supervisor_account_outlined,size: size.shapeLevel2(),color: color.primary,),
                              SizedBox(height: size.verticalSpaceLevel6(),),
                              Text(
                                "No Conversation Yet",
                                style: TextStyle(
                                  fontSize: size.textLevel6(),
                                  color: color.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],),

                          ),
                  )
                ],
              ),
            ),
          );
        }

        if (state.getCurrentUserDataStatus is GetCurrentUserDataError) {
          final GetCurrentUserDataError getCurrentUserDataError =
              state.getCurrentUserDataStatus as GetCurrentUserDataError;
          return SafeArea(
            child: Scaffold(
              drawer: CustomDrawer(context: context),
              appBar: AppBar(
                toolbarHeight: size.shapeLevel4(),
                // تنظیم ارتفاع بیشتر برای AppBar
                backgroundColor: Colors.transparent,
                // ایجاد پس‌زمینه شفاف
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
                      bottomLeft: Radius.circular(15), // افکت خمیده در گوشه‌ها
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                leading: InkWell(
                  borderRadius: BorderRadius.circular(size.shapeLevel6()),
                  onTap: () => _scaffoldKey.currentState!.openDrawer(),
                  child: Icon(
                    Icons.menu,
                    size: size.shapeLevel6(),
                    color: color.primary, // رنگ آیکن منو
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: color.primary,
                      radius: size.shapeLevel6(),
                      child: Icon(
                        Icons.person,
                        color: color.onPrimary,
                        size: size.shapeLevel7(),
                      ),
                    ),
                    SizedBox(width: size.horizontalSpaceLevel5()),
                    Text(
                      'Connecting ... ',
                      style: TextStyle(
                        fontSize: size.textLevel4() / 2,
                        color: color.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              body: Center(
                child: Text(
                  getCurrentUserDataError.message,
                  style: TextStyle(
                    fontSize: size.textLevel5(),
                    color: color.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
