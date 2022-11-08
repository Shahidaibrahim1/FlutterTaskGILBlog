import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ApisScreen extends StatefulWidget {
  const ApisScreen({super.key});

  @override
  State<ApisScreen> createState() => _ApisScreenState();
}

class _ApisScreenState extends State<ApisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Apis'),
      ),
      body: ApisScreen(),
       
       
      
    );
    }
}