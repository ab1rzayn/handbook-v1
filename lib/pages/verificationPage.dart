import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:handbook/pages/otpPage.dart';

import '../components/CustomButton.dart';
import '../components/customText.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var phoneNumber = phoneController.text;


    //This defined for the sending code/OTP in users Phone
    //TODO: If for any case code hasn't been sent within 60s then it will be sent again
    sendCode() async {
      try{
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+880${phoneController.text}",
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar("Something Went Wrong.", e.code);
          },
          //redirect to OTP Page
          codeSent: (String vID, int? Token) {
            Get.to(otpPage(vID:vID,phoneNumber: phoneNumber),);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }on FirebaseAuthException catch(e){
        Get.snackbar("Something Went Wrong.", e.code);
      }catch(e){
        Get.snackbar("Something Went Wrong.", e.toString());
      }
    }




    return Scaffold(

      //No Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Images on the verification Screen
            Flexible(
              child: Image.asset(
                'assets/images/logos/logo_black.png',
                width: 200,
                height: 200,
              ),
            ),

            //Heading Text
            const CustomText(
              "ব্যবহার শুরু করুন ",
              style: TextStyle(
                fontFamily: 'TiroBangla',
                fontSize: 20,
                color: Colors.black,
              ),
            ),

            //Phone Number Text Field
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefix: const Text("+880"),
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'মোবাইল নাম্বারটি দিবেন ',
                  labelStyle: TextStyle(
                    fontFamily: 'TiroBangla',
                    fontSize: 18,
                    color: Colors.grey[700]!,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),





            const SizedBox(height: 40),

            //This Custom Button defined for the OTP Verification
            //By Clicking on it the code will be sent to the user phone as sendCode will be provoke
            CustomButton(
              text: "এগিয়ে যান",
              onPressed: () {
                sendCode();
              },
              width: 300,
              height: 58,
              color: Colors.blue,
            ),

            const SizedBox(height: 15),

            //TODO:This Custom Button defined for the Gmail Login **update in v2**
            CustomButton(
              text: 'জিমেইল ব্যবহার করুন',
              onPressed: (){},
              width: 300,
              height: 58,
              color: Colors.black,
            ),


          ],
        ),
      ),
    );
  }
}
