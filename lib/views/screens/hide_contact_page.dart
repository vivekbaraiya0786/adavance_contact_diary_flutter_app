import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utlils/Global.dart';

class hidecontact extends StatefulWidget {
  const hidecontact({Key? key}) : super(key: key);

  @override
  State<hidecontact> createState() => _hidecontactState();
}

class _hidecontactState extends State<hidecontact> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(),
     body:  Container(
         alignment: Alignment.center,
         child: (Global.allcontacts.isNotEmpty)
             ?ListView.builder(
           itemCount: Global.allcontacts.length,
           itemBuilder: (context, index) {
             return ListTile(
               onTap: () {
                 Navigator.of(context).pushNamed('edit-page',arguments: Global.allcontacts[index]);
               },
               leading: CircleAvatar(
                 foregroundImage: (Global
                     .allcontacts[index].image) !=
                     null
                     ? FileImage(
                     Global.allcontacts[index].image as File)
                     : null,
               ),
               title: Text(
                 "${Global.allcontacts[index].firstname} ${Global.allcontacts[index].lastname}",
               ),
               subtitle: Text(
                 "+91 ${Global.allcontacts[index].phonenumber}",
               ),
               trailing: const Icon(
                 Icons.phone,
                 color: Colors.green,
               ),
             );
           },
         )
             : Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.account_box, size: h * 0.25,color: Colors.blue),
             Text(
               "You have not Contact yet",
               style: GoogleFonts.aBeeZee(
                 fontWeight: FontWeight.bold,
                 fontSize: w * 0.05,
               ),
             ),
           ],
         )
     ),
    );
  }
}
