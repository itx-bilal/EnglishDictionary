import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3A5BE),
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 40,
              child: Container(
                width: double.infinity,
                height: 170,
                color: Colors.white,
                child: Column(
                  children: [
                    Text('Umbrella',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Expanded(child: Text('An artificial product used to resist the rain water')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.copy_rounded))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 3,
      )
    );
  }
}