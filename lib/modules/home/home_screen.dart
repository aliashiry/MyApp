import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // main axis alignment start
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.menu),
        title: Text('Frist App'),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: () {
              print('done');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('One');
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration:BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment:Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1501163268664-3fdf329d019f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'),
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 200.0,
                  color:Colors.black.withOpacity(.7),
                  padding:EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  child: Text(
                      'Computer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
