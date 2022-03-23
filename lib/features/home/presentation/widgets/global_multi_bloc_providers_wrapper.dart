import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalMultiBlocProvidersWrapper extends MultiBlocProvider {
  GlobalMultiBlocProvidersWrapper({Key? key, required Widget child,}) : super(key: key,
          child: child,
          providers: [
            // BlocProvider(
            //     create: (context) =>
            //         getIt<GetAllReasonCodesBloc>()..add(GetAllReasonCodes())),
            // BlocProvider(
            //     create: (context) =>
            //         getIt<GetAllRecordStatusTypesSubscriptingBloc>()
            //           ..add(GetAllRecordStatusTypesSubscriptingIfNotExisted())),
            // BlocProvider(
            //     create: (context) =>
            //         getIt<GetOrganizationBloc>()..add(GetOrganizations())),
            // BlocProvider(
            //     create: (context) => getIt<GetOrganizationTypeBloc>()
            //       ..add(GetOrganizationTypes())),
            // BlocProvider(
            //     create: (context) => getIt<GetDiscountTypeBloc>()
            //       ..add(GetAllDiscountTypesIfNotExisted())),
            // BlocProvider(
            //     create: (context) => getIt<GetDiscountBloc>()
            //       ..add(GetAllDiscountsIfNotExisted())),
            // BlocProvider(
            //     create: (context) => getIt<GetManualValueTypeBloc>()
            //       ..add(GetAllManualValueTypes())),
            // BlocProvider(
            //     create: (context) =>
            //         getIt<GetReferenceTypeBloc>()..add(GetAllReferenceTypes())),
            // BlocProvider(
            //     create: (context) =>
            //         getIt<GetAllLanguagesBloc>()..add(GetAllLanguages())),
          ],
        );
}
