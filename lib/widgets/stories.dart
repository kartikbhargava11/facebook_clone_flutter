import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './profile_avatar.dart';

import '../config/palette.dart';
import '../models/user.dart';
import '../models/story.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    required this.currentUser,
    required this.stories,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}


class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard({
    this.isAddStory = false,
    this.currentUser,
    this.story,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory ? Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add),
                iconSize: 30.0,
                color: Palette.facebookBlue,
                onPressed: () {}
            ),
          ) : ProfileAvatar(
            imageUrl: story!.user.imageUrl,
            hasBorder: !story!.isViewed,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add Story' : story!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        )
      ],
    );
  }
}
