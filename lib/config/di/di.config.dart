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

import '../../features/auth/api/api_clients/auth_api_client.dart' as _i775;
import '../../features/auth/api/datasources/auth_data_source_imp.dart' as _i36;
import '../../features/auth/data/datasources/auth_data_source.dart' as _i970;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
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
    gh.lazySingleton<_i775.AuthApiClient>(
      () => _i775.AuthApiClient(gh<_i361.Dio>(), baseUrl: gh<String>()),
    );
    gh.lazySingleton<_i970.AuthDataSource>(
      () => _i36.AuthDataSourceImp(gh<_i775.AuthApiClient>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i970.AuthDataSource>()),
    );
    gh.lazySingleton<_i188.LoginUsecase>(
      () => _i188.LoginUsecase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i941.RegisterUsecase>(
      () => _i941.RegisterUsecase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        gh<_i188.LoginUsecase>(),
        gh<_i941.RegisterUsecase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i889.DioModule {}
