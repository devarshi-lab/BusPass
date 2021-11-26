import 'package:buspassgenerator/signup.dart';
import 'package:buspassgenerator/whatsapp_home.dart';
import 'package:flutter/material.dart';
import 'package:buspassgenerator/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BusHome();
  }
}

class BusHome extends StatefulWidget {
  @override
  _BusHomeState createState() => _BusHomeState();
}

class _BusHomeState extends State<BusHome> {

    bool darkTheme = true;

    void changeTheme(bool value)
    {
        setState(() {
            darkTheme = darkTheme ? false : true;
        });
        
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         brightness:  darkTheme ? Brightness.dark : Brightness.light,
         accentColor: Colors.blueAccent,
        ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          actions: [
            Switch(value: darkTheme ,onChanged: changeTheme),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('asset/images/bus.png')),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile Number',
                      hintText: 'Enter a valid mobile number!!!'),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter a valid password!!!',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: Builder(
                  builder: (context) =>TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Container(
                alignment:  Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 35.0),
                child: Builder(
                  builder: (context) => TextButton(onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                  }, child: Text(
                    'New User? Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
