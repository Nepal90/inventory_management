import 'package:flutter/material.dart';
import '../models/user.dart';

class UserInfo extends StatelessWidget {
  final User user;
  final String deviceId;

  const UserInfo({
    Key? key,
    required this.user,
    required this.deviceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('User ID: ${user.id}'),
            Text('Username: ${user.username}'),
            Text('Designation: ${user.designation}'),
            Text('Company: ${user.companyName}'),
            Text('Device ID: $deviceId'),
          ],
        ),
      ),
    );
  }
}