import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class Temperature extends StatefulWidget {
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: const TemperatureContainer(),
    );
  }
}

class TemperatureContainer extends StatelessWidget {
  const TemperatureContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    var data;
    data = state.additionalData ?? state.data;
    return Container(
      child: Column(
        children: [
          Text(
            '${data.temperature} C°',
            style: TextStyle(
              fontSize: 50,
              color: Colors.grey[700],
            ),
          ),
          Text(
            'Feel like ${data.feelTemperature} C°',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
