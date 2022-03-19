import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.grey.shade300,
        backgroundColor: Colors.grey.shade300,
        title: Text("微信", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          Image.asset("assets/images/search.png", width: 25,),
          SizedBox(width: 10,),
          Image.asset("assets/images/more.png", width: 25,),
          SizedBox(width: 10,),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.grey.shade300,
        ),
      ),

    );
  }

  Padding MessageItem(
      String avater, String nickName, String time, String lastMesaage) {
    return Padding(
      padding: EdgeInsets.only(top: 10,bottom: 5 ,left: 17,right: 15),
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                avater,
                width: 50,
              ),
            ),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Colors.grey.shade300, width: 0.5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nickName,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          time,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(lastMesaage,
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
