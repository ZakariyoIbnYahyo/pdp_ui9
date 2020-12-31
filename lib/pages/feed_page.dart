import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui9/model/post_model.dart';
import 'package:pdp_ui9/model/story_model.dart';

class FeedPage extends StatefulWidget {
  static final String id = "feed_page";
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story>_stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Shaxboz"),
    Story("assets/images/user_3.jpeg", "Javohir"),
    Story("assets/images/user_1.jpeg", "Marvarida"),
    Story("assets/images/user_2.jpeg", "Qudrat"),
    Story("assets/images/user_3.jpeg", "Jazmin"),
  ];

  List<Post> _posts = [
    Post(
        userName: "Javohir",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpeg",
        caption: "Mobil dasturlash Sohasida Flutter jadal rivojlanib borayotgan til hisoblanadi"
    ),
    Post(
        userName: "Botir",
        userImage: "assets/images/user_3.jpeg",
        postImage: "assets/images/feed_3.jpeg",
        caption: "Mobil dasturlash Sohasida Flutter jadal rivojlanib borayotgan til hisoblanadi"
    ),
    Post(
        userName: "Shaxboz",
        userImage: "assets/images/user_1.jpeg",
        postImage: "assets/images/feed_1.jpeg",
        caption: "Mobil dasturlash Sohasida Flutter jadal rivojlanib borayotgan til hisoblanadi"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(),
                //#stories watch_all
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Stories", style: TextStyle(color: Colors.grey, fontSize: 14),),
                      Text("Watch All", style: TextStyle(color: Colors.grey, fontSize: 14),)
                    ],
                  ),
                ),
                //#storylist
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: _stories.map((story){
                      return _itemOfStory(story);
                    }).toList(),
                  ),
                ),
                //#postlist
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _posts.length,
                    itemBuilder: (ctx, i){
                      return _itemOfPost(_posts[i]);
                    },
                  ),
                )
              ],
            ),
          ),
      )
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //#header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.userName, style: TextStyle(color: Colors.grey),)
                  ],
                ),
                IconButton(
                  icon: Icon(SimpleLineIcons.options, color: Colors.grey,),
                  onPressed: (){},
                )
              ],
            ),
          ),
          //#image
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),
          ),
          //#icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesome.heart_o, color: Colors.grey,),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.comment_o, color: Colors.grey,),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.send_o, color: Colors.grey,),
                    onPressed: (){},
                  ),

                ],
              ),
              IconButton(
                icon: Icon(FontAwesome.bookmark_o, color: Colors.grey,),
                onPressed: (){},
              )
            ],
          ),
          //#tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.grey)
                  ),
                  TextSpan(
                      text: "Shaxboz, ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                  ),
                  TextSpan(
                    text: "Sherzod, ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  TextSpan(
                    text: "785 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ]
              ),
            ),
          ),
          //#caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  )
                ]
              ),
            ),
          ),
          //#postdate
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text(
              "March 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            )
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name, style: TextStyle(color: Colors.grey),)
      ],
    );
  }
}
