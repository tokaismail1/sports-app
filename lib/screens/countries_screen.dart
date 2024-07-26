import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/cubits/cubit/cubit.dart';
import 'package:sportsapp/cubits/cubit/state.dart';
import 'package:sportsapp/models/country_response_model.dart';
import 'package:sportsapp/screens/home_screen.dart';
import 'package:sportsapp/screens/leagues_screen.dart';
import 'package:sportsapp/screens/login_screen.dart';
import 'package:sportsapp/service/country_response_repo.dart';
import 'package:dio/dio.dart';
//import 'package:sportsapp/widgets/Card.dart';

class CountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF352F44),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 10),
                Text(
                  'Sports App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.login, color: Colors.white),
                  onPressed: () {
                       Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
                  },
                ),
              ],
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFF352F44),
      body: BlocProvider(
        create: (context) => GetDataCubit(CountryResponseRepo())..getCountries(),
        child: BlocBuilder<GetDataCubit, GetDataState>(
          builder: (context, state) {
            if (state is GetDataLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetDataError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is GetDataSuccess) {
              return ListView.builder(
                itemCount: state.countryResponse.result.length,
                itemBuilder: (context, index) {
                  final country = state.countryResponse.result[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF5C5470),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: country.countryLogo != null
                              ? Image.network(
                                  country.countryLogo!,
                                  fit: BoxFit.contain,
                                )
                              : null,
                        ),
                      ),
                      title: Text(
                        country.countryName,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        country.countryIso2 ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeaguesScreen(country: country),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No countries found'));
            }
          },
        ),
      ),
     floatingActionButton: FloatingActionButton(
        onPressed: (
          
        ) {},
        backgroundColor: Colors.white,
    
        child: Icon(Icons.location_on),
      ),
    );
    
  }
}

