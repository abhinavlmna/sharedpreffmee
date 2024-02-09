import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? Login() : Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passwrd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loginpage'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your email',
            ),
          ),
          TextField(
            controller: _passwrd,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your password',
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString('email', '${_email.text}');
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Login'))
        ],
      ),
    );
  }
}
