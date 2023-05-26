import 'package:flutter/material.dart';
import 'package:login_validation/homepage.dart';
import 'loginPage.dart';
import 'homepage.dart';
import 'tapPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        // appBar: AppBar(
        //   title: const Text('Login'),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/pngegg.png',
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "   Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "     Sign in to continue",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field cannot be empty";
                        }
                      },
                      controller: _name,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green.withOpacity(1), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.grey[800],
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Name',
                        hintText: 'Enter name',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field cannot be empty";
                        }
                      },
                      controller: _password,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green.withOpacity(1), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey),
                        //   borderRadius: BorderRadius.circular(8),
                        // ),
                        filled: true,
                        fillColor: Colors.grey[800],
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password',
                        hintText: 'Enter password',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Color.fromARGB(255, 148, 220, 131),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          setState(() {
                            if (_formkey.currentState!.validate()) {
                              // name = _name.text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homepage(
                                            esewaName: _name.text,
                                          )));
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Welcome"),
                                      content: Text(
                                        _name.text,
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: Text("Cancel")),
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'Ok'),
                                            child: Text("Ok")),
                                      ],
                                    );
                                  });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Something went wrong"),
                                ),
                              );
                            }
                          });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
