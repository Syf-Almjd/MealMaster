import 'dart:ui';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpController {

  String? name;

  get getName => name;
  setName(String userName){
    name = userName;
  }

  String? gender;
  get getGender => gender;
  setGender(String userGender){
    gender = userGender;
  }

  String? phone;
  get getPhone => phone;
  setPhone(String userPhone){
    phone = userPhone;
  }

  String? email;
  get getEmail => email;
  setEmail(String userEmail){
    email = userEmail;
  }

  String? password;
  get getPassword => password;
  setPassword(String userPass){
    password = userPass;
  }
  Future<AwesomeSnackbarContent> signUserUp() async {
    // try {
      print(name);
      print(email);
      print(password);
      print(phone);
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: email.toString(), password: password.toString());
      // await FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(FirebaseAuth.instance.currentUser!.uid)
      //     .set({
      //   "Name": name,
      //   "Gender": gender,
      //   "Phone Number": phone,
      //   "Email": email,
      // });
      return AwesomeSnackbarContent(
        title: 'Congratulation!',
        message:
        'You have Successfully Singed in!',
        contentType: ContentType.success,
      );
    }
  //   on FirebaseAuthException catch (e) {
  //     return AwesomeSnackbarContent(
  //       title: 'On Snap!',
  //       message:
  //       '$e',
  //       contentType: ContentType.failure,
  //     );
  //   }
  // }
}