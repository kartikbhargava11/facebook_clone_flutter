import 'package:flutter/material.dart';

import './profile_avatar.dart';
import './responsive.dart';

import '../config/palette.dart';

import '../models/user.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    required this.onlineUsers,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ?
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ) : null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDesktop ? BorderRadius.circular(10.0) : null,
        ),
        height: 60.0,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.all(1.0),
                child: _CreateRoomButton(),
              );
            } else {
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                )
              );
            }
          },
        ),
      ),
    );
  }
}


class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Palette.facebookBlue
          )
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(width: 3.0, color: Colors.blueAccent[100]!)
        )
      ),
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          const Text(
            "Create \n Room",

          ),
        ],
      ),
    );
  }
}
