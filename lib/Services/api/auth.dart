import 'package:dio/dio.dart' ;
import 'package:untitled/models/user/usermodel.dart';

var url='http://192.168.141.75:8000';

login_endPoint(phone_number,password) async{
  try{
  final dio = Dio();
  final response = await dio.post('$url/api/login',
    options: Options(
      headers: {
        "Accept":"application/json"
      }
    ),
    data: {
    "phone_number":"$phone_number",
      "password":"$password"
    },
  );
  if(response.statusCode==200) {
    print(response.data);
    User user=User.fromJson(response.data['data']['user']);
    print(user);
    return [user,response.data['data']['token']];
  }
  else{
    print("i cant login");
  }}
      catch(e){
        print(e);
      }
}

Register_endPoint(Firstname,Lastname,location,phone,password)async{
  try{
    final dio = Dio();
    final response = await dio.post('$url/api/register',
      options: Options(
          headers: {
            "Accept":"application/json"
          }
      ),
      data: {
      "First Name":"$Firstname",
        "Last Name":"$Lastname",
        "Location":"$location",
        "phone_number":"$phone",
        "password":"$password"
      },
    );
    if(response.statusCode==200) {
      print(response.data);
      User user=User.fromJson(response.data['data']['user']);
      print(user);
      return [user,response.data['data']['token']];
    }
    else{
      print("i cant login");
    }}
  catch(e){
    print(e);
  }
}





