import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handbook/components/CustomButton.dart';
import 'package:handbook/pages/navigationRoute.dart';
import 'package:pinput/pinput.dart';

import '../components/customText.dart';

class otpPage extends StatefulWidget {
  //A verification ID and User Phone Number has passed from the previous page
  //The phone number will be the same of the user has entered
  final String vID;
  final String phoneNumber;

  const otpPage({super.key, required this.vID, required this.phoneNumber});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {

  //Initially the code will be empty
  var code="";

  //This is for the Sign In
  signIn() async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.vID, 
        smsCode: code,);
    try{
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) => Get.offAll(const navigationRoute()));
    }on FirebaseAuthException catch(e){
      Get.snackbar("Something Went Wrong", e.code);
    }catch (e){
      Get.snackbar("Something W", e.toString());
    }
  }

  //This Widget has been customized for the PINPUT package to be used for entertng the OTP
  Widget textCode(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Pinput(
          length: 6,
          onChanged: (value) {
            setState(() {
              code = value;
            });
          },
        ),
      ),
    );
  }

  //This will provoke the OTP verification signIn() function and for all succesfull
  //execution the user will be redirected to HomePage
  Widget btnVerify(){
    return Center(
      child: CustomButton(
        onPressed:() { signIn(); },
        text: "প্রদান করুন",
        textStyle: const TextStyle(
          fontFamily: 'TiroBangla',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //No Appbar
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [

            //Logo Image
            Flexible(
              child: Image.asset(
                'assets/images/logos/logo_black.png',
                width: 200,
                height: 200,
              ),
            ),

            //A heading that tells to enter the OTP
            const Center(
              child: CustomText(
                "OTP প্রদান করুন",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'TiroBangla',
                ),
              ),
            ),

             //This is a information that tells user
            //for the code which has sent to the user phone number
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Center(
                  child: CustomText(
                    "আপনার +880${widget.phoneNumber} একটি OTP প্রেরণ করা হয়েছে । অনুগ্রহ করে সেটি প্রদান করুন ",
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontFamily: 'TiroBangla',
                    ),
                  ),
                ),
            ),
            
            const SizedBox(height: 20,),
            
            textCode(),
            
            const SizedBox(height: 50,),

            btnVerify()

          ],
        ),
      ),

    );
  }
}
