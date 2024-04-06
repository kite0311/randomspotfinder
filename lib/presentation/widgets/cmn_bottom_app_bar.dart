import 'package:flutter/material.dart';

class CmnBottomAppBar extends StatelessWidget {
  const CmnBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: Colors.blue,
      notchMargin: 20.0,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
