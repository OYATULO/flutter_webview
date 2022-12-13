import 'package:flutter/material.dart';

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child:const Center(
            child:  Text(
              'Нет соединения с интернетом !!!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}