import 'package:flutter/material.dart';
import 'login.dart';
import 'shared_preferences_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.home),
      ),
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(
              fontSize: 30, fontFamily: "myfont", fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    hintText: "Username : ",
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 17),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    hintText: "Your Email :",
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 17),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: Theme.of(context).iconTheme.color,
                      size: 19,
                    ),
                    hintText: "Password :",
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 17),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            String username = usernameController.text;
                            String email = emailController.text;
                            String password = passwordController.text;

                            try {
                              await SharedPreferencesHelper.saveUserEmail(
                                  email);
                              await SharedPreferencesHelper.saveUserName(
                                  username);
                              await SharedPreferencesHelper.saveUserPassword(
                                  password);

                              await Future.delayed(const Duration(seconds: 1));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('تم تسجيل بياناتك بنجاح!')),
                              );

                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              if (mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(
                                      email: email,
                                      password: password,
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('حدث خطأ أثناء التسجيل: $e')),
                              );
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 91, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          "Sign up",
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
