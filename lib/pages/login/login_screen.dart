import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/pages/login/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{


  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool loginValidate = false;
  bool isRememberMe = false;
  bool isObscured = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameCtrl.addListener(checkForm);
    passwordCtrl.addListener(checkForm);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6, vertical: sizeVertical * 10),
          child: Column(
            children: <Widget>[
              dailyWashLogo(),
              loginForm(),
              loginButton(),
              orDivider(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Masuk dengan  ',style: t3(Colors.black),),
                    GestureDetector(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(70))),
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all(7),
                          child: Image.asset('res/icons/google.jpg'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Belum punya akun? ', style: t3(Colors.black),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                        },
                        child: Text('Daftar', style: t3U(dailyRed),),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  dailyWashLogo(){
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Image.asset('res/graphics/logo.jpg'),
    );
  }

  loginForm(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: TextFormField(
              controller: usernameCtrl,
              focusNode: usernameFocus,
              style: t3(Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.person,color: Colors.grey,),
                hintText: 'Email',
                border: InputBorder.none,
                hintStyle: t3(Colors.grey)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: TextFormField(
              obscureText: isObscured,
              controller: passwordCtrl,
              focusNode: passwordFocus,
              style: t3(Colors.black),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: (){
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  child: Icon(Icons.remove_red_eye, color: dailyRed,),
                ),
                icon: Icon(Icons.lock,color: Colors.grey,),
                  hintText: 'Password',
                  border: InputBorder.none,
                  hintStyle: t3(Colors.grey)
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(

                        activeColor: dailyRed,
                        value: isRememberMe,
                        onChanged: (bool a){
                          setState(() {
                            isRememberMe = !isRememberMe;
                          });
                        }
                      ),
                      Text('Ingat Saya', style: t4(Colors.black),)
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    child: Text('Lupa Password', style: h7(dailyRed),),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  checkForm(){
    if(usernameCtrl.text != '' && passwordCtrl.text != ''){
      setState(() {
        loginValidate = true;
      });
    }else{
      setState(() {
        loginValidate = false;
      });
    }
  }

  orDivider(){
    return Container(
      width: sizeHorizontal * 90,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            color: Colors.white,
            child: Text('Atau', style: t4(Colors.black),),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  loginButton(){
    return GestureDetector(
      onTap: (loginValidate)?() async {
        if(isRememberMe){
          await rememberMeFunction();
        }
        Navigator.of(context).pushNamedAndRemoveUntil('Home', (Route<dynamic> route) => false);
      }:null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: sizeHorizontal * 90,
        decoration: BoxDecoration(
          color: (loginValidate)?dailyRed:Colors.red[200],
            borderRadius: BorderRadius.all(Radius.circular(10))

        ),
        child: Text('LOGIN', style: h5(Colors.white), textAlign: TextAlign.center,),
      ),
    );
  }

  rememberMeFunction()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('spToken', 'KMZWAY87AA');
  }
}