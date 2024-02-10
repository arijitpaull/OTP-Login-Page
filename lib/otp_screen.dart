import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyin_blackcoffer/phone_num.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);
  var code = " ";
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/flyinlogo.png',width: 200,),

              const Text('Enter OTP', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),

              const Text('Enter the received one time password'),

              const SizedBox(height: 20,),

              Pinput(
                showCursor: true,
                length: 6,
                onChanged: (value){
                  code = value;
                },
              ),

            const SizedBox(height: 20,),

            TextButton(
              onPressed: (){}, 
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    decoration: TextDecoration.underline,
                  )
                )
              ),
              child: const Text('Did not get OTP, resend?',style: TextStyle(
                color: Colors.black,
                ),
              )
            ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()async{
                    Navigator.pushNamedAndRemoveUntil(context, 'homeScreen', (route) => false);
                    /*
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneNum.verify, smsCode: code);
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(context, 'homeScreen', (route) => false);
                    } catch(exception){
                      print('Wrong OTP');
                    }
                    */
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 136, 122, 0)
                  ),
                  child: const Text('Get started',style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),),
                ),
              ),
             const SizedBox(height: 50,),
             Row(
               children: [
                const Spacer(),
                 TextButton(
                    onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, 'phoneNumScreen', (route) => false);
                    }, 
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 136, 122, 0)),
                    ),
                    child: const Text('Back',style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),)
                  ),
               ],
             ),
            ],
          )
        ),
      ),
    );
  }
}