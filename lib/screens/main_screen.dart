import 'package:chat_lecture1/config/palette.dart';
import 'package:chat_lecture1/screens/chat_sreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginJoinupScreen extends StatefulWidget {
  const LoginJoinupScreen({Key? key}) : super(key: key);

  @override
  State<LoginJoinupScreen> createState() => _LoginJoinupScreenState();
}

class _LoginJoinupScreenState extends State<LoginJoinupScreen> {
  final _authentication = FirebaseAuth.instance;

  bool isJoinupScreen = true;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 180,
              child: Container(
                padding: EdgeInsets.all(20.0),
                height: isJoinupScreen ? 280.0 : 250.0,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isJoinupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  '접속',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isJoinupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isJoinupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  '회원가입',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isJoinupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isJoinupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: ValueKey(1),
                                  validator: (value) {
                                    if (value!.isEmpty || value!.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userName = value!;
                                  },
                                  onChanged: (value) {
                                    userName = value;
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: '닉네임',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: ValueKey(2),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value!.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: '이메일',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  key: ValueKey(3),
                                  validator: (value) {
                                    if (value!.isEmpty || value!.length < 6) {
                                      return 'Please must be at least 6 characters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: ('비밀번호'),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (!isJoinupScreen)
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: ValueKey(4),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value!.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: '이메일',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  key: ValueKey(5),
                                  validator: (value) {
                                    if (value!.isEmpty || value!.length < 6) {
                                      return 'Please must be at least 6 characters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: '비밀번호',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            //텍스트 폼 필드
            Center(
              child: Container(
                child: GestureDetector(
                  onTap: () async {
                    if (isJoinupScreen) {
                      _tryValidation();
                      try {
                        final newUser = await _authentication
                            .createUserWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                        );

                        if (newUser.user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ChatScreen();
                              },
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please check you email and password'),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                    }
                    if (!isJoinupScreen) {
                      _tryValidation();

                      try {
                        final newUser =
                            await _authentication.signInWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                        );
                        if (newUser.user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ChatScreen();
                              },
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      '제출하기',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
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
}
