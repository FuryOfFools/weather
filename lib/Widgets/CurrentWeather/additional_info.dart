import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class AdditionalInfo extends StatefulWidget {
  @override
  _AdditionalInfoState createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  ValueNotifier<double> _height;
  @override
  void initState() {
    super.initState();
    _height = ValueNotifier(10.0);
    Future.delayed(Duration(microseconds: 1), () {
      _height.value = 70.0;
      // я бы вместо этого хотел бы сделать SizeTransition, но так как обязательно
      // надо было сделать хотя бы одну implicit анимацию я сделал
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _height,
        builder: (_, double value, __) {
          return AnimatedContainer(
            height: value,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 300),
            child: AdditionalInfoContainer(),
          );
        });
  }
}

class AdditionalInfoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    var data = state.additionalData ?? state.data;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: _decoration(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AddInfo(
                  description: 'Visibility: ',
                  info: '${data.visibility} m',
                ),
                AddInfo(
                  description: 'Cloudiness: ',
                  info: '${data.cloudiness}%',
                ),
                AddInfo(
                  description: 'Humidity: ',
                  info: '${data.humidity}%',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wind(data: data),
                AddInfo(
                  description: 'Pressure: ',
                  info: '${data.pressure} hPa',
                ),
              ],
            )
          ],
        ));
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.amber[50],
      boxShadow: [
        BoxShadow(
          color: Colors.grey[200],
          spreadRadius: 1,
          blurRadius: 2,
        ),
      ],
    );
  }
}

class Wind extends StatelessWidget {
  final data;
  const Wind({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddInfo(
          description: 'Wind: ',
          info: '${data.windSpeed} m/s',
        ),
        Transform.rotate(
          angle: data.windDegrees.toDouble(),
          child: Icon(
            Icons.arrow_back,
            size: 12,
          ),
        ),
      ],
    );
  }
}

class AddInfo extends StatelessWidget {
  final String description, info;
  const AddInfo({this.description, this.info, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            )),
        Text(
          info,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
