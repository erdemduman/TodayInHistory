import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:project_th/constants/const_fields.dart';
import 'package:project_th/constants/styles.dart';
import 'package:project_th/logic/bloc/main_page_bloc.dart';

class EditDateDialog extends StatefulWidget {
  final MainPageBloc? bloc;

  EditDateDialog({this.bloc});

  @override
  _EditDateDialogState createState() => _EditDateDialogState();
}

class _EditDateDialogState extends State<EditDateDialog> {
  DialogScreen _dialogScreen = DialogScreen.MONTH;
  String _month = "Jan";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Container()),
        Expanded(flex: 1, child: _getDialogScreen()),
        Expanded(flex: 1, child: Container())
      ],
    );
  }

  Widget _getDialogScreen() {
    final childWidget = _dialogScreen == DialogScreen.MONTH
        ? _MonthView(monthTapAction: _monthTapAction)
        : _DayView(
            month: _month,
            okButtonTapAction: _okButtonTapAction,
            backButtonTapAction: _backButtonTapAction);

    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: childWidget);
  }

  void _monthTapAction(String month) {
    setState(() {
      _dialogScreen = DialogScreen.DAY;
      _month = month;
    });
  }

  void _okButtonTapAction(int day) {
    var monthNumber = ConstFields.intToMonth.entries
        .firstWhere((element) => element.value == _month)
        .key;
    widget.bloc?.changeDate(monthNumber, day);
  }

  void _backButtonTapAction() {
    setState(() {
      _dialogScreen = DialogScreen.MONTH;
    });
  }
}

class _MonthView extends StatelessWidget {
  final Function(String) monthTapAction;

  _MonthView({required this.monthTapAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Jan")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Feb")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Mar")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Apr")),
          Expanded(flex: 1, child: SizedBox()),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("May")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Jun")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Jul")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Aug")),
          Expanded(flex: 1, child: SizedBox()),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Sep")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Oct")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Nov")),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: _monthButton("Dec")),
          Expanded(flex: 1, child: SizedBox()),
        ]),
      ],
    );
  }

  GestureDetector _monthButton(String monthName) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(monthName,
                  style: Styles.getDateDialogMonthViewButtonTextStyle()))),
      onTap: () {
        monthTapAction(monthName);
      },
    );
  }
}

class _DayView extends StatefulWidget {
  final String month;
  final Function(int) okButtonTapAction;
  final Function backButtonTapAction;

  _DayView(
      {required this.month,
      required this.okButtonTapAction,
      required this.backButtonTapAction});

  @override
  __DayViewState createState() => __DayViewState();
}

class __DayViewState extends State<_DayView> {
  int _dayValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
          child: Text("Select the day:",
              style: Styles.getDateDialogDayViewTextStyle())),
      Container(
        child: NumberPicker(
            selectedTextStyle:
                Styles.getDateDialogDayViewPickerSelectedTextStyle(),
            textStyle: Styles.getDateDialogDayViewPickerTextStyle(),
            axis: Axis.horizontal,
            minValue: 1,
            maxValue: ConstFields.monthDayNumbers[widget.month]!,
            value: _dayValue,
            onChanged: (newValue) {
              setState(() {
                _dayValue = newValue;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            child: Container(
                child: Text("Back",
                    style: Styles.getDateDialogDayViewTextStyle())),
            onTap: () {
              widget.backButtonTapAction();
            },
          ),
          SizedBox(width: 40),
          GestureDetector(
            child: Container(
              child: Text("OK", style: Styles.getDateDialogDayViewTextStyle()),
            ),
            onTap: () {
              widget.okButtonTapAction(_dayValue);
            },
          ),
          SizedBox(width: 30)
        ],
      )
    ]);
  }
}

enum DialogScreen { MONTH, DAY }
