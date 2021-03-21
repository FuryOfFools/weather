import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Bloc/blocs.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const WeatherContainer(),
    );
  }
}

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherBloc>(context).state;
    var data;
    data = state.additionalData ?? state.data;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          WeatherIcon(data: data),
          WeatherDescription(data: data),
        ],
      ),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final data;
  const WeatherIcon({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 40,
          height: 40,
          image: AssetImage(data.weatherIcon),
        ),
        Text(
          data.weatherInfo,
          style: TextStyle(
            fontSize: 30,
            color: const Color(0xffec6e4c),
          ),
        ),
      ],
    );
  }
}

class WeatherDescription extends StatelessWidget {
  final data;
  const WeatherDescription({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Description: ',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${data.weatherDescription}',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
