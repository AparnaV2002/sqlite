class Student{
  int? id;
  String? firstname;
  String? lastname;
  String? mobile;
  String? email;
  String? address;

  studentMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['firstname']=firstname!;
    mapping['lastname']=lastname!;
    mapping['mobile']=mobile!;
    mapping['email']=email!;
    mapping['address']=address!;
    return mapping;
  }
}