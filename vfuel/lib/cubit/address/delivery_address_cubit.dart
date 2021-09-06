import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/cubit/repository/delivery_address_repository.dart';
import 'package:vfuel/models/profile.dart';

part 'delivery_address_state.dart';

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
  DeliveryAddressCubit(this.deliveryLocationRepository)
      : super(DeliveryAddressIntial());
  final UserDeliveryLocationRepository deliveryLocationRepository;
  String googleapiKey = "AIzaSyAvsDB_5QhCArQf0Wzv7l9Kd-sqUkPZLSw";
  Future<void> fetchSavedAddresses() async {
    emit(DeliveryAddressLoading());
    List<DeliveryAddress> addressList =
        UserManager.instance.getCurrentUserProfile().deliveryAddress!;
    if (addressList.isEmpty) {
      emit(DeliveryAddressEmpty());
    } else {
      emit(DeliveryAddressFetchSuccessful(addressList));
    }
  }

  Future<void> fetchAllAddrresses() async {
    emit(DeliveryAddressLoading());
    Result result = await deliveryLocationRepository.getAllAddresses();
    if (result.isSuccess) {
      List<DeliveryAddress> addresses = Utils.addressFromJson(result.success);
      if (addresses.isEmpty) {
        emit(DeliveryAddressEmpty());
      } else {
        emit(DeliveryAddressFetchSuccessful(addresses));
      }
    } else {
      emit(DeliveryAddressFetchFailed(result.failure));
    }
  }

  Future<void> deleteDeliveryAddress(String? addressId) async {
    // emit(DeliveryAddressLoading());
    Result result =
        await deliveryLocationRepository.deleteDeliveryLocation(addressId);
    if (result.isSuccess) {
      fetchAllAddrresses();
    } else {
      emit(DeliveryAddressDeletionFailed(result.failure));
    }
  }

  Future<void> addDeliveryAddress(DeliveryAddress address) async {
    emit(DeliveryAddressLoading());
    Result result =
        await deliveryLocationRepository.addNewDeliveryLocation(address);
    if (result.isSuccess) {
      emit(DeliveryAddressAddedSuccesfully());
    } else {
      emit(DeliveryAddressDeletionFailed(result.failure));
    }
  }

  Future<void> editDeliveryAddress(DeliveryAddress address) async {
    emit(DeliveryAddressLoading());
    Result result =
        await deliveryLocationRepository.editNewDeliveryLocation(address);
    if (result.isSuccess) {
      emit(DeliveryAddressEditedSuccesfully());
    } else {
      emit(DeliveryAddressDeletionFailed(result.failure));
    }
  }

  Future<void> placeList(String value) async {
    List<AutocompletePrediction> predictions = [];
    GooglePlace googlePlace = GooglePlace(googleapiKey);
    var result = await googlePlace.autocomplete.get(value);
    predictions = result!.predictions!;

    emit(GooglePlaceFetchSuccessful(predictions));
    print(predictions[1].description);
  }

  Future<void> placeLatLong(String placeId) async {
    emit(DeliveryAddressLoading());
    List<AutocompletePrediction> predictions = [];
    GooglePlace googlePlace = GooglePlace(googleapiKey);
    var result = await googlePlace.details.get(placeId);
    if (result != null && result.result != null) {
      LatLng latLng = LatLng((result.result!.geometry!.location!.lat)!,
          (result.result!.geometry!.location!.lng)!);
      print(latLng);
      emit(PlaceLateLongFetchSuccessful(latLng));
    } else {
      emit(PlaceLateLongFetchError());
    }
  }
}
