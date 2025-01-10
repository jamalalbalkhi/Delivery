import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/models/CategoryModel.dart';
import 'package:untitled/models/Marketmodel.dart';
import 'package:untitled/models/Order.dart';
import 'package:untitled/models/products.dart';
import 'package:untitled/models/user/usermodel.dart';

var url = 'http://192.168.1.8:8000';

login_endPoint(phone_number, password) async {
  try {
    final dio = Dio();
    final response = await dio.post(
      '$url/api/login',
      options: Options(headers: {"Accept": "application/json"}),
      data: {"phone_number": "$phone_number", "password": "$password"},
    );
    if (response.statusCode == 200) {
      print(response.data);
      User user = User.fromJson(response.data['data']['user']);
      print(user);
      var token = response.data['data']['token'];
      await savetoken(token);
      return [user, response.data['data']['token']];
    } else {
      return password;
    }
  } catch (e) {
    print(e);
  }
}

Register_endPoint({Firstname, Lastname, location, phone, password}) async {
  try {
    final dio = Dio();
    final response = await dio.post(
      '$url/api/register',
      options: Options(headers: {"Accept": "application/json"}),
      data: {
        "first_name": "$Firstname",
        "last_name": "$Lastname",
        "location": "$location",
        "phone_number": "$phone",
        "password": "$password"
      },
    );
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data);
      User user = User.fromJson(response.data['data']['user']);
      print(user);
      var token = response.data['data']['token'];
      await savetoken(token);
      return [user, response.data['data']['token']];
    } else {
      print('lkjhg');
    }
  } catch (e) {
    print(e);
  }
}

savetoken(token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final saveToken = await prefs.setString('token', token);
}

readtoken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  return token;
}

removetoken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}

Logout_endpoint() async {
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.get(
      '$url/api/logout',
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      ),
    );
    if (response.statusCode == 200) {
      await removetoken();
      print(response.data);
      return true;
    }
  } catch (e) {
    print(e);
  }
}

categoryes_endpoint() async {
  try {
    final dio = Dio();
    final response = await dio.get('$url/api/getCategories',
        options: Options(headers: {"Accept": "application/json"}));
    if (response.statusCode == 200) {
      print(response.data);
      List list = response.data;
      return list.map((e) => Category.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }
}

profile_endpoint() async {
  try {
    var token = await readtoken();
    final dio = Dio();
    final response = await dio.get('$url/api/profile',
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
        ));
    if (response.statusCode == 200) {
      print(response.data);
      return User.fromJson(response.data);
    }
  } catch (e) {
    print(e);
  }
}

Markets_endPoint(id) async {
  try {
    final dio = Dio();
    final response = await dio.get('$url/api/getMarkets/$id',
        options: Options(headers: {"Accept": "application/json"}));
    if (response.statusCode == 200) {
      print(response.data);
      List list = response.data;
      return list.map((e) => Market.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }
}

Prodauct_endPoint(id) async {
  try {
    final dio = Dio();
    final response = await dio.get('$url/api/getProducts/$id',
        options: Options(headers: {"Accept": "application/json"}));
    if (response.statusCode == 200) {
      print(response.data);
      List list = response.data;
      return list.map((e) => product.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }
}

Upload_imagprofile(profilimage) async {
  var token = await readtoken();
  String fileName = profilimage.path.split('/').last;
  print(fileName);
  print(token);
  final dio = Dio();
  FormData formData = FormData.fromMap({
    "profile_picture":
        await MultipartFile.fromFile(profilimage.path, filename: fileName),
  });
  final response = await dio.post(
    "$url/api/profile/picture",
    data: formData,
    options: Options(
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data"
      },
    ),
  );
  if (response.statusCode == 200) {
    print(response.data);
  }
}

search_products(query) async {
  try {
    final dio = Dio();
    final response = await dio.get('$url/api/search?query=$query',
        options: Options(headers: {"Accept": "application/json"}));
    if (response.statusCode == 200) {
      print(response.data);
      List list = response.data['products'];
      return list.map((e) => product.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }
}

createOrder(List<product> products) async {
  List data = [];
  for (int i = 0; i < products.length; i++) {
    var item = {
      'id': products[i].id,
      "quantity": products[i].quantity,
    };
    data.add(item);
  }
  print(data);
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.post(
      '$url/api/create_order',
      options: Options(headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
      data: {"products": data},
    );
    if (response.statusCode == 201) {
      print(response.data);
    }
  } catch (e) {
    print(e);
  }
}

Order_endPoints() async {
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.get(
      '$url/api/getUserOrders',
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.data);
      List list = response.data;
      return list.map((e) => Order.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }
}

addToFavorite(id) async {
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.post('$url/api/addFavorite/$id',
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }));
    if (response.statusCode == 200) {
      print(response.data);
    }
  } catch (e) {
    print(e);
  }
}

removeFromFavorite(id) async {
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.delete('$url/api/removeFavorite/$id',
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }));
    if (response.statusCode == 200) {
      print(response.data);
    }
  } catch (e) {
    print(e);
  }
}

getFavoriteList() async {
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.get(
      '$url/api/getFavoriteProducts',
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.data);
      List list = response.data;
      return list.map((e) => product.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }
}

Deletrorder(id)async
{
  try{

    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.delete('$url/api/delete_order/$id',
        options: Options(headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }));
    if (response.statusCode == 200) {
      print(response.data);
    }

  }
  catch(e)
  {

    print(e);
  }
}

getOrderProducts_endpoint(id)async{
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.get('$url/api/getOrderProducts/$id',
        options: Options(headers: {"Accept": "application/json","Authorization": "Bearer $token"}));
    if (response.statusCode == 200) {
      print(response.data);
      List list = response.data['products'];
      return list.map((e) => product.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }
}
Edit_order_endpoint(id,List<product> products)async{
  List data = [];
  for (int i = 0; i < products.length; i++) {
    var item = {
      'id': products[i].id,
      "quantity": products[i].quantity,
    };
    data.add(item);
  }
  print(data);
  try {
    var token = await readtoken();
    print(token);
    final dio = Dio();
    final response = await dio.put(
      '$url/api/update_order/$id',
      options: Options(headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
      data: {"products": data},
    );
    if (response.statusCode == 201) {
      print(response.data);
    }
  } catch (e) {
    print(e);
  }
}



