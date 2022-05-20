import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/circle_button.dart';
import '../widgets/create_post_container.dart';
import '../widgets/rooms.dart';
import '../widgets/stories.dart';
import '../widgets/post_container.dart';
import '../widgets/responsive.dart';
import '../widgets/contact_list.dart';
import '../widgets/more_options_list.dart';

import '../config/palette.dart';
import '../models/post.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController = TrackingScrollController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // click on the screen to un-focus => removes keyboard
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(trackingScrollController: _trackingScrollController),
          desktop: _HomeScreenDesktop(trackingScrollController: _trackingScrollController, scrollController: _scrollController),
        )
      ),
    );
  }
}


class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController trackingScrollController;
  final ScrollController scrollController;
  const _HomeScreenDesktop({required this.trackingScrollController, required this.scrollController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(
                user: currentUser
              )
            ),
          )
        ),
        const Spacer(),
        SizedBox(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
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
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactList(
                users: onlineUsers,
              ),
            ),
          )
        ),
      ],
    );
  }
}


class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController trackingScrollController;
  const _HomeScreenMobile({required this.trackingScrollController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: trackingScrollController,
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
    );
  }
}

