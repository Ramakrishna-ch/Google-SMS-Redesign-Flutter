import '../widgets/appBar.dart';
import '../widgets/message_list_item.dart';
import 'package:flutter/material.dart';
import '../models/messages.dart';
import 'package:provider/provider.dart';
import '../helpers/sms_receiver.dart';
import 'package:sms_maintained/sms.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  bool isReceive = false;
  @override
  Widget build(BuildContext context) {
    final messagedat = Provider.of<Messages>(context);
    final contactnoDat = messagedat.contactDist;
    print(contactnoDat.length);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx1, bool innerbool) {
          return <Widget>[SliverAppBar(title: AppBarWidget())];
        },
        body: MediaQuery.removePadding(
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
                      TextButton(
                        onPressed: () {
                          if (!isReceive) {
                            SMSreceiver sms = SMSreceiver();
                            sms.receive(context);
                            isReceive = true;
                          }
                        },
                        child: Text(
                          'Start chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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
      ),
    );
  }
}
