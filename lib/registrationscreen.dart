import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:my_tutor/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

void main() => runApp(const Registration());

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  bool _isObscure1 = true;
  bool _isObscure2 = true;

  var _pickedImage;

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
    focusNode3.addListener(() {
      setState(() {});
    });
    focusNode4.addListener(() {
      setState(() {});
    });
    focusNode5.addListener(() {
      setState(() {});
    });
    focusNode6.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 10),
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Column(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () => {_showPickOptionsDialog()},
                            child: CircleAvatar(
                              radius: 70,
                              child: _pickedImage == null
                                  ? Image.asset('assets/images/profilepic.jpg')
                                  : null,
                              backgroundImage: _pickedImage != null
                                  ? FileImage(_pickedImage)
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        inputText(focusNode1, "Name", Icons.person, false,
                            usernameController, TextInputType.text),
                        const SizedBox(height: 20),
                        inputText(focusNode2, "Phone Number",
                            Icons.phone_android, false, phoneNumController, TextInputType.phone),
                        const SizedBox(height: 20),
                        inputText(focusNode3, "Home Address", Icons.home, false,
                            addressController, TextInputType.text),
                        const SizedBox(height: 20),
                        inputText(focusNode4, "Email", Icons.email, false,
                            emailController, TextInputType.emailAddress),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: _isObscure1,
                          controller: passwordController,
                          cursorColor: Colors.grey,
                          focusNode: focusNode5,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 15, 0, 0),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: focusNode5.hasFocus
                                  ? const Color.fromARGB(255, 9, 56, 95)
                                  : const Color(0xFF919191),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 9, 56, 95)),
                            ),
                            icon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure1
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure1 = !_isObscure1;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: _isObscure2,
                          controller: cpasswordController,
                          cursorColor: Colors.grey,
                          focusNode: focusNode6,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 15, 0, 0),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              color: focusNode6.hasFocus
                                  ? const Color.fromARGB(255, 9, 56, 95)
                                  : const Color(0xFF919191),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 9, 56, 95)),
                            ),
                            icon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 10,
                            color: const Color.fromARGB(255, 9, 56, 95),
                            onPressed: () {
                              _userSignUp();
                            },
                            child: const Text(
                              "Sign Up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField inputText(focusNode, text, icons, state, controller, keyboard) {
    return TextField(
      keyboardType: keyboard,
      obscureText: state,
      controller: controller,
      cursorColor: Colors.grey,
      focusNode: focusNode,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
          labelText: text,
          labelStyle: TextStyle(
            color: focusNode.hasFocus
                ? const Color.fromARGB(255, 9, 56, 95)
                : const Color(0xFF919191),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color.fromARGB(255, 9, 56, 95)),
          ),
          icon: Icon(icons)),
    );
  }

  void _userSignUp() {
    String _username = usernameController.text.toString();
    String _phoneNum = phoneNumController.text.toString();
    String _address = addressController.text.toString();
    String _email = emailController.text.toString();
    String _password = passwordController.text.toString();
    String _confirmPassword = cpasswordController.text.toString();
    bool isValid = EmailValidator.validate(_email);

    if (_username.isNotEmpty &&
        _phoneNum.isNotEmpty &&
        _address.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty) {
      if (isValid == true) {
        if (_password == _confirmPassword) {
          http.post(
              Uri.parse(
                  "https://hubbuddies.com/271513/myTutor/php/registeruser.php"),
              body: {
                "username": _username,
                "phoneNum": _phoneNum,
                "address": _address,
                "email": _email,
                "password": _password
              }).then((response) {
            print(response.body);
            if (response.body == "Failed") {
              print("Failed");
              Fluttertoast.showToast(
                  msg: "Email has been used. Please try again",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
              return;
            } else {
              print("Success");
              Fluttertoast.showToast(
                  msg: "Sign up success!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          });
        } else {
          Fluttertoast.showToast(
              msg: "Password mismatch!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Invalid Email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please fill in your information",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  _showPickOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a Picture"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }

  _loadPicker(ImageSource source) async {
    final _picker = ImagePicker();
    final XFile? picked = await _picker.pickImage(source: source);
    final File? imagefile = File(picked!.path);
    if (imagefile != null) {
      setState(() {
        _pickedImage = imagefile;
      });
    }
    // _cropImage();
    Navigator.pop(context);
  }

  // Future<void> _cropImage() async {
  //   final croppedFile = await ImageCropper().cropImage(
  //     sourcePath: _pickedImage!.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           toolbarColor: Colors.deepOrange,
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         minimumAspectRatio: 1.0,
  //       )
  //     ],
  //   );
  //   if (croppedFile != null) {
  //     setState(() {
  //       _croppedFile = croppedFile;
  //     });
  //   }
  // }
}