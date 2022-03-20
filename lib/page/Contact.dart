import 'package:flutter/material.dart';
import 'package:ws_chat_flutter/widget/MyAppBar.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String labels = "↑ABCDEFGHIJKLMNOPQRSTUVWSYZ#";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: MyAppBar.BuildAppBar("通讯录"),
        body: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                "assets/images/addnew.png",
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Colors.grey.shade300))),
                                child: const Text(
                                  "新的朋友",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
            Container(
              height: 15.0 * labels.length,
              width: 20,
              child: ListView.builder(itemBuilder: (context, index) {
                return Ink(
                  child: InkWell(
                    focusColor: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      height: 15,
                      child: Text(labels[index]),
                    ),
                  ),
                );
              }),
            )
          ],
        ));
  }
}
