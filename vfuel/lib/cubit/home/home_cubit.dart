import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/cubit/repository/home_repository.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/home/configuration.dart';
import 'package:vfuel/models/profile.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeIntial());
  final HomeRepository homeRepository;

  Future<void> fetchConfiguration() async {
    emit(HomeLoading());
    UserSession _usersesion =
        await (UserManager.instance.getUserSession() as FutureOr<UserSession>);
    Result userProfileResult =
        await homeRepository.fetchUserProfileDetails(_usersesion.userId!);
    if (userProfileResult.isSuccess) {
      Profile userProfile = Profile.fromJson(userProfileResult.success);
      UserManager.instance.setUserProfile(userProfile);
      Result result = await homeRepository.fetchConfiguration();
      if (result.isSuccess) {
        Configuration config = Configuration.fromJson(result.success);
        emit(HomeConfigurationFtechedSuccessfully(config));
      } else {
        emit(HomeConfigurationFtechFailed(result.failure));
      }
    } else {
      emit(ProfileLoadingFailed(userProfileResult.failure));
    }
  }

  Future<void> fetchUserProfile() async {
    UserSession _usersesion =
        await (UserManager.instance.getUserSession() as FutureOr<UserSession>);
    emit(ProfileLoading());
    Result result =
        await homeRepository.fetchUserProfileDetails(_usersesion.userId!);
    if (result.isSuccess) {
      Profile userProfile = Profile.fromJson(result.success);
      UserManager.instance.setUserProfile(userProfile);
      emit(ProfileFetchedSuccessfull(userProfile));
    } else {
      emit(ProfileLoadingFailed(result.failure));
    }
  }
}
