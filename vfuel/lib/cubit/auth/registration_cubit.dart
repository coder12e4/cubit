import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/cubit/repository/user_repository.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/districts.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepository userRepository;
  final RegistrationState registrationState;

  RegistrationCubit(this.userRepository, this.registrationState)
      : super(registrationState);

  Future<void> getDistricts() async {
    emit(DistrictsLoading());
    Result result = await userRepository.getDitricts();
    if (result.isSuccess) {
      List<District> districts = Utils.districtsFromJson(result.success);
      emit(DistrictsFetchedSuccessfully(districts));
    } else {
      emit(DistrictsFetchFailed(result.failure));
    }
  }

  Future<void> registerNewUser(User user) async {
    emit(UserRegistrationInProgresss());
    Result result = await userRepository.registerUser(user);
    if (result.isSuccess) {
      emit(UserRegistrationCompleted());
    } else {
      if (result.failure
          .toString()
          .contains("Local admin not found with partner code")) {
        emit(InvalidPartnerCodeError(result.failure.toString()));
      } else {
        emit(UserRegistrationError(result.failure));
      }
    }
  }

  Future<void> verifyMobile(String? mobile, String otp) async {
    emit(UserMobileVeificationInProgress());
    Result result = await userRepository.verifyOTP(mobile, otp);
    if (result.isSuccess) {
      emit(UserMobileVeificationSuccess());
    } else {
      emit(UserMobileVeificationError(result.failure));
    }
  }
}
