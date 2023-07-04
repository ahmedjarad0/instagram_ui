import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/instagram/new_post.dart';
import 'package:instagram_ui/instagram/post_widget.dart';
import 'package:instagram_ui/instagram/story_widget.dart';

import '../data/dummy_data.dart';


class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  bool isDark = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Instagram',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        actions: [
          Image.asset('asset/images/like.png',
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('asset/images/send.png',height: 20,width: 20,),
          ),
        ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade400, width: 2),
                          shape: BoxShape.circle),
                      child: const CircleAvatar(
                        radius: 40,
                        // backgroundImage: NetworkImage(post[0].user!.image!),
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add),
                      ),
                    );
                  }
                  return StoryWidget(post[index].user!);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  return PostWidget(
                      user: post[index].user!, post: post[index].post!);
                },
              ),
            ),
          ],
        )

        // SingleChildScrollView(
        //   child: Column(
        //     children: post
        //         .map((e) => PostWidget(
        //               user: e.user!,
        //               post: e.post!,
        //             ))
        //         .toList(),
        //   ),
        // ),
        ,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.red,
          fixedColor: Colors.red,
          unselectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('asset/images/home.png', height: 20),
              activeIcon: Image.asset('asset/images/home2.png', height: 20),
              label: '.',
            ),
            BottomNavigationBarItem(
                icon: Image.asset('asset/images/search.png', height: 20),
                activeIcon: Image.asset('asset/images/serch12.png', height: 20),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset('asset/images/new.png', height: 30),
                activeIcon:
                    Image.asset('asset/images/addition.png', height: 22),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset('asset/images/video.png', height: 20),
                activeIcon: Image.asset('asset/images/video22.png', height: 20),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset('asset/images/user1.png', height: 20),
                activeIcon:
                    Image.asset('asset/images/profile-user.png', height: 20),
                label: ''),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewPost(),));
        },child: Icon(Icons.add)),
      ),
    );
  }
}
