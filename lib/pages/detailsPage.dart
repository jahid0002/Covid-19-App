import 'package:covid19/pages/homePage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  String name;
  String image;
  String chase;
  String recover;
  String deth;
  DetailsPage(
      {super.key, required this.name,
      required this.image,
      required this.chase,
      required this.recover,
      required this.deth});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        leading: IconButton( onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back, color: Colors.white) ,),
        backgroundColor:  const Color.fromARGB(255, 113, 157, 240),
        toolbarHeight: 90, 
        centerTitle: true, 
        title: Text(widget.name, style: const TextStyle(
          fontSize: 24,  
          fontWeight: FontWeight.w600, 
          color: Colors.white,

        ),),
      ), 
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 190
                  , width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40), topLeft: Radius.circular(40))),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(right:20.0, left: 20, top: 10, bottom: 10),
                      child: Column(
                        children: [
                          
                           Padding(
                             padding: const EdgeInsets.only(top: 20.0),
                             child: ReuseabalRow(title: 'Total', value: widget.chase),
                           ),
                            ReuseabalRow(title: 'Total Recover', value: widget.recover),
                             ReuseabalRow(title: 'Total Death', value: widget.deth),
                    
                        ],
                      ),
                    ),
                  ),
                ) ,
          
               
              ],
            ),
          ), 
           Positioned(
            right: 160, 
            bottom: 430,
            child: CircleAvatar(radius: 50, backgroundImage: NetworkImage(widget.image))),
        ],
      ),
    );
  }
}
