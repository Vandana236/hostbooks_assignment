import 'dart:convert';

import 'package:hostbooks/networking/NetworkConstant.dart';
import 'package:http/http.dart'as http;
class ApiProvider{
Future<dynamic>getApi(searchUser)async{
  try{
    var response=await http.get(Uri.parse(NetworkConstant.base_url+NetworkConstant.serach_user_url+'?q=$searchUser'));
   
    if(response.statusCode==200){
      
      var res=json.decode(response.body);
      return res;
    }else{
     
      return 'error';
    }

  }catch(e){
    print(e);
    
  }

}
}



