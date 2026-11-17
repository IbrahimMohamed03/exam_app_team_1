// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/storage/token_storage.dart' as _i1001;
import '../../features/auth/api/api_clients/auth_api_client.dart' as _i775;
import '../../features/auth/api/datasources/auth_data_source_imp.dart' as _i36;
import '../../features/auth/data/datasources/auth_data_source.dart' as _i970;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/check_login_status_usecase.dart'
    as _i724;
import '../../features/auth/domain/usecases/forgot_password_usecase.dart'
    as _i560;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/reset_password_usecase.dart'
    as _i474;
import '../../features/auth/domain/usecases/verify_reset_code_usecase.dart'
    as _i694;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/auth/presentation/cubit/forgot_password_cubit.dart'
    as _i104;
import '../../features/auth/presentation/cubit/splash_cubit.dart' as _i248;
import '../../features/home/api/api_client/home_api_client.dart' as _i592;
import '../../features/home/api/datasources/home_data_source_impl.dart'
    as _i197;
import '../../features/home/data/datasources/remote/home_data_source.dart'
    as _i545;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/usecases/get_one_subject_usecase.dart'
    as _i703;
import '../../features/home/domain/usecases/get_subjects_usecase.dart' as _i895;
import '../dio/dio.dart' as _i889;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i1001.TokenStorage>(() => _i1001.TokenStorage());
    gh.lazySingleton<_i775.AuthApiClient>(
      () => _i775.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i592.HomeApiClient>(
      () => _i592.HomeApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i545.HomeDataSource>(
      () => _i197.HomeDataSourceImp(gh<_i592.HomeApiClient>()),
    );
    gh.lazySingleton<_i970.AuthDataSource>(
      () => _i36.AuthDataSourceImp(gh<_i775.AuthApiClient>()),
    );
    gh.lazySingleton<_i0.HomeRepository>(
      () => _i76.HomeRepositoryImpl(gh<_i545.HomeDataSource>()),
    );
    gh.lazySingleton<_i703.GetOneSubjectUsecase>(
      () => _i703.GetOneSubjectUsecase(gh<_i0.HomeRepository>()),
    );
    gh.lazySingleton<_i895.GetSubjectsUsecase>(
      () => _i895.GetSubjectsUsecase(gh<_i0.HomeRepository>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i970.AuthDataSource>(),
        gh<_i1001.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i724.CheckLoginStatusUsecase>(
      () => _i724.CheckLoginStatusUsecase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i560.ForgotPasswordUsecase>(
      () => _i560.ForgotPasswordUsecase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i188.LoginUsecase>(
      () => _i188.LoginUsecase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i941.RegisterUsecase>(
      () => _i941.RegisterUsecase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i474.ResetPasswordUsecase>(
      () => _i474.ResetPasswordUsecase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i694.VerifyResetCodeUsecase>(
      () => _i694.VerifyResetCodeUsecase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        gh<_i188.LoginUsecase>(),
        gh<_i941.RegisterUsecase>(),
      ),
    );
    gh.factory<_i104.ForgotPasswordCubit>(
      () => _i104.ForgotPasswordCubit(
        gh<_i560.ForgotPasswordUsecase>(),
        gh<_i694.VerifyResetCodeUsecase>(),
        gh<_i474.ResetPasswordUsecase>(),
      ),
    );
    gh.factory<_i248.SplashCubit>(
      () => _i248.SplashCubit(gh<_i724.CheckLoginStatusUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i889.DioModule {}
