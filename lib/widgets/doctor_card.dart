import 'package:flutter/material.dart';

import '../models/Doctor.dart';
import '../providers/call_and_messaging_service.dart';

class DoctorCard extends StatelessWidget {

  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final Doctor doc;

  DoctorCard(this.doc);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: doc.imageUrl,
                  width: 100,
                  height: 100,
                  placeholderCacheHeight: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                      top: 5,
                      bottom: 2.5,
                      left: 5
                    ),
                    child: Text(
                      doc.name,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                      top: 5,
                      bottom: 2.5,
                      left: 5
                    ),
                    child: Text(
                      doc.field,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _service.call(doc.phoneNo);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.call,
                      color: Colors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _service.sendSms(doc.phoneNo);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.message,
                      color: Colors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _service.sendEmail(doc.emailId);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}