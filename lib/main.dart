import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_colors.dart';
import 'features/home/data/datasources/random_user_remote_datasource.dart';
import 'features/home/data/repositories/user_repository_impl.dart';
import 'features/home/domain/usecases/get_user_profiles_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_event.dart';
import 'main_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configure transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  final remoteDataSource = RandomUserRemoteDataSourceImpl();
  final repository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
  final getUserProfilesUseCase = GetUserProfilesUseCase(repository);

  runApp(
    VibeConnectApp(getUserProfilesUseCase: getUserProfilesUseCase),
  );
}

class VibeConnectApp extends StatelessWidget {
  final GetUserProfilesUseCase getUserProfilesUseCase;

  const VibeConnectApp({super.key, required this.getUserProfilesUseCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getUserProfilesUseCase: getUserProfilesUseCase,
      )..add(const FetchUsersEvent()),  
      child: MaterialApp(
        title: 'vibe connect App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primaryRose,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryRose,
            primary: AppColors.primaryRose,
            surface: AppColors.background,
          ),
        ),
        home: const MainLayout(),
      ),
    );
  }
}
