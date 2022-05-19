import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import './profile_avatar.dart';

import '../config/palette.dart';
import '../models/post.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4.0),
                _PostCaption(caption: post.caption),
                post.imageUrl != null ? const SizedBox.shrink() : const SizedBox(height: 6.0),

              ],
            ),
          ),
          post.imageUrl != null
            ?
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CachedNetworkImage(
              imageUrl: post.imageUrl as String,
            ),
          )
            :
          const SizedBox.shrink(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.thumb_up, size: 10.0, color: Colors.white),
            ),
            const SizedBox(width: 4.0),
            Text(
              "${post.likes}",
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),
            const Spacer(),
            Text(
              "${post.comments} Comments",
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              "${post.shares} Shares",
              style: TextStyle(
                  color: Colors.grey[600]
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PostButton(
              icon: Icon(MdiIcons.thumbUpOutline, color: Colors.grey[600], size: 20.0),
              label: "Like",
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(MdiIcons.commentOutline, color: Colors.grey[600], size: 20.0),
              label: "Comment",
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(MdiIcons.shareOutline, color: Colors.grey[600], size: 25.0),
              label: "Share",
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;

  const _PostButton({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 25.0,
          child: Row(
            children: [
              icon,
              const SizedBox(width: 4.0),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}



class _PostCaption extends StatelessWidget {
  final String caption;
  const _PostCaption({required this.caption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(caption);
  }
}




class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600
                ),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} ",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(Icons.public, color: Colors.grey[600], size: 12.0)
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),

      ],
    );
  }
}
