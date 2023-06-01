import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mealmaster/Admin/AdminMain.dart';
import 'package:mealmaster/Components/ButtonA.dart';
import 'package:mealmaster/Cubits/app_component_cubit.dart';

import '../Controllers/SignUpController.dart';
import '../Cubits/Navigation/navigation_cubit.dart';

List<String> list = <String>[
  'Choose Gender:',
  'Male',
  'Female',
];

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;
  String dropdownValue = list.first;
  String _errorMessage = "";
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String gender = '';

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = SignUpController();
    final AppState = BlocProvider.of<AppComponentCubit>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 67,
                    ),
                    Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#4f4f4f"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: HexColor("#8d8d8d"),
                        ),
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: HexColor("#ffffff"),
                        ),
                        iconSize: 30,
                        borderRadius: BorderRadius.circular(20),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                            gender = value;
                          });
                        },
                        items:
                        list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: nameController,
                        onChanged: (value) {
                          validateEmail(value);
                          signUpController.setName(value);
                        },
                        onSubmitted: (value) {
                          signUpController.setName(value);
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: HexColor("#4f4f4f"),
                        decoration: InputDecoration(
                          hintText: "Alan John",
                          fillColor: HexColor("#f0f3f1"),
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#8d8d8d"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Phone",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: phoneController,
                        onChanged: (value) {
                          validateEmail(value);
                          SignUpController().setPhone(value);
                        },
                        onSubmitted: (value) {
                          SignUpController().setPhone(value);
                        },
                        cursorColor: HexColor("#4f4f4f"),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "+351 30-022 8102",
                          fillColor: HexColor("#f0f3f1"),
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#8d8d8d"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          _errorMessage,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        // controller: emailController.value,
                        controller: emailController,
                        onChanged: (value) {
                          validateEmail(value);
                          signUpController.setEmail(emailController.text);
                        },
                        onSubmitted: (value) {
                          signUpController.setEmail(emailController.text);
                        },
                        cursorColor: HexColor("#4f4f4f"),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Alan@gmail.com",
                          fillColor: HexColor("#f0f3f1"),
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#8d8d8d"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          _errorMessage,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: HexColor("#8d8d8d"),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        onChanged: (value) {
                          SignUpController().setEmail(value);
                        },
                        onSubmitted: (value) {
                          SignUpController().setEmail(value);
                        },
                        cursorColor: HexColor("#4f4f4f"),
                        decoration: InputDecoration(
                          hintText: "*************",
                          fillColor: HexColor("#f0f3f1"),
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#8d8d8d"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          focusColor: HexColor("#44564a"),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      BlocBuilder<AppComponentCubit, AppComponents>(
                        builder: (context, state) {
                          return Center(
                            child: state.isLoading
                                ? const CircularProgressIndicator()
                                : BlocProvider<NavigationCubit>(
                              create: (context) => NavigationCubit(),
                              child: ButtonA(
                                  buttonText: 'Sign up',
                                  onPressed: () async {
                                    NavigationCubit.get(context).navigate(context, AdminPage());
                                    // AppState.startLoading();
                                    // ScaffoldMessenger.of(context)
                                    //   ..hideCurrentSnackBar()
                                    //   ..showSnackBar(await signUserUp());
                                    // context.read<NavigationCubit>().navigateToHome();

                                    // AppState.stopLoading();
                                  }),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: TextButton(
                          child: Text(
                            "Log In",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: HexColor("#44564a"),
                            ),
                          ),
                          onPressed: () =>
                              Navigator.pop(
                                context,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  Future<SnackBar> signUserUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "Name": nameController.text,
        "Gender": gender,
        "Phone Number": phoneController.text,
        "Email": emailController.text,
      });
      return SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Congratulation!',
            message: 'You have Successfully Singed in!',
            contentType: ContentType.success,
          ));
    } on FirebaseAuthException catch (e) {
      return SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'On Snap!',
            message: '${e.message}',
            // messageFontSize: 10,
            contentType: ContentType.failure,
          )
      );
    }
  }
}
