import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealmaster/Components/ButtonA.dart';
import 'package:mealmaster/LoginSignup/Login.dart';
import 'package:mealmaster/LoginSignup/SignUp.dart';
import 'SliderData.dart';
import 'WidgetMaking/EachPage.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({Key? key}) : super(key: key);

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // final navigationBloc = BlocProvider.of<NavigationBloc>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: SliderData.numberOfPages,
            itemBuilder: (context, index) {
              return EachPage(SliderData.titlemessage[index],
                  SliderData.messages[index], SliderData.images[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: (currentPage == SliderData.numberOfPages - 1)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonA(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                buttonText: "Login",
                                height: 80,
                                width: 150,
                                borderSize: 14,
                              ),
                              ButtonA(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                  );
                                },
                                buttonText: "Sign Up",
                                height: 80,
                                width: 150,
                                borderSize: 14,
                              ),
                            ],
                          )
                        : Container(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                controller
                                    .jumpToPage(SliderData.numberOfPages - 1);
                              },
                              child: const Text(
                                "\n SKIP >",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
