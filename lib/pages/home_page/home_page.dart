import 'package:flutter/material.dart';
import 'package:graphql_example/controllers/user_controller.dart';
import 'package:graphql_example/database/repositories/credentials_repository.dart';
import 'package:graphql_example/extensions/int_to_duration.dart';
import 'package:graphql_example/generated/l10n.dart';
import 'package:graphql_example/pages/auth_page/auth_page.dart';
import 'package:graphql_example/pages/home_page/widgets/search_result_widget.dart';
import 'package:graphql_example/pages/home_page/widgets/user_result_widget.dart';
import 'package:graphql_example/pages/user_profile_page/user_profile_page.dart';
import 'package:graphql_example/util/debouncer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userController = UserController();
  final _searchController = TextEditingController();
  final _searchText = ValueNotifier<String>('');
  late final _searchDebouncer = Debouncer(_onSearch);

  @override
  void initState() {
    super.initState();
    _userController.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(S.of(context).areYouSureYouWantToSignOut),
              actions: [
                TextButton(
                    onPressed: Navigator.of(context).maybePop,
                    child: Text(S.of(context).no)),
                TextButton(
                    onPressed: () {
                      CredentialsRepository().clear();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const AuthPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(S.of(context).yes)),
              ],
            ),
          ),
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ),
        title: ListenableBuilder(
            listenable: _searchController,
            builder: (context, _) {
              return SearchBar(
                controller: _searchController,
                onChanged: (_) => _searchDebouncer.start(200.miliseconds),
                hintText: S.of(context).search,
                elevation: const WidgetStatePropertyAll(1),
                constraints: const BoxConstraints(maxWidth: 200, maxHeight: 24),
                trailing: _searchController.text.isEmpty
                    ? const [Icon(Icons.search)]
                    : [
                        IconButton(
                          alignment: AlignmentDirectional.centerStart,
                          padding: const EdgeInsets.only(bottom: 10, left: 40),
                          onPressed: () {
                            _searchController.clear();
                            _searchText.value = '';
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ],
              );
            }),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserProfilePage(),
              ),
            ),
            child: ListenableBuilder(
                listenable: _userController,
                builder: (context, _) {
                  return _userController.isLoading
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            foregroundImage: NetworkImage(
                                _userController.user?.avatarUrl ?? ''),
                            maxRadius: 15,
                          ),
                        );
                }),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _searchText,
        builder: (context, _, __) => _searchText.value.isEmpty
            ? const UserResultWidget()
            : SearchResultWidget(_searchText.value),
      ),
    );
  }

  void _onSearch() => _searchText.value = _searchController.text;
}
