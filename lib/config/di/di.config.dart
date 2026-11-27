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
import '../../features/auth/api/data_sources/auth_data_source_imp.dart'
    as _i139;
import '../../features/auth/data/data_sources/auth_data_source.dart' as _i933;
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
import '../../features/auth/presentation/cubit/auth/auth_cubit.dart' as _i546;
import '../../features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart'
    as _i344;
import '../../features/auth/presentation/cubit/splash/splash_cubit.dart'
    as _i22;
import '../../features/home/subject/api/api_clients/home_api_client.dart'
    as _i943;
import '../../features/home/subject/api/data_sources/home_data_source_impl.dart'
    as _i885;
import '../../features/home/subject/data/datasources/home_data_source.dart'
    as _i729;
import '../../features/home/subject/data/repositories/home_repository_impl.dart'
    as _i429;
import '../../features/home/subject/domain/repositories/home_repository.dart'
    as _i1007;
import '../../features/home/subject/domain/usecases/get_subjects_usecase.dart'
    as _i128;
import '../../features/home/subject/presentation/cubit/home_view_model.dart'
    as _i481;
import '../../features/home/subject_exams/api/api_clients/subject_exams_api_client.dart'
    as _i884;
import '../../features/home/subject_exams/data/data_sources/subject_exams_data_source.dart'
    as _i852;
import '../../features/home/subject_exams/data/repositories/subject_exams_repository_imp.dart'
    as _i516;
import '../../features/home/subject_exams/domain/repositories/subject_exams_repository.dart'
    as _i171;
import '../../features/home/subject_exams/domain/usecases/get_one_subject_usecase.dart'
    as _i437;
import '../dio/auth_interceptor.dart' as _i839;
import '../dio/dio.dart' as _i889;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i1001.TokenStorage>(() => _i1001.TokenStorage());
    gh.lazySingleton<_i839.AuthInterceptor>(
      () => _i839.AuthInterceptor(gh<_i1001.TokenStorage>()),
    );
    gh.lazySingleton<_i171.SubjectExamsRepository>(
      () => _i516.SubjectExamsRepositoryImp(gh<_i852.SubjectExamsDataSource>()),
    );
    gh.lazySingleton<_i437.GetOneSubjectUsecase>(
      () => _i437.GetOneSubjectUsecase(gh<_i171.SubjectExamsRepository>()),
    );
    gh.singleton<_i361.Dio>(() => dioModule.dio(gh<_i839.AuthInterceptor>()));
    gh.lazySingleton<_i775.AuthApiClient>(
      () => _i775.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i943.HomeApiClient>(
      () => _i943.HomeApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i884.SubjectExamsApiClient>(
      () => _i884.SubjectExamsApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i729.HomeDataSource>(
      () => _i885.HomeDataSourceImp(gh<_i943.HomeApiClient>()),
    );
    gh.lazySingleton<_i933.AuthDataSource>(
      () => _i139.AuthDataSourceImp(gh<_i775.AuthApiClient>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i933.AuthDataSource>(),
        gh<_i1001.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i1007.HomeRepository>(
      () => _i429.HomeRepositoryImpl(gh<_i729.HomeDataSource>()),
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
    gh.factory<_i546.AuthCubit>(
      () => _i546.AuthCubit(
        gh<_i188.LoginUsecase>(),
        gh<_i941.RegisterUsecase>(),
      ),
    );
    gh.factory<_i344.ForgotPasswordCubit>(
      () => _i344.ForgotPasswordCubit(
        gh<_i560.ForgotPasswordUsecase>(),
        gh<_i694.VerifyResetCodeUsecase>(),
        gh<_i474.ResetPasswordUsecase>(),
      ),
    );
    gh.lazySingleton<_i128.GetSubjectsUsecase>(
      () => _i128.GetSubjectsUsecase(gh<_i1007.HomeRepository>()),
    );
    gh.factory<_i22.SplashCubit>(
      () => _i22.SplashCubit(gh<_i724.CheckLoginStatusUsecase>()),
    );
    gh.factory<_i481.HomeCubit>(
      () => _i481.HomeCubit(gh<_i128.GetSubjectsUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i889.DioModule {}
