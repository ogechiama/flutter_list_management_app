import 'package:flutter/material.dart';

import '../models/item.dart';

class DetailScreen extends StatelessWidget{
  final Item item;
  const DetailScreen({super.key, required this.item});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        elevation: 2,
      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
              decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.1),borderRadius: BorderRadius.circular(8)),
              child: Text('Item Id: ${item.id}',style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 12,),
            Text(item.title,
              style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 12,),
            Text(item.subtitle,
              style: TextStyle(fontSize: 16,
                  color: Colors.grey[700],height: 1.4),
            )
          ],
        ),),
    );
  }
}
