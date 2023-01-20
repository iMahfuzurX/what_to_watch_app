//
// Created by iMahfuzurX on 1/20/2023.
//
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryScreenState();
  }
}

class _CategoryScreenState extends State<StatefulWidget> {
  final appBar = AppBar(
    title: Text('Categories'),
  );

  final drawerThemeData =
      DrawerThemeData(shape: ShapeBorderTween().transform(1));

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: appBar,
      drawer: Drawer(
        // elevation: 5,
        shape: drawerThemeData.shape,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: mediaQuery.padding.top + appBar.preferredSize.height),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                  child: Text(
                'what to watch',
                style: TextStyle(
                  fontSize: 32,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                ),
              )),
            ),
          ],
        ),
      ),
      body: Text('hellow'),
    );
  }
}
