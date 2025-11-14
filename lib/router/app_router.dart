import 'package:connect_buddy/achievements/ui/achi_details.dart';
import 'package:connect_buddy/achievements/ui/achi_list.dart';
import 'package:connect_buddy/alumni/ui/alumni_detail.dart';
import 'package:connect_buddy/alumni/ui/alumni_list.dart';
import 'package:connect_buddy/dashboard/ui/dashboard.dart';
import 'package:connect_buddy/forgot_pass/BLoC/bloc/forgot_password_bloc.dart';
import 'package:connect_buddy/forgot_pass/ui/enter_otp.dart';
import 'package:connect_buddy/forgot_pass/ui/forgot_password.dart';
import 'package:connect_buddy/forgot_pass/ui/reset_password.dart';
import 'package:connect_buddy/forgot_pass/ui/success_pass_change.dart';
import 'package:connect_buddy/home/ui/home_screen.dart';
import 'package:connect_buddy/invite_via_mail/bloc/invite_via_email_bloc.dart';
import 'package:connect_buddy/invite_via_mail/invite_via_email.dart';
import 'package:connect_buddy/jobs/ui/add_job.dart';
import 'package:connect_buddy/jobs/ui/find_job_list.dart';
import 'package:connect_buddy/jobs/ui/interested_candidates_list.dart';
import 'package:connect_buddy/jobs/ui/job_detail.dart';
import 'package:connect_buddy/login/bloc/login_bloc.dart';
import 'package:connect_buddy/login/ui/login_screen.dart';
import 'package:connect_buddy/new_opportunity/bloc/new_opportunity_bloc.dart';
import 'package:connect_buddy/new_opportunity/new_opportunity.dart';
import 'package:connect_buddy/notice/bloc/notice_bloc.dart';
import 'package:connect_buddy/notice/ui/notice_detail.dart';
import 'package:connect_buddy/notice/ui/notice_list.dart';
import 'package:connect_buddy/profile/ui/my_profile.dart';
import 'package:connect_buddy/registration/ui/register_alumni.dart';
import 'package:connect_buddy/registration/ui/registration_list.dart';
import 'package:connect_buddy/registration/ui/registration_success.dart';
import 'package:connect_buddy/splash_screen/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter route = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(path: '/dashboard', builder: (context, state) => Dashboard()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => LoginBloc(),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/forgotPassword',
      builder: (context, state) => const ForgotPassword(),
    ),
    GoRoute(
      path: '/enterOtp',
      builder: (context, state) {
        return BlocProvider<ForgotPasswordBloc>(
          create: (context) => ForgotPasswordBloc(),
          child: const EnterOtp(),
        );
      },
    ),
    GoRoute(
      path: '/resetPassword',
      builder: (context, state) => ResetPassword(),
    ),
    GoRoute(
      path: '/passChangeSuccess',
      builder: (context, state) => PasswordChangeSuccessScreen(),
    ),

    //MARK: registration
    GoRoute(
      path: '/registrationList',
      builder: (context, state) => RegistrationList(),
    ),
    GoRoute(
      path: '/registerAlumni',
      builder: (context, state) => RegisterAlumni(),
    ),
    GoRoute(
      path: '/registrationSuccess',
      builder: (context, state) => RegistrationSuccessScreen(),
    ),

    GoRoute(
      path: '/noticeList',
      builder: (context, state) => BlocProvider(
        create: (context) => NoticeBloc()..add(GetNoticeListEvent()),
        child: NoticeList(),
      ),
    ),
    GoRoute(
      path: '/noticeDetail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BlocProvider(
          create: (context) => NoticeBloc()..add(GetNoticeDetailEvent(id)),
          child: const NoticeDetail(),
        );
      },
    ),

    GoRoute(path: '/achiList', builder: (context, state) => AchievementsList()),
    GoRoute(
      path: '/achiDetails',
      builder: (context, state) => AchievementDetails(),
    ),

    GoRoute(
      path: '/inviteViaEmail',
      builder: (context, state) => BlocProvider(
        create: (context) => InviteViaEmailBloc(),
        child: InviteViaEmail(),
      ),
    ),
    GoRoute(
      path: '/newOpportunity',
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              NewOpportunityBloc()..add(GtNewOpportunityEvent()),
          child: NewOpportunity(),
        );
      },
    ),

    GoRoute(path: '/myProfile', builder: (context, state) => MyProfile()),

    //MARK: alumni
    GoRoute(path: '/alumniList', builder: (context, state) => AlumniList()),
    GoRoute(path: '/alumniDetail', builder: (context, state) => AlumniDetail()),

    //MARK: job
    GoRoute(path: '/addJob', builder: (context, state) => AddJob()),

    // GoRoute(path: '/findJobList', builder: (context, state) => FindJobList()),
    GoRoute(
      path: '/interestedCandidatesList',
      builder: (context, state) => InterestedCandidatesList(),
    ),

    GoRoute(
      path: '/jobDetail',
      builder: (context, state) {
        final params = state.extra as JobDetailParams;
        return JobDetail(isFindJob: params.isFindJob);
      },
    ),

    GoRoute(
      path: '/findJobList',
      builder: (context, state) {
        final params = state.extra as FindJobListParams;

        return FindJobList(
          isAppliedList: params.isAppliedList,
          isFindJobList: params.isFindJobList,
          isPostJobList: params.isPostJobList,
          isPostedByMeList: params.isPostedByMeList,
          isAppliedByMeList: params.isAppliedByMeList,
        );
      },
    ),
  ],
);
