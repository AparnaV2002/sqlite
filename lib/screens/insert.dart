import 'package:flutter/material.dart';
import 'package:student/model/Student.dart';
import 'package:student/service/service.dart';
import 'package:student/main.dart';

class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final _formKey=GlobalKey<FormState>();
  String _contact_firstname='';
  String _contact_lastname='';
  String _contact_email='';
  String _contact_mobile='';
  String _contact_address='';

  var _service=Service();




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.black,
        title:const Text(
          'Add Contact',

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter First Name',
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter First Name';
                    }
                    // Regular expression to match only alphabets
                    RegExp regex = RegExp(r'^[a-zA-Z]+$');
                    if (!regex.hasMatch(value)) {
                      return 'Enter only alphabets';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _contact_firstname = value;
                    });
                  },
                ),

                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Last Name',
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Last Name';
                    }
                    // Regular expression to match only alphabets
                    RegExp regex = RegExp(r'^[a-zA-Z]+$');
                    if (!regex.hasMatch(value)) {
                      return 'Enter only alphabets';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _contact_lastname = value;
                    });
                  },
                ),

                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Mobile Number',
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Mobile Number';
                    }
                    // Regular expression to match valid mobile number format
                    RegExp regex = RegExp(r'^\d{10}$');
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _contact_mobile = value;
                    });
                  },
                ),


                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Email';
                    }
                    // Regular expression to match valid email format
                    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _contact_email = value;
                    });
                  },
                ),

                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter Address',
                      labelText: 'Address',
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Enter Address';
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _contact_address=value;
                    });
                  },
                ),


                Center(
                  child: Container(
                      width: 300,

                      padding: EdgeInsets.all(30),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.pink,
                            textStyle: TextStyle(fontSize: 15)
                        ),
                        child: Text('Save'),
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            /*print(_contact_name);
                           print(_contact_roll);
                           print(_contact_mobile);
                           print(_stuent_dept);
                           print(_contact_age);
                           print(_gender);*/
                            var _contact=Student();
                            _contact.firstname=_contact_firstname;
                            _contact.lastname=_contact_lastname;
                            _contact.mobile=_contact_mobile;
                            _contact.email=_contact_email;
                            _contact.address=_contact_address;
                            var res=await _service.saverecord(_contact);
                            Navigator.pop(context,res);
                            //showAlertBox(context, "Student Details Added Successfully");

                          }
                        },
                      )
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
showAlertBox(BuildContext context, String S){
  AlertDialog alertDialog=AlertDialog(
    title: Text('Alert Box'),
    content: Text(S),
    actions: [
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context)=>MyApp())));
      },
          child: Text('Ok'))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      });
}