import 'package:flutter/material.dart';
import 'package:graphql_example/controllers/user_controller.dart';
import 'package:graphql_example/extensions/date_time_formats.dart';
import 'package:graphql_example/global/fonts.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _userController = UserController();

  @override
  void initState() {
    super.initState();
    _userController.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User profile")),
      body: ListenableBuilder(
        listenable: _userController,
        builder: (context, child) {
          final bio = _userController.user?.bio;
          final location = _userController.user?.location;
          final company = _userController.user?.company;
          final email = _userController.user?.email;
          final followers = _userController.user?.followersCount;
          final memberSince = _userController.user?.createdAt;

          return _userController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : _userController.user != null
                  ? Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                foregroundImage: NetworkImage(
                                    _userController.user?.avatarUrl ?? ''),
                                radius: 76,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    _userController.user?.name ?? '',
                                    style: Fonts.regular15Black,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '@${_userController.user?.login ?? ''}',
                                    style: Fonts.regular15Black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text('Bio: ', style: Fonts.regular15Black),
                              Text(
                                bio == null || bio.isEmpty ? 'none' : bio,
                                style: bio == null || bio.isEmpty
                                    ? Fonts.thinItalic15Black
                                    : Fonts.regular15Black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text('Location: ',
                                  style: Fonts.regular15Black),
                              Text(
                                location == null || location.isEmpty
                                    ? 'none'
                                    : location,
                                style: location == null || location.isEmpty
                                    ? Fonts.thinItalic15Black
                                    : Fonts.regular15Black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text('Company: ',
                                  style: Fonts.regular15Black),
                              Text(
                                company == null || company.isEmpty
                                    ? 'none'
                                    : company,
                                style: company == null || company.isEmpty
                                    ? Fonts.thinItalic15Black
                                    : Fonts.regular15Black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text('Email: ',
                                  style: Fonts.regular15Black),
                              Text(
                                email == null || email.isEmpty ? 'none' : email,
                                style: email == null || email.isEmpty
                                    ? Fonts.thinItalic15Black
                                    : Fonts.regular15Black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text('Followers: ',
                                  style: Fonts.regular15Black),
                              Text(
                                followers?.toString() ?? '0',
                                style: Fonts.regular15Black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Text('Member since: ',
                                  style: Fonts.regular15Black),
                              Text(
                                memberSince == null
                                    ? 'unknown'
                                    : memberSince.toFormattedString(),
                                style: memberSince == null
                                    ? Fonts.thinItalic15Black
                                    : Fonts.regular15Black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    )
                  : Text(_userController.errorMessage ?? "No user found");
        },
      ),
    );
  }
}
