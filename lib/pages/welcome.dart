import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:myapp1/theme.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  const Text(
                    "Welcome to My App",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SvgPicture.asset("assets/icons/chat.svg"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 79, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: const Text(
                      "login",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple[100]),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 77, vertical: 13),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 17, color: Colors.grey[850]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      themeProvider.themeMode == ThemeMode.dark
                          ? "Switch to Light Mode"
                          : "Switch to Dark Mode",
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: 111,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  width: 111,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
