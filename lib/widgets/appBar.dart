import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            offset: Offset(0.2, 0.2),
            color: Colors.grey[400],
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          Expanded(
            child: Text(
              'Search links',
              style: TextStyle(fontSize: 17, color: Colors.black54),
            ),
          ),
          Icon(
            Icons.more_vert,
          ),
        ],
      ),
    );
  }
}
