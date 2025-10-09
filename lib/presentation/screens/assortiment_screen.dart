import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_agent/data/providers/api_provider/assotriment_api.dart';
import 'package:sales_agent/data/repositories/assortiment_repositori.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_bloc.dart';
import 'package:sales_agent/logic/blocs/assortiment_blocs/assortiment_state.dart';
import 'package:sales_agent/presentation/widgets/loading_widget.dart';

import '../../core/errors/error_toast.dart';
import '../../core/styles_text.dart';
import '../widgets/title_home_widget.dart';

class AssortimentScreen extends StatelessWidget {
  const AssortimentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AssortimentBloc(AssortimentApi(), AssortimentRepositori())
            ..fetchAssortiment(),
      child: AssortimentUI(),
    );
  }
}

class AssortimentUI extends StatefulWidget {
  const AssortimentUI({super.key});

  @override
  State<AssortimentUI> createState() => _AssortimentUIState();
}

class _AssortimentUIState extends State<AssortimentUI> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssortimentBloc, AssortimentState>(
      listener: (BuildContext context, AssortimentState state) {
        print('LISTENER: State type: ${state.runtimeType}'); // ДОБАВЬТЕ
        if (state is AssortimentFailure) {
          showMesageError(state.message, context);
        }
      },
      builder: (context, state) {
        print('BUILDER: State type: ${state.runtimeType}'); // ДОБАВЬТЕ

        if (state is AssortimentSuccess) {
          print('SUCCESS: Orders count: ${state.orders.length}'); // ДОБАВЬТЕ
        }

        if (state is AssortimentLoading) {
          return LoadingWidget(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
        }

        if (state is AssortimentSuccess) {
          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 40.w),
                    SizedBox(
                      height: 100.h,
                      child: Text(
                        "asl.title".tr(),
                        style: primaFontOrders,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: TitleHomeWidget(),
                    ),
                  ],
                ),

              ],
            ),
          );
        }

        return LoadingWidget(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        );
      },
    );
  }
}