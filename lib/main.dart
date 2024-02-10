import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flyin_blackcoffer/homeScreen.dart';
import 'package:flyin_blackcoffer/otp_screen.dart';
import 'package:flyin_blackcoffer/phone_num.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'phoneNumScreen',
      routes: {
        'phoneNumScreen':(context) => const PhoneNum(),
        'otpScreen':(context) => const OTPScreen(),
        'homeScreen':(context)=>const HomeScreen(),
      },
    )
  );
}