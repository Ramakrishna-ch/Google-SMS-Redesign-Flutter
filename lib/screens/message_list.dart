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
                child: ListView.builder(
                  itemCount: contactnoDat.length,
                  itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    value: contactnoDat[index],
                    child: MessageListItem(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
