import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        leading: Icon(
            Icons.login_outlined,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  width: 200,
                  child: Image.asset('assets/logo.jpg'),
                ),
              ),
              //text form fields
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Username",
                          hintText: "Username",
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Password",
                          hintText: "Password",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //login btn
              Container(
                width: 100,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      )
                    ]
                ),
                child: ElevatedButton(
                  onPressed: LoginButton,
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  void LoginButton()
  {
    if(_usernameController.text == 'hansa' && _passwordController.text == '123')
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(
          username: _usernameController.text,
        ) ));
        print('hello' + _usernameController.text);

      }
    else{
      print('noob wrong password');
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context)
  {
    Widget okBtn = ElevatedButton(onPressed: () {
      Navigator.pop(context);
    }, child: Text(
      'OK'
    ));
    AlertDialog alertDialog = AlertDialog(
      title: Text('Error'),
      content: Text('Wrong Username or Password'),
      actions: [
        okBtn
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
}
