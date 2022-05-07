import 'package:facebook_clone_ui/config/palette.dart';
import 'package:facebook_clone_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            floating: true,
            centerTitle: false,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () => print("Object Pressed"),
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30,
                onPressed: () => print("Object Pressed"),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUser,
            ),
          ), //To fit Container we need this
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Room(onlineUsers: onlineUsers),
            ),
          )
        ],
      ),
    );
  }
}
