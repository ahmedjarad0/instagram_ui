import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_ui/data/dummy_data.dart';
import 'package:instagram_ui/models/post.dart';
import 'package:instagram_ui/models/post_response.dart';
import 'package:instagram_ui/models/user.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File? selectedImage;
  TextEditingController textEditingController = TextEditingController();

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);
    setState(() {});
  }
  GlobalKey<FormState> formKey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Post')),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),

                      // border: Border.all(color: Colors.grey.shade400)
                    ),
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10),
                      child: selectedImage == null
                          ? Icon(
                              Icons.add,
                              size: 40,
                            )
                          : Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'required value';
                    } else if (value.length < 10) {
                      return 'Your content must be larger than 10 letter';
                    }
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'New Post',
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedImage==null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Enter required Data'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                          },
                        ),
                        backgroundColor: Colors.grey,
                      ));
                    } else if(formKey.currentState!.validate()){
                      User user = User(
                        'Ahmed',
                        'https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=975&q=80',
                      );
                      Post posts = Post.fromFile(
                          content: textEditingController.text,
                          imageFile: selectedImage);
                      PostResponse postResponse = PostResponse(user, posts);
                      post.add(postResponse);

                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
