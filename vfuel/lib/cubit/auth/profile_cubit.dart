import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/cubit/repository/profile_repository.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/districts.dart';
import 'package:vfuel/models/profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepository) : super(ProfileIntial());
  final ProfileRepository profileRepository;

  Future<void> fetchUserProfile() async {
    UserSession? _usersesion = await UserManager.instance.getUserSession();
    emit(ProfileLoading());

    Profile profile = UserManager.instance.getCurrentUserProfile();
    if (profile != null) {
      emit(ProfileFetchedSuccessfull(profile));
    } else {
      emit(ProfileLoadingFailed("Profile fetching failed"));
    }
  }

  Future<void> changePassword(String? oldPassword, String? newPassword) async {
    emit(ChangePasswordLoading());
    Result result =
        await profileRepository.changePassword(oldPassword, newPassword);
    if (result.isSuccess) {
      emit(ChangePasswordSuccessful());
    } else {
      emit(ChangePasswordFailed(result.failure));
    }
  }

  Future<void> updateUser(User user) async {
    emit(UpdateUserLoading());

    Result result = await profileRepository.updateUser(user);
    if (result.isSuccess) {
      emit(UpdateUserSuccessful());
    } else {
      emit(UpdateUserError(result.failure));
    }
  }

  Future<void> getDistricts() async {
    emit(DistrictsLoading());
    Result result = await profileRepository.getDitricts();
    if (result.isSuccess) {
      List<District> districts = Utils.districtsFromJson(result.success);
      emit(DistrictsFetchedSuccessfully(districts));
    } else {
      emit(DistrictsFetchFailed(result.failure));
    }
  }
}
