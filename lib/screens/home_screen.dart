import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/circle_button.dart';
import '../widgets/create_post_container.dart';
import '../widgets/rooms.dart';
import '../widgets/stories.dart';
import '../widgets/post_container.dart';

import '../config/palette.dart';
import '../models/post.dart';
import '../data/data.dart';

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
            title: const Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              )
            ),
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () {},
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUser
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                final Post post = posts[index];
                return PostContainer(
                  post: post
                );
              },
              childCount: posts.length
            ),
          )
        ],
      )
    );
  }
}
