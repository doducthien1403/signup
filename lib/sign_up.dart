import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormSignUp();
  }
}

class FormSignUp extends State<SignUp> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  var confirmPass;

  bool phoneValidate = true;

  final _formKey = GlobalKey<FormState>();

  void submid() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              _allSB(20),
              Center(
                child: _txtSignUp("SIGN UP"),
              ),
              _allSB(20),
              _txtContent(
                "Lorem ipsum is simply dummy text of the printing and typesetting industry.",
              ),
              _allSB(40),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _lbTittle("User Name"),
                  _allSB(8),
                  _newTextFormField(
                    "Enter User Name",
                    const Icon(Icons.person_pin),
                    controller: _userController,
                    validateFunc: (String? userValue) {
                      if (userValue == null) return 'Need enter username!';
                    },
                  ),
                ],
              ),
              _allSB(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _lbTittle("Email Id"),
                  _allSB(8),
                  _newTextFormField(
                    "Enter Email",
                    const Icon(Icons.email_sharp),
                    controller: _emailController,
                    validateFunc: (String? emailValue) {
                      if (emailValue!.contains('@')) {
                        return null;
                      } else {
                        return 'Enter email';
                      }
                    },
                  ),
                ],
              ),
              _allSB(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _lbTittle("Mobile Number"),
                  _allSB(8),
                  _newTextFormField(
                    "Enter your 10 digit mobile number",
                    const Icon(Icons.phone_iphone_sharp),
                    controller: _phoneController,
                    validateFunc: (String? phoneValue) {
                      if (phoneValue!.length != 10) {
                        return 'No type phone';
                      }
                    },
                  ),
                ],
              ),
              _allSB(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _lbTittle("Password"),
                  _allSB(8),
                  _newTextFormField(
                    "Password should be in 8 - 15 characters",
                    const Icon(Icons.lock_outline),
                    controller: _passwordController,
                    validateFunc: (String? passwordValue) {
                      confirmPass = passwordValue;
                      if (passwordValue!.length >= 8 &&
                          passwordValue.length <= 15) {
                        return null;
                      } else {
                        return 'Enter password';
                      }
                    },
                  ),
                ],
              ),
              _allSB(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _lbTittle("Confirm Password"),
                  _allSB(8),
                  _newTextFormField(
                    "Repeat the Confirm Password",
                    const Icon(
                      Icons.lock_outline,
                    ),
                    controller: _confirmPassword,
                    validateFunc: (String? confirmPasswordValue) {
                      if (confirmPasswordValue != confirmPass) {
                        return 'No type password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              _allSB(50),
              _btnSIGNUP(context, onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Successfull");
                  return 'Sign In';
                }
              }),
              _allSB(50),
            ],
          ),
        ),
      ),
    );
  }
}

_lbTittle(String txtTitle) {
  return Text(
    txtTitle,
    style: const TextStyle(
      color: Color.fromARGB(255, 166, 10, 158),
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );
}

_txtContent(String txt) {
  return Text(
    txt,
    style: const TextStyle(
      fontSize: 16,
      color: Colors.black45,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w600,
    ),
    textAlign: TextAlign.center,
  );
}

Text _txtSignUp(String txtSignUp) {
  return Text(
    txtSignUp,
    style: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
  );
}

TextFormField _newTextFormField(String newHintText, Icon icon,
    {required String? Function(String? valueValidate) validateFunc,
    required TextEditingController controller}) {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      prefixIcon: icon,
      hintText: newHintText,
    ),
    keyboardType: TextInputType.text,
    validator: validateFunc,
  );
}

_btnSIGNUP(BuildContext context, {required Function() onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: const Text(
      "SIGN UP",
      style: TextStyle(fontSize: 26),
    ),
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(400, 60)),
      backgroundColor: MaterialStateProperty.all(
        const Color.fromARGB(255, 166, 10, 158),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shadowColor: MaterialStateProperty.all(Colors.red),
      elevation: MaterialStateProperty.all(15),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(
              color: Color.fromARGB(255, 255, 138, 245), width: 2.0),
        ),
      ),
    ),
  );
}

SizedBox _allSB(double sizeSB) {
  return SizedBox(height: sizeSB);
}
