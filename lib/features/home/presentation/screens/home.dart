import 'package:chat_by_socket_samle/features/auth_service/domain/entities/user_model_entity.dart';
import 'package:chat_by_socket_samle/features/home/presentation/bloc/home_bloc/get_current_user_data_status.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/custom_drawer.dart';
import 'package:chat_by_socket_samle/features/home/presentation/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/custom_sizes.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../widgets/custom_app_bar.dart';
import 'contacts.dart';

class Home extends StatefulWidget {
  final String currentUserId;

  const Home({super.key, required this.currentUserId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModelEntity> users = [
    OtherUserEntity(
      id: '1',
      email: 'Reza',
      isOnline: true,   ),
    OtherUserEntity(
      id: '1',
      email: 'Hasan',
      isOnline: false,
      profilePictureUrl:
          'https://www.springboard.com/blog/wp-content/uploads/2023/09/what-exactly-does-a-programmer-do.jpeg',
    ),
    OtherUserEntity(
      id: '1',
      email: 'Ali',
      isOnline: true,
    ),
    OtherUserEntity(
      id: '1',
      email: 'Mohammad',
      isOnline: false,    ),
  ];
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer: CustomDrawer(context: context),
              appBar: CustomAppBar(
                context: context,
                titleText: 'Connecting ... ',
                leading: InkWell(
                  borderRadius: BorderRadius.circular(size.shapeLevel6()),
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: Icon(
                    Icons.menu,
                    size: size.shapeLevel6(),
                    color: color.primary, // رنگ آیکن منو
                  ),
                ),
                avatar: Icon(
                  Icons.person,
                  color: color.onPrimary,
                  size: size.shapeLevel5(),
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
          print(currentUser.toString());
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer: CustomDrawer(context: context),
              appBar: CustomAppBar(
                  context: context,
                  titleText: currentUser.username ?? '',
                  leading: InkWell(
                    borderRadius: BorderRadius.circular(size.shapeLevel6()),
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    child: Icon(
                      Icons.menu,
                      size: size.shapeLevel6(),
                      color: color.primary, // رنگ آیکن منو
                    ),
                  ),
                  avatar: Stack(
                    children: [
                      (currentUser.profilePictureUrl != null &&
                              currentUser.profilePictureUrl != '')
                          ? Image.network(
                              currentUser.profilePictureUrl!,
                              width: size.shapeLevel5() * 2,
                              height: size.shapeLevel5() * 2,
                              fit: BoxFit.fill,
                            )
                          : Icon(
                              Icons.person,
                              color: color.onPrimary,
                              size: size.shapeLevel5(),
                            ),
                      if (currentUser.isOnline) ...[
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: CustomSize(context).shapeLevel7() / 3,
                          ),
                        )
                      ],
                    ],
                  )),
              floatingActionButton: FloatingActionButton(
                backgroundColor: color.primary,
                shape: const CircleBorder(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Contacts()),
                  );
                },
                // آیکون کانتکت
                tooltip: 'New Converstation',
                child: const Icon(Icons.add),
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
                                Icon(
                                  Icons.supervisor_account_outlined,
                                  size: size.shapeLevel2(),
                                  color: color.primary,
                                ),
                                SizedBox(
                                  height: size.verticalSpaceLevel6(),
                                ),
                                Text(
                                  "No Conversation Yet",
                                  style: TextStyle(
                                    fontSize: size.textLevel6(),
                                    color: color.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
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
              key: _scaffoldKey,
              drawer: CustomDrawer(context: context),
              appBar: CustomAppBar(
                context: context,
                titleText: 'Check your Network ',
                leading: InkWell(
                  borderRadius: BorderRadius.circular(size.shapeLevel6()),
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: Icon(
                    Icons.menu,
                    size: size.shapeLevel6(),
                    color: color.primary, // رنگ آیکن منو
                  ),
                ),
                avatar: Icon(
                  Icons.person,
                  color: color.onPrimary,
                  size: size.shapeLevel5(),
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
