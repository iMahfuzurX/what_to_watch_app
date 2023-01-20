//
// Created by iMahfuzurX on 1/20/2023.
//
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildTopBar() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: mediaQuery.padding.top,
          ),
          _buildTopBar(),
          Container(
            margin: EdgeInsets.all(16),
            height: 100,
            child: FittedBox(
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
          Text(
            'Your Name',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
