


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_services/cubits/utils.dart';
import 'package:i_services/states/requests_states.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RequestsCubit extends Cubit<RequestsStates> {

  RequestsCubit() : super(InitRequestState());

  void addRequest(Map<String, dynamic> requestData) async {
    emit(AddRequestLoadingState());
    try {
      http.Response res = await http.post(Uri.parse('${SharedUtils.domain}/requests.json'), body: json.encode(requestData));
      if (res.statusCode == 200) {
        emit(SuccessAddRequestState());
      } else {
        emit(ErrorAddRequestState());
      }
    } catch (e) {
      emit(ErrorAddRequestState());
    }
  }
}
