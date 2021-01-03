import 'package:SMS/widgets/message_list_item.dart';
import 'package:flutter/material.dart';
import '../models/messages.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messagedat = Provider.of<Messages>(context);
    final contactnoDat = messagedat.contactDist;
    print(contactnoDat.length);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 70,
            leadingWidth: 325,
            backgroundColor: Colors.white,
            floating: true,
            title: Container(
              height: 55,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                elevation: 2,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 18,
                        right: 15,
                      ),
                      child: Icon(Icons.search),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 116),
                      child: Text(
                        'Search links',
                        style: TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                    ),
                    Container(
                      child: Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                contactnoDat.length,
                (index) => ChangeNotifierProvider.value(
                  value: contactnoDat[index], child: MessageListItem(),
                  // contact: contactnoDat[index].contactNo,
                  // messageId: contactnoDat[index].messageId,
                  // messagedes: contactnoDat[index].content,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
