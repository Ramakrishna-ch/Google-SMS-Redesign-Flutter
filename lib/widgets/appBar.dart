import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 8,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: Text(
                'Search links',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                    fontFamily: 'GoogleRegular'),
              ),
            ),
            Icon(
              Icons.more_vert,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
