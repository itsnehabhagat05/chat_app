import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('ChatScreen')),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: 
              Container(
                width: w,
                child: ListView.builder(                 
                  itemCount: messages.length ,
                  itemBuilder: (context, index) {
                    return Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 5,horizontal: 8) ,

                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      //color: Colors.purple,
                      child: Row(
                        mainAxisAlignment: messages[index]['uid']==1234? MainAxisAlignment.end:MainAxisAlignment.start,
                        children: [
                          messages[index]['uid']!=1234?Container():giveTime(messages[index]['time']),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 14),
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.only(
                                bottomLeft:Radius.circular(20),
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(messages[index]['uid']==1234?20:0),
                                bottomRight: Radius.circular(messages[index]['uid']==1234?0:20),
                                 
                              ),


                              color:messages[index]['uid']==1234?Colors.grey.shade800 :
                              Colors.grey.shade900.withOpacity(0.9),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: w*2/3,     
                            ),
                            
                            child: Text(messages[index]['text'])),
                      messages[index]['uid']==1234?Container():giveTime(messages[index]['time'])  
                        ],
                      ),
                    );
                  },
                ),

               // color: Colors.red,
              )),
              Container(
                height:80 ,
                
                child:Row(               
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      //color: Colors.grey,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText:'Enter a message',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    )),
                    IconButton(onPressed:() {},
                    icon: Icon (
                      Icons.send,
                      size: 30,
                      ),)
                  ],
                ),
              ),
              //SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Widget giveTime(DateTime dateTime){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(DateFormat('kk:mm').format(dateTime),
      style: TextStyle(fontStyle: FontStyle.italic,
      color: Colors.grey.shade600,
      ),
      ));
  }
}
