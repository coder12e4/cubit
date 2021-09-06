part of 'delivery_address_cubit.dart';

abstract class DeliveryAddressState {}

class DeliveryAddressIntial extends DeliveryAddressState {}

class DeliveryAddressLoading extends DeliveryAddressState {}

class DeliveryAddressFetchLoading extends DeliveryAddressState {}

class DeliveryAddressFetchSuccessful extends DeliveryAddressState {
  final List<DeliveryAddress> deliveryAddressList;

  DeliveryAddressFetchSuccessful(this.deliveryAddressList);
}

class GooglePlaceFetchSuccessful extends DeliveryAddressState {
  final List<AutocompletePrediction> predictions;

  GooglePlaceFetchSuccessful(this.predictions);
}

class PlaceLateLongFetchSuccessful extends DeliveryAddressState {
  LatLng latLng;

  PlaceLateLongFetchSuccessful(this.latLng);
}

class DeliveryAddressEmpty extends DeliveryAddressState {}

class PlaceLateLongFetchError extends DeliveryAddressState {}

class DeliveryAddressAddedSuccesfully extends DeliveryAddressState {}

class DeliveryAddressEditedSuccesfully extends DeliveryAddressState {}

class DeliveryAddressCreationFailed extends DeliveryAddressState {
  final String error;

  DeliveryAddressCreationFailed(this.error);
}

class DeliveryAddressDeletionFailed extends DeliveryAddressState {
  final String? error;

  DeliveryAddressDeletionFailed(this.error);
}

class DeliveryAddressDeletionSuccess extends DeliveryAddressState {}

class DeliveryAddressFetchFailed extends DeliveryAddressState {
  final String? error;

  DeliveryAddressFetchFailed(this.error);
}
