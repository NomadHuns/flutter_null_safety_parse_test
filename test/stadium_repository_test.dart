import 'package:different_type_parse/my_dio.dart';
import 'package:different_type_parse/response_dto.dart';
import 'package:different_type_parse/stadium.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

String token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3RzdHVkeSIsInJvbGUiOiJQTEFZRVIiLCJuaWNrbmFtZSI6InNzYXIxMjMiLCJpZCI6MSwiZXhwIjoxNjgzMDA5MTE4fQ.NczIkH07fPyUAwrF5Tm1BDGCiIa7tk3D9-QbbUGKuNeSb0iS_QbKW3gyUClxVEvf5hYGVhv8ADimpE46-9TOcw';

void main() async {
  await fetchStadiumDetail_test();
  await fetchStadiumList_test();
}

Future<void> fetchStadiumList_test() async {
  String jwt = token;
  String keyword = '야구';
  Response response = await dio.get("/api/user/stadiums?keyword="+keyword,
      options: Options(headers: {"Authorization": "$jwt"}));
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  Logger().d(responseDTO.data);
  List<dynamic> mapList = responseDTO.data as List<dynamic>;
  List<Stadium> postList = mapList.map((e) => Stadium.fromJson(e)).toList();
  responseDTO.data = postList;
  Logger().d(postList[0].id);
  Logger().d(postList[0].name);
}

Future<void> fetchStadiumDetail_test() async {
  String jwt = token;
  int stadiumId = 1;
  Response response = await dio.get("/api/user/stadium/$stadiumId",
      options: Options(headers: {"Authorization": "$jwt"}));

  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  responseDTO.data = Stadium.fromJson(responseDTO.data);

  Logger().d(response.data);
}