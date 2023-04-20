import 'dart:io';
import 'package:contact_diary/modals/modals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utlils/attributes.dart';

class CounterProvider extends ChangeNotifier{
  CounterModel counterModel = CounterModel(counter: 0);

  void incremnet(){
    counterModel.counter++;
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier{
  ThemeModel themeModel;

  ThemeProvider({required this.themeModel});

  changeTheme()async{
    themeModel.isDark = !themeModel.isDark;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isDark', themeModel.isDark);

    notifyListeners();
  }
}



// class ImageProvider extends ChangeNotifier {
//   ImageModal imageModal = ImageModal();
//
//   Future<void> pickimages() async {
//     ImagePicker picker = ImagePicker();
//     XFile? img =
//     await picker.pickImage(source: ImageSource.gallery);
//     if (img != null) {
//       image = File(img.path);
//       notifyListeners();
//     }
//   }
// }


// class ContactListPovider extends ChangeNotifier{
//   List<ContactModel> allcontacts = [];
//
//   List<ContactModel> get contacts => allcontacts;
//
//   void addcontact(ContactModel contact){
//     allcontacts.add(contact);
//     notifyListeners();
//   }
//
//   void editContact(int index,ContactModel contact){
//     allcontacts[index] = contact;
//     notifyListeners();
//   }
//
//   void deletContact(int index){
//     allcontacts.remove(index);
//     notifyListeners();
//   }
// }