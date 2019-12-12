import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';

class RegisterScreen extends StatefulWidget{

  @override
  _RegisterScreenState createState()=> _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pass1Ctrl = TextEditingController();
  TextEditingController pass2Ctrl = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode pass1Focus = FocusNode();
  FocusNode pass2Focus = FocusNode();

  bool registerValidate = false;
  bool pass1Obscure = true;
  bool pass2Obscure = true;
  bool termsConditionCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCtrl.addListener(checkForm);
    emailCtrl.addListener(checkForm);
    pass1Ctrl.addListener(checkForm);
    pass2Ctrl.addListener(checkForm);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              dailyWashLogo(),
              headerText(),
              registerForm(),
              termsConditionContainer(),
              registerButton()
            ],
          ),
        ),
      ),
    );
  }

  dailyWashLogo(){
    return Container(
      alignment: Alignment.center,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Image.asset('res/graphics/logo.jpg'),
    );
  }

  checkForm(){
    if(nameCtrl.text != '' && emailCtrl.text != '' && pass1Ctrl.text != '' && pass2Ctrl.text != '' && termsConditionCheck){
      setState(() {
        registerValidate = true;
      });
    }else{
      setState(() {
        registerValidate = false;
      });
    }
  }

  registerForm(){
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
              controller: nameCtrl,
              focusNode: nameFocus,
              style: t3(Colors.black),
              decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Colors.grey,),
                  hintText: 'Nama',
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
              controller: emailCtrl,
              focusNode: emailFocus,
              style: t3(Colors.black),
              decoration: InputDecoration(
                  icon: Icon(Icons.mail,color: Colors.grey,),
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
              obscureText: pass1Obscure,
              controller: pass1Ctrl,
              focusNode: pass1Focus,
              style: t3(Colors.black),
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        pass1Obscure = !pass1Obscure;
                      });
                    },
                    child: Icon(Icons.remove_red_eye, color: dailyRed,),
                  ),
                  icon: Icon(Icons.person,color: Colors.grey,),
                  hintText: 'Password',
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
              obscureText: pass2Obscure,
              controller: pass2Ctrl,
              focusNode: pass2Focus,
              style: t3(Colors.black),
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        pass2Obscure = !pass2Obscure;
                      });
                    },
                    child: Icon(Icons.remove_red_eye, color: dailyRed,),
                  ),
                  icon: Icon(Icons.person,color: Colors.grey,),
                  hintText: 'Ulangi Password',
                  border: InputBorder.none,
                  hintStyle: t3(Colors.grey)
              ),
            ),
          ),

        ],
      ),
    );
  }

  headerText(){
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Buat Akun', style: h4(Colors.black),),
          Text('Lengkapi data berikut untuk melanjutkan', style: t3(Colors.black),)
        ],
      ),
    );
  }

  registerButton(){
    return GestureDetector(
      onTap: (registerValidate)?(){
        Navigator.pop(context);
      }:null,
      child: Container(
        decoration: BoxDecoration(
            color: (registerValidate)?dailyRed:Colors.red[200],
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: sizeHorizontal * 90,
        child: Text('Daftar', style: h5(Colors.white), textAlign: TextAlign.center,),
      ),
    );
  }

  termsConditionContainer(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: sizeHorizontal * 10,
            child: Checkbox(
              activeColor: dailyRed,
              value: termsConditionCheck,
              onChanged: (bool a){
                setState(() {
                  termsConditionCheck = !termsConditionCheck;
                });
                checkForm();
              },
            ),
          ),
          Container(
            width: sizeHorizontal * 70,
            child: RichText(
              text: TextSpan(
                style: t4(Colors.black),
                children: [
                  TextSpan(text: 'Saya telah membaca dan menyetujui '),
                  TextSpan(text: 'syarat layanan', style: t4(dailyRed)),
                  TextSpan(text: ' yang berlaku.')
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}