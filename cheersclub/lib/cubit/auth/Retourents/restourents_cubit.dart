import 'package:bloc/bloc.dart';
import 'package:cheersclub/cubit/repository/ResorentsListRepository.dart';
import 'package:cheersclub/models/SingleRestorent.dart';
import 'package:result_type/result_type.dart';

part 'restourents_state.dart';

class RestourentsCubit extends Cubit<RestourentsState> {
  RestourentsCubit(this.restorentListRepository) : super(RestourentsInitial());
  final RestorentListRepository restorentListRepository;
  List<SingleRestorent> RetourentList = [];

  Future<void> loadrestourent() async {
    emit(RestourentsLoading());
    Result? result = await restorentListRepository.restourentList();

    if (result.isSuccess) {
      dynamic resultData = result.success;

      List<SingleRestorent> Listdata = await ordersList(
        resultData,
      );

      emit(RestourentsSucces(Listdata));
    } else {
      emit(RestourentFail(result.failure));
    }
  }
}

List<SingleRestorent> ordersList(List data) {
  List<SingleRestorent> _orders = [];
  var length = data.length;
  print(length.toString());

  for (int i = 0; i < length; i++) {
    SingleRestorent order = SingleRestorent(
        id: data[i]["id"],
        name: data[i]["name"],
        email: data[i]["email"],
        address: data[i]["address"],
        city: data[i]["city"],
        country: data[i]["country"],
        userType: data[i]["country"],
        profilePhotoUrl: data[i]["profilePhotoUrl"],
        followers: data[i]["followers"],
        followings: data[i]["followings"]);
    _orders.add(order);
  }
  return _orders;
}
