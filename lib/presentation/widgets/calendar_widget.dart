import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sales_agent/core/colors_app.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/styles_text.dart';
import '../../data/repositories/orders_repositori.dart';
import '../dialogs/calendar_day_dilaog.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final reposetoryOrder = OrdersRepositori();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<int>> _ordersByDate = {};



  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    final data = await reposetoryOrder.loadOrdersGroupedByDate();
    setState(() {
      _ordersByDate = data;
      print(data);
    });
  }

//  List<int> _getEventsForDay(DateTime day) {
//    final key = DateTime(day.year, day.month, day.day);
//    return _ordersByDate[key] ?? [];
//  }


  Widget oerderStatus(HexColor color, int count){
    return Container(
      width: 53.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(7.r),
        ),
      ),
      child: Center(child: Text(count.toString(), style: textStyleCalendarCount,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<String>(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      locale: context.locale.languageCode,
      startingDayOfWeek: StartingDayOfWeek.monday,
      // выделение выбранного дня
      //  selectedDayPredicate: (day) {
      //     return isSameDay(_selectedDay, day);
      //  },
      shouldFillViewport: true,
      daysOfWeekVisible: true,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },

      //  eventLoader: _getEventsForDay,
      daysOfWeekHeight: 25.h,

      // ======== Стили ========
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          final locale = context.locale.languageCode;

          final customDayNamesRu = ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'];
          final customDayNamesRo = ['D', 'L', 'Ma', 'Me', 'J', 'V', 'S'];
          final customDayNamesEn = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

          String dayName;

          if (locale == 'ru') {
            dayName = customDayNamesRu[day.weekday % 7];
          } else if (locale == 'ro') {
            dayName = customDayNamesRo[day.weekday % 7];
          } else {
            dayName = customDayNamesEn[day.weekday % 7];
          }

          return Center(child: Text(dayName, style: textStyleDayNamesCalendar));
        },

        defaultBuilder: (context, day, focusedDay) {
          final dateKey = DateTime(day.year, day.month, day.day);
          final dayOrders = _ordersByDate[dateKey] ?? [];
          final awaitingCount = dayOrders.where((s) => s == 2).length;
          final workingCount = dayOrders.where((s) => s == 1).length;
        //  final events = _getEventsForDay(day);

          return GestureDetector(
            onTap: (){
              _ordersByDate[dateKey] != null?
              showBlurDialogCalendar(context, dateKey, dayOrders): false;
              print('Нажали на дату defaultBuilder $dateKey → заказы: $dayOrders');
            },
            child: Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: borderColor, width: 1.w),
              ),
              width: 146.w,
              height: 64.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.r, top: 5.r),
                    child: Row(
                      children: [
                        Container(
                          width: 25.w,
                            child: Text(day.day.toString(), style: textStyleDayCalendar)),
                        Padding(
                          padding:  EdgeInsets.only(left: 10.h),
                          child: Center(
                            child: Text(
                              _ordersByDate[dateKey] == null
                                  ? ''
                                  : 'calendarComand'.tr(),
                              style: textStyleCalendarOrder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                       Expanded(
                         child: Row(
                            children: [
                            //  if (events.contains(2)) // например, статус 2 = "в работе"
                              if(awaitingCount != 0)
                                Padding(
                                  padding: EdgeInsets.only(left: 16.r),
                                  child: oerderStatus(colorBtJob,
                                      awaitingCount),
                                ),
                              const Spacer(),
                            //  if (events.contains(1)) // например, статус 1 = "в ожидании"
                              if(workingCount != 0)
                                Padding(
                                  padding: EdgeInsets.only(right: 16.r),
                                  child: oerderStatus(colorBtAwait,
                                      workingCount),
                                ),
                            ],
                                         ),
                       )
                ],
              ),
            ),
          );
        },
        selectedBuilder: (context, day, focusedDay) {
          final dateKey = DateTime(day.year, day.month, day.day);
          final dayOrders = _ordersByDate[dateKey] ?? [];
          final awaitingCount = dayOrders.where((s) => s == 2).length;
          final workingCount = dayOrders.where((s) => s == 1).length;
          //  final events = _getEventsForDay(day);
          return GestureDetector(
            onTap: (){
              print('Нажали на дату $dateKey → заказы: $dayOrders');
            },
            child: Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: borderColor, width: 1.w),
              ),
              width: 146.w,
              height: 64.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.r, top: 5.r),
                    child: Row(
                      children: [
                        Container(
                            width: 25.w,
                            child: Text(day.day.toString(), style: textStyleDayCalendar)),
                        Padding(
                          padding:  EdgeInsets.only(left: 10.h),
                          child: Center(
                            child: Text(
                              _ordersByDate[dateKey] == null
                                  ? ''
                                  : 'calendarComand'.tr(),
                              style: textStyleCalendarOrder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        //  if (events.contains(2)) // например, статус 2 = "в работе"
                        if(awaitingCount != 0)
                          Padding(
                            padding: EdgeInsets.only(left: 16.r),
                            child: oerderStatus(colorBtJob,
                                awaitingCount),
                          ),
                        const Spacer(),
                        //  if (events.contains(1)) // например, статус 1 = "в ожидании"
                        if(workingCount != 0)
                          Padding(
                            padding: EdgeInsets.only(right: 16.r),
                            child: oerderStatus(colorBtAwait,
                                workingCount),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          final dateKey = DateTime(day.year, day.month, day.day);
          final dayOrders = _ordersByDate[dateKey] ?? [];
          final awaitingCount = dayOrders.where((s) => s == 2).length;
          final workingCount = dayOrders.where((s) => s == 1).length;
          //  final events = _getEventsForDay(day);
          return GestureDetector(
            onTap: (){
              print('Нажали на дату $dateKey → заказы: $dayOrders');
            },
            child: Container(
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: borderColor, width: 1.w),
              ),
              width: 146.w,
              height: 64.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.r, top: 5.r),
                    child: Row(
                      children: [
                        Container(
                            width: 25.w,
                            child: Text(day.day.toString(), style: textStyleDayCalendar)),
                        Padding(
                          padding:  EdgeInsets.only(left: 10.h),
                          child: Center(
                            child: Text(
                              _ordersByDate[dateKey] == null
                                  ? ''
                                  : 'calendarComand'.tr(),
                              style: textStyleCalendarOrder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        //  if (events.contains(2)) // например, статус 2 = "в работе"
                        if(awaitingCount != 0)
                          Padding(
                            padding: EdgeInsets.only(left: 16.r),
                            child: oerderStatus(colorBtJob,
                                awaitingCount),
                          ),
                        const Spacer(),
                        //  if (events.contains(1)) // например, статус 1 = "в ожидании"
                        if(workingCount != 0)
                          Padding(
                            padding: EdgeInsets.only(right: 16.r),
                            child: oerderStatus(colorBtAwait,
                                workingCount),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return Container(
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: borderColor, width: 1.w),
            ),
            width: 146.w,
            height: 64.h,
            padding: EdgeInsets.only(left: 16.r, top: 5.r),
            child: Text(day.day.toString(), style: textStyleDayNexCalendar),
          );
        },
      ),

      //стиль карты
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 32.sp,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Colors.black,
          size: 32.sp,
        ),
        titleTextStyle: textStyleTitleCalendar,
        titleTextFormatter: (date, locale) {
          final month = DateFormat.MMMM(locale).format(date);
          return toBeginningOfSentenceCase(month);
        },
        decoration: BoxDecoration(
          color: containerColor,
          border: BoxBorder.all(color: borderColor, width: 1.w),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
        leftChevronPadding: EdgeInsets.only(left: 27.r),
        rightChevronPadding: EdgeInsets.only(right: 27.r),
      ),
    );
  }
}
