import 'dart:io';
import 'package:contact_diary/utlils/Global.dart';
import 'package:contact_diary/utlils/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/providers/providers.dart';
import '../../utlils/attributes.dart';
import 'package:share_plus/share_plus.dart';

class editpage extends StatefulWidget {
  const editpage({Key? key}) : super(key: key);

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  int currentstepvalue = 0;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var selectedItem = '';
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    firstnameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(Icons.circle),
          ),
          PopupMenuButton(
            initialValue: '',
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              setState(() {
                selectedItem = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "pohs",
                child: Text("Place On Home Screen"),
              ),
              PopupMenuItem(
                value: "vminu",
                child: Text("Voice Mail is Not Use"),
              ),
              PopupMenuItem(
                value: "dc",
                child: Text("Delete Contact"),
                onTap: ()async {
                  Global.allcontacts.remove(contact);
                  await Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  setState(() {
                  });

                },
              ),
              const PopupMenuItem(
                value: "bl",
                child: Text("Block"),
              ),
              PopupMenuItem(
                onTap: () async {
                  await Share.share(
                      "+91 ${contact.firstname}\nFirst Name: ${contact.firstname}\nLast Name : ${contact.lastname}\nEmail :${contact.email}");
                },
                value: "sha",
                child: const Text("Share"),
              ),

            ],
          ),
          // Icon(Icons.more_vert_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 170,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Photo",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                  leading: Icon(CupertinoIcons.camera),
                                  title: Text('Take photo'),
                                  onTap: () async {
                                    ImagePicker picker = ImagePicker();
                                    XFile? img = await picker.pickImage(
                                        source: ImageSource.camera);
                                    if (img != null) {
                                      setState(() {
                                        contact.image = File(img.path);
                                      });
                                      Navigator.of(context).pop();
                                    }
                                  }),
                              ListTile(
                                  leading: Icon(CupertinoIcons.photo),
                                  title: Text('Choose photo from gallery'),
                                  onTap: () async {
                                    ImagePicker picker = ImagePicker();
                                    XFile? img = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    if (img != null) {
                                      setState(() {
                                        contact.image = File(img.path);
                                      });
                                      Navigator.of(context).pop();
                                    }
                                  }),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 60,
                    foregroundImage: contact.image != null
                        ? FileImage(
                            File(
                              contact.image!.path,
                            ),
                          )
                        : null,
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${contact.firstname}",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "+91 ${contact.phonenumber}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Text("Mobile  | Inida"),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse("tel: +91${contact.phonenumber}"));
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse("sms: +91${contact.phonenumber}"));
                    },
                    icon: const Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Video Call",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse("tel: +91${contact.phonenumber}"));
                    },
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "More",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Google Contact",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("${contact.email}"),
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse(
                          "mailto:${contact.email}?subject=hello ${contact.firstname}${contact.lastname}&body=hello flutter,"));
                    },
                    icon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_fill),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note_outlined),
            label: 'Edit Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
              Navigator.of(context)
                  .pushNamed('edit-contact', arguments: contact);
              // showModal(context);
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

// void showModal(BuildContext context) {
//   Size size = MediaQuery.of(context).size;
//   double h = size.height;
//   double w = size.width;
//   List<Step> _steps = [
//     Step(
//       isActive: (currentstepvalue >= 0) ? true : false,
//       state: (currentstepvalue > 0) ? StepState.indexed : StepState.editing,
//       title: Text("Image Choose", style: GoogleFonts.aBeeZee()),
//       content: Stack(
//         alignment: Alignment.bottomRight,
//         children: [
//           CircleAvatar(
//             radius: w * 0.18,
//             foregroundImage: image != null
//                 ? FileImage(
//               File(image!.path),
//             )
//                 : null,
//           ),
//           FloatingActionButton.small(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return Container(
//                     height: 170,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "Photo",
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         ListTile(
//                             leading: Icon(CupertinoIcons.camera),
//                             title: Text('Take photo'),
//                             onTap: () async {
//                               ImagePicker picker = ImagePicker();
//                               XFile? img = await picker.pickImage(
//                                   source: ImageSource.camera);
//                               if (img != null) {
//                                 setState(() {
//                                   image = File(img.path);
//                                 });
//                                 Navigator.of(context).pop();
//                               }
//                             }),
//                         ListTile(
//                             leading: Icon(CupertinoIcons.photo),
//                             title: Text('Choose photo from gallery'),
//                             onTap: () async {
//                               ImagePicker picker = ImagePicker();
//                               XFile? img = await picker.pickImage(
//                                   source: ImageSource.gallery);
//                               if (img != null) {
//                                 setState(() {
//                                   image = File(img.path);
//                                 });
//                                 Navigator.of(context).pop();
//                               }
//                             }),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             child: Icon(Icons.add),
//           ),
//         ],
//       ),
//     ),
//     Step(
//         isActive: (currentstepvalue >= 1) ? true : false,
//         state: (currentstepvalue > 1) ? StepState.indexed : StepState.editing,
//         title: Text("Full Name", style: GoogleFonts.aBeeZee()),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: firstnameController,
//               onSaved: (newValue) {
//                 FirstName = newValue;
//               },
//               validator: (val) {
//                 if (val!.isEmpty) {
//                   return "Please Enter Your First Name...";
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.grey,
//                     width: 1.5,
//                   ),
//                 ),
//                 disabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: CupertinoColors.activeBlue,
//                   ),
//                 ),
//                 labelText: "First Name",
//                 labelStyle: GoogleFonts.alkalami(),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: lastnameController,
//               onSaved: (newValue) {
//                 LastName = newValue;
//               },
//               validator: (val) {
//                 if (val!.isEmpty) {
//                   return "Please Enter Your Last Name...";
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                       width: 1.5,
//                     ),
//                   ),
//                   disabledBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: CupertinoColors.activeBlue,
//                     ),
//                   ),
//                   labelText: "Last Name",
//                   labelStyle: GoogleFonts.alkalami(),
//                   border: const OutlineInputBorder()),
//             ),
//           ],
//         )),
//     Step(
//       state: (currentstepvalue > 2) ? StepState.indexed : StepState.editing,
//       isActive: (currentstepvalue >= 2) ? true : false,
//       title: Text("Phone Number", style: GoogleFonts.aBeeZee()),
//       content: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             keyboardType: TextInputType.number,
//             controller: phoneController,
//             onSaved: (newValue) {
//               PhoneNumber = newValue;
//             },
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return "Please Enter Your Phone Number...";
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               enabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.grey,
//                   width: 1.5,
//                 ),
//               ),
//               disabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: CupertinoColors.activeBlue,
//                 ),
//               ),
//               label: const Text("Phone Number"),
//               labelStyle: GoogleFonts.alkalami(),
//               border: const OutlineInputBorder(),
//             ),
//           ),
//         ],
//       ),
//     ),
//     Step(
//         state: (currentstepvalue > 3) ? StepState.indexed : StepState.editing,
//         isActive: (currentstepvalue >= 3) ? true : false,
//         title: Text(
//           "Email Id",
//           style: GoogleFonts.aBeeZee(),
//         ),
//         content: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               keyboardType: TextInputType.emailAddress,
//               controller: emailController,
//               onSaved: (newValue) {
//                 Email = newValue;
//               },
//               validator: (val) {
//                 if (val!.isEmpty) {
//                   return "Please Enter Your Email...";
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.grey,
//                     width: 1.5,
//                   ),
//                 ),
//                 disabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: CupertinoColors.activeBlue,
//                   ),
//                 ),
//                 label: const Text("Email Id"),
//                 labelStyle: GoogleFonts.alkalami(),
//                 border: const OutlineInputBorder(),
//               ),
//             ),
//           ],
//         )),
//   ];
//   void _onStepContinue() {
//     setState(() {
//       if (currentstepvalue < _steps.length - 1) {
//         currentstepvalue++;
//       }
//     });
//   }
//   void _onStepCancel() {
//     setState(() {
//       if (currentstepvalue > 0) {
//         currentstepvalue--;
//       }
//     });
//   }
//   showDialog(
//     context: context,
//     builder: (context) => StatefulBuilder(builder: (context, setState) => AlertDialog(
//       content: Container(
//         width: double.maxFinite,
//         child: Stepper(
//           type: StepperType.vertical,
//           onStepContinue: _onStepContinue,
//           onStepCancel: _onStepCancel,
//           onStepTapped: (value) {},
//           currentStep: currentstepvalue,
//           steps: _steps,
//           // controlsBuilder: (context, details) => Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //   children: [
//           //     Transform.scale(
//           //       scale: 0.8,
//           //       child: ElevatedButton(
//           //         style: ButtonStyle(
//           //           backgroundColor: MaterialStateProperty.all(
//           //             Colors.blue,
//           //           ),
//           //         ),
//           //         onPressed: () {
//           //           setState(() {
//           //             _onStepContinue();
//           //             // if (currentstepvalue < 3) {
//           //             //   currentstepvalue++;
//           //             // }
//           //           });
//           //         },
//           //         child: const Text(
//           //           "Continue",
//           //           style: TextStyle(color: Colors.white),
//           //         ),
//           //       ),
//           //     ),
//           //     SizedBox(
//           //       width: w * 0.01,
//           //     ),
//           //     Transform.scale(
//           //       scale: 0.8,
//           //       child: ElevatedButton(
//           //         onPressed: () {
//           //           setState(() {
//           //             _onStepCancel();
//           //             // if (currentstepvalue > 0) {
//           //             //   currentstepvalue--;
//           //             // }else{
//           //             //   image = null;
//           //             // }
//           //           });
//           //         },
//           //         child: const Text("Cancel"),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//         ),
//       ),
//     ),),
//   );
// }
}
