import 'package:flutter/material.dart';
import 'shared_preferences_helper.dart';

class Login extends StatefulWidget {
  const Login({super.key, required String email, required String password});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<String?> checkCredentials(
      String inputEmail, String inputPassword) async {
    final savedEmail = await SharedPreferencesHelper.getUserEmail();
    final savedPassword = await SharedPreferencesHelper.getUserPassword();

    if (inputEmail == savedEmail && inputPassword == savedPassword) {
      return 'Login Successful!';
    } else {
      return 'Invalid Email or Password';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log in",
          style: TextStyle(
              fontSize: 30, fontFamily: "myfont", fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email,
                        color: Theme.of(context).iconTheme.color),
                    hintText: "Your Email",
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
                const SizedBox(height: 23),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock,
                        color: Theme.of(context).iconTheme.color),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.visibility,
                        color: Theme.of(context).iconTheme.color),
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

                            String inputEmail = emailController.text;
                            String inputPassword = passwordController.text;

                            String? message = await checkCredentials(
                                inputEmail, inputPassword);

                            if (message != null) {
                              // Check if message is not null
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  backgroundColor:
                                      message.contains('Successful')
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              );
                            }

                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
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
                          "Log in",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.home),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
