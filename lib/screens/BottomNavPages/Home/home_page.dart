import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                 ...List.generate(3, (index){
                   return Container(
                     child: Column(
                       children: [
                         ListTile(
                           contentPadding: const EdgeInsets.all(0) ,
                           leading: CircleAvatar(),
                           title: Text("Jon Doe"),
                           trailing: IconButton(onPressed: (){}, icon:Icon(Icons.share)),
                         )
                       ],
                     ),
                   );
                 })
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
