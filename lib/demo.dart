import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


//ImageFile本地资源图片，和AssetImage不同，前者是显示手机中存储的图片，而后者是显示app内的图片，需要在pubspec.yaml中设置图片路径

class Demo extends StatefulWidget {
  Demo({Key key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  //File属于IO库
  File _image;

  //获取图片
  Future getImage() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageFile本地资源图片',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ImageFile本地资源图片'),
        ),
        body: Center(
          child: Column(
            children: [
              Center(
                child: _image == null
                    ? Text('您还未选择任何图片')
                    : Image.file(
                        _image,
                        scale: .5,
                        fit: BoxFit.cover,
                      ),
              ),
              ElevatedButton(
                onPressed: getImage,
                child: Text('选择图片'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
