import 'package:flutter/material.dart';

import './profile_avatar.dart';

import '../models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            imageUrl: user.imageUrl,
          ),
          const SizedBox(width: 6.0),
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
