import '../widgets/appBar.dart';
import '../widgets/message_list_item.dart';
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
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            AppBarWidget(),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: contactnoDat.length,
                      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                        value: contactnoDat[index],
                        child: MessageListItem(),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                          color: Theme.of(context).accentColor,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Start chat',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
