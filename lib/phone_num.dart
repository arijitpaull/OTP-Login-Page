import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNum extends StatefulWidget {
  const PhoneNum({super.key});

  static String verify="";

  @override
  State<PhoneNum> createState() => _PhoneNumState();
}

class _PhoneNumState extends State<PhoneNum> {
  var phoneNum = '';
  TextEditingController countryCodeController = TextEditingController();

  @override
  void initState() {
    countryCodeController.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/flyinlogo.png',width: 200,),

              const Text('Log In', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),

              const Text('Sign in via phone number'),

              const SizedBox(height: 20,),

              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  const SizedBox(
                    width: 10,
                  ),

                  SizedBox(
                    width: 40,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller:countryCodeController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const Text('|',style: TextStyle(fontSize: 20,color: Colors.grey),),

                  const SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value){
                        phoneNum = value;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter mobile number',
                      ),
                    ),
                  ),
                ]),
              ),

              const SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()async{
                    /*
                    await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countryCodeController.text + phoneNum}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (
                      String verificationId, int? resendToken) {
                      PhoneNum.verify = verificationId;
                      Navigator.pushNamed(context, 'otpScreen');
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                  */
                  Navigator.pushNamed(context, 'otpScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 136, 122, 0)
                  ),
                  child: const Text('Next',style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}