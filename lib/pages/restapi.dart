import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Softon",
    home: Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 1.0),
      child: ApiClass(),
    ),
  ));
}

class ApiClass extends StatefulWidget {
  const ApiClass({Key? key}) : super(key: key);

  @override
  State<ApiClass> createState() => _HomeState();
}

class _HomeState extends State<ApiClass> {
  TextEditingController _userTED = TextEditingController();
  TextEditingController _passTED = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Container(
              padding: const EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height * 0.1,
                  right: 30.0,
                  left: 30.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Image.network(
                        'https://softondemand.co.in/upload/logo/logo-dark.png'),
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _userTED,
                      decoration: InputDecoration(
                        labelText: "Enter username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter UserName';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passTED,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text('Sign Up'),
                            onPressed: () {},
                          ),
                          ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () async {
                              String _user = _userTED.text;
                              String _pass = _passTED.text;
                              print(_user);
                              if (_formKey.currentState!.validate()) {
                                // login(_userTED.text, _passTED.text);

                                var url = Uri.parse(
                                    'https://softondemand.co.in/admin/connect/restapi/demo.php');
                                http.Response response = await http.post(url,
                                    body: {
                                      'email': 'doodle',
                                      'password': 'blue'
                                    });
                                if (response.statusCode == 200) {
                                  // print("Server Ready");
                                  var json_data = jsonDecode(response.body);
                                  final message = json_data['message'];
                                  print("Server Data " + message);
                                } else {
                                  print("Server Not Found");
                                }
                              }
                            },
                          ),
                        ])
                  ]),
                ),
              )),
        ),
      ),
    );
  }
}
