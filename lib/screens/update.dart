import 'package:flutter/material.dart';
import 'package:student/model/Student.dart';
import  'package:student/service/service.dart';
import 'package:student/main.dart';

class Update extends StatefulWidget {
  final Student student;
  const Update({Key? key,required this.student}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var _firstname=TextEditingController();
  var _lastname=TextEditingController();
  var _mobile=TextEditingController();
  var _email=TextEditingController();
  var _address=TextEditingController();


  var _service=Service();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _firstname.text=widget.student.firstname??'';
      _lastname.text=widget.student.lastname??'';
      _mobile.text=widget.student.mobile??'';
      _email.text=widget.student.email??'';
      _address.text=widget.student.address??'';
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Edit Contact"),
          centerTitle: true,
        ),

        /*body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Student Details",
            style: TextStyle(
              fontSize: 30,
              color: Colors.redAccent
            ),),

            Row(
              children: [
                Text("Student Name"),
                Text(widget.student.name?? '')
              ]
            ),

            Row(
                children: [
                  Text("Student Roll No"),
                  Text(widget.student.roll?? '')
                ]
            ),

            Row(
                children: [
                  Text("Department"),
                  Text(widget.student.dept?? '')
                ]
            ),

            Row(
                children: [
                  Text("Age"),
                  Text(widget.student.age?? '')
                ]
            ),

            Row(
                children: [
                  Text("Gender"),
                  Text(widget.student.gender?? '')
                ]
            ),
            Row(
                children: [
                  Text("Contact"),
                  Text(widget.student.mobile?? '')
                ]
            )
          ],
        )

      ),*/
        body: Container(
          padding: EdgeInsets.all(30),
          width: 400,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _firstname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter First Name',
                    labelText: 'First Name'
                ),

              ),



              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _lastname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Last name',
                    labelText: 'Last Name'
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _mobile,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Mobile',
                    labelText: 'Mobile'
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter email',
                    labelText: 'email'
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _address,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Address',
                    labelText: 'Address'
                ),
              ),
              const SizedBox(
                height: 20,
              ),



              ElevatedButton(
                onPressed:() async{
                  var _contact=Student();
                  _contact.id=widget.student.id;
                  _contact.firstname=_firstname.text;
                  _contact.lastname=_lastname.text;
                  _contact.email=_email.text;
                  _contact.mobile=_mobile.text;
                  _contact.address=_address.text;

                  var res=await _service.Updatestudent(_contact);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));

                },
                child: const Text("Update"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink
                ),
              )

            ],
          ),
        )
    );
  }
}