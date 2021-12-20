import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/61054521?s=400&u=aac526ddd67e2844929140444c4b12cb5778ac05&v=4'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
                  )),
              onPressed: () {}),
          IconButton(
              icon: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    size: 16.0,
                    color: Colors.white,
                  )),
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15.0),
                    Text("Search"),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 105.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 20.0),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 20.0),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(height: 20.0),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. build item
  //2. build list
  //3.add item to list
  // arrow function
  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/61054521?s=400&u=aac526ddd67e2844929140444c4b12cb5778ac05&v=4'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ali Hassan",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("Hello my name is Ali Hassan",
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                          width: 7.0,
                          height: 7.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          )),
                    ),
                    Text("02:00 pm"),
                  ],
                ),
              ],
            ),
          )
        ],
      );

  Widget buildStoryItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/61054521?s=400&u=aac526ddd67e2844929140444c4b12cb5778ac05&v=4'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Ali Hassan Ali',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
