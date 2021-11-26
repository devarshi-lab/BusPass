import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  String _mobileErr = "";
  String _adharErr = "";
  String digit = "0123456789";
  String AdharNo = "";

  _onSubmit()
  {
    if (_key.currentState!.validate())
    {
      _key.currentState!.save();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up'
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _key,
              autovalidate: true,
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number',
                        errorText: _mobileErr,
                        hintText: 'Enter a valid mobile number!!!'),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                  ),
                  Container(
                    child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adhar Number',
                        errorText: _adharErr,
                        hintText: 'Enter a valid Adhar number!!!'),
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        validator: (value){
                            if (value == null || value!.trim() == "")
                            {
                              _adharErr = "Please Enter Adhar Number";
                            }
                            else 
                            {
                                if (value.length < 12 || value.length > 12)
                                {
                                    return _adharErr;
                                }
                            } 
                            return null;

                        },
                        onSaved :(adhar){
                            AdharNo = adhar.toString();
                        }
                  ),
                  ),
                  Builder(
                  builder: (context) =>TextButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () {
                        _onSubmit();
                      });
                    },
                    
                  ),
                ),
                ],),
            ),
            ),
        ),
      ) 
      );
    
  }
}