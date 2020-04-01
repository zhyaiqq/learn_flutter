import 'package:flutter/material.dart';


class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo')
      ),
      body: Theme(
        // data: ThemeData(
        //   primaryColor: Colors.black 
        // ), 
        data: Theme.of(context).copyWith( // 只覆盖primaryColor
          primaryColor: Colors.black
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterWidget()
            ])
        )
      )
    );
  }
}

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegister () {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username: $username');
      debugPrint('password: $password');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('rigistering....')
        )
      );
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String userNameValidator (username) {
    if (username.isEmpty) {
      return 'userName is required';
    }
    return null;
  }

  String passwordValidator (password) {
    if (password.isEmpty) {
      debugPrint('password');
      return 'password is required';
    }
    return null;
  }

  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: ''
            ),
            onSaved: (value) {
              username = value;
            },
            autovalidate: autovalidate,
            validator: userNameValidator,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: ''
            ),
            onSaved: (value) {
              password = value;
            },
            autovalidate: autovalidate,
            validator: passwordValidator,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('register', style: TextStyle(color: Colors.white)),
              onPressed: submitRegister,
            ),
          )
        ],
      )
    );
  }
}


class FormWidget1 extends StatefulWidget {
  @override
  _FormWidget1State createState() => _FormWidget1State();
}

class _FormWidget1State extends State<FormWidget1> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'hello word';
    textEditingController.addListener(() {
      print('addlistener ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Center(
        child: TextField(
          // onChanged: (value) {
          //   print('input $value');
          // },
          controller: textEditingController,
          onSubmitted: (value) {
            print('submit $value');
          },
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'userName',
            hintText: 'please enter username',
            // border: InputBorder.none
            border: OutlineInputBorder()
          )
        ),
      )
    );
  }
}