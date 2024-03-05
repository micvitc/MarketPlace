import 'package:http/http.dart' as http;
class apiCalls{
  final String hostLink = "http://localhost:3000/";
  
  Future<bool> userAvail(String id) async{
    Uri link = Uri.parse(hostLink+"User/"+id);
    var response = await http.get(link);
    if(response.statusCode==200) {
      return true;
    }
      return false;
    
  }

  Future<int> addUser(String jsonData) async{
    Uri link = Uri.parse(hostLink+"User/create");
    try {
      final response = await http.post(
        link,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );
      return response.statusCode;
    } catch (e) {
      print('Error posting data: $e');
    }

    return 0;
  }

  Future<String> getUserProfile(String id) async{
    Uri link= Uri.parse(hostLink+"User/"+id);
    final response = await http.get(link);
    String data = response.body;
    return data;
  }

  Future<int> updateUser(String jsonParam,String id) async{
    Uri link = Uri.parse(hostLink+"User/"+id);
    try {
      final response = await http.put(
        link,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonParam,
      );

      return response.statusCode;
    } catch (e) {
      print('Error posting data: $e');
    }
    return 0;
  }
  
}