import 'package:flutter/material.dart';
import 'package:graphql_example/extensions/date_time_formats.dart';
import 'package:graphql_example/global/fonts.dart';
import 'package:graphql_example/models/repository_model.dart';

class RepoTile extends StatelessWidget {
  const RepoTile(this.repo, {super.key});

  final RepositoryModel repo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          repo.name ?? '',
          style: Fonts.regular15Black,
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('@${repo.ownerLogin}', style: Fonts.thinItalic15Black),
                Text(repo.primaryLanguage ?? '', style: Fonts.thinItalic15Black),
              ],
            ),
            Text(
              'Last edit: ${repo.pushedAt?.toFormattedString()}',
              style: Fonts.thinItalic15Black,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            repo.isStarredByUser ?? false
                ? const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : const Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                  ),
            Text(repo.starCount?.toString() ?? '0', style: Fonts.bold15White),
          ],
        ),
      ),
    );
  }
}
