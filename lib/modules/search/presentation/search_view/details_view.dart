import 'package:clubhub_app/modules/search/model/user_results.dart';
import 'package:clubhub_app/modules/search/presentation/widgets/details_card.dart';
import 'package:clubhub_app/modules/search/presentation/widgets/title_section.dart';
import 'package:clubhub_app/theme/linear_gradient.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    required this.userDetail,
    Key? key,
  }) : super(key: key);
  final Result userDetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradientBackground.getBlueGrey(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const TitleSection(title: 'User Details'),
              DetailsCard(
                title: 'Name: ${userDetail.name.first} ${userDetail.name.last}',
                subtitle: 'Email: ${userDetail.email}',
              ),
              DetailsCard(
                title: 'Phone: ${userDetail.phone}',
                subtitle: '${userDetail.gender}',
              ),
              DetailsCard(
                title: 'Country: ${userDetail.location.country}',
                subtitle: 'City: ${userDetail.location.city}',
              ),
              DetailsCard(
                title: 'Date of birth: ${userDetail.registered.date}',
                subtitle: 'Age: ${userDetail.registered.age}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
