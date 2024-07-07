import 'package:flutter/material.dart';
import 'package:graphql_example/controllers/user_repos_controller.dart';
import 'package:graphql_example/pages/home_page/widgets/repo_tile.dart';

class UserResultWidget extends StatefulWidget {
  const UserResultWidget({super.key});

  @override
  State<UserResultWidget> createState() => _UserResultWidgetState();
}

class _UserResultWidgetState extends State<UserResultWidget> {
  late UserReposController _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = UserReposController();
    _scrollController.addListener(_scrollListener);
    _controller.fetchRepositories();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _controller.fetchRepositories();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        if (_controller.isLoading && _controller.repositories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (_controller.errorMessage != null) {
          return Center(child: Text(_controller.errorMessage!));
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount: _controller.repositories.length +
                (_controller.hasNextPage ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _controller.repositories.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return RepoTile(_controller.repositories[index]);
            },
          );
        }
      },
    );
  }
}
