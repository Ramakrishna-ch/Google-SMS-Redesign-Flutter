import 'package:SMS/screens/message_detail_screen.dart';

import '../widgets/appBar.dart';
import '../widgets/message_list_item.dart';
import 'package:flutter/material.dart';
import '../models/messages.dart';
import 'package:provider/provider.dart';
import '../helpers/sms_receiver.dart';
import 'package:sms_maintained/sms.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  bool isReceive = false;
  var phone = '';

  void alertDialog(BuildContext ctx) {
    final textcontrol = TextEditingController();
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );
    Alert(
      content: TextField(
        decoration: InputDecoration(
          labelText: 'Phone Number',
        ),
        controller: textcontrol,
        onChanged: (value) {
          setState(() {
            phone = value;
          });
        },
      ),
      context: context,
      title: 'New Message',
      style: alertStyle,
      buttons: [
        DialogButton(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(
              ctx,
              MessageDetailScreen.routeName,
              arguments: '+91' + phone,
            );
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder(
                future: Provider.of<Messages>(context, listen: false)
                    .fetchMessages(),
                builder: (ctx, futuresnap) =>
                    futuresnap.connectionState == ConnectionState.waiting
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Consumer<Messages>(
                            child: Center(
                              child: Text('No messages yet, Send some!'),
                            ),
                            builder: (ctx, mesdat, ch) =>
                                mesdat.messages.length <= 0
                                    ? ch
                                    : ListView.builder(
                                        itemCount: mesdat.contactDist.length,
                                        itemBuilder: (ctx, index) =>
                                            ChangeNotifierProvider.value(
                                          value: mesdat.contactDist[index],
                                          child: MessageListItem(),
                                        ),
                                      ),
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
                          isReceive ? Icons.post_add : Icons.message,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (!isReceive) {
                            SMSreceiver sms = SMSreceiver();
                            sms.receive(context);
                            setState(() {
                              isReceive = true;
                            });
                          } else {
                            alertDialog(context);
                          }
                        },
                        child: Text(
                          !isReceive ? 'Start chat' : 'New',
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
