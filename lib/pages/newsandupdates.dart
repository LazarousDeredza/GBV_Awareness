import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class NewsUpdatesPage extends StatefulWidget {
  const NewsUpdatesPage({super.key});

  @override
  State<NewsUpdatesPage> createState() => _NewsUpdatesPageState();
}

class _NewsUpdatesPageState extends State<NewsUpdatesPage> {
  final ScrollController scrollController = ScrollController();

  bool loading = false;
  bool loadingMore = false;

  String? errorMessage;

  int currentFeedIndex = 0;

  List<Map<String, dynamic>> allNews = [];

  final List<Map<String, String>> feeds = [
    {"name": "Kenya News Agency", "url": "https://kenyanews.go.ke/feed/"},

    {"name": "KBC", "url": "https://www.kbc.co.ke/feed/"},

    {"name": "Nation Africa", "url": "https://nation.africa/kenya/rss"},

    {"name": "Capital FM", "url": "https://www.capitalfm.co.ke/feed/"},

    {"name": "UN Women", "url": "https://www.unwomen.org/en/news-stories/rss"},
  ];

  @override
  void initState() {
    super.initState();

    fetchNextFeed();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 300 &&
          !loadingMore &&
          currentFeedIndex < feeds.length) {
        fetchNextFeed();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  Future<void> refreshNews() async {
    setState(() {
      allNews.clear();

      currentFeedIndex = 0;

      errorMessage = null;
    });

    await fetchNextFeed();
  }

  Future<void> fetchNextFeed() async {
    if (currentFeedIndex >= feeds.length) {
      return;
    }

    setState(() {
      loading = true;
      loadingMore = true;
    });

    final feed = feeds[currentFeedIndex];

    try {
      final response = await http.get(Uri.parse(feed["url"]!));

      if (response.statusCode == 200) {
        try {
          final rssFeed = RssFeed.parse(response.body);

          final items = rssFeed.items ?? [];

          List<Map<String, dynamic>> fetchedNews = [];

          for (var item in items.take(10)) {
            try {
              fetchedNews.add({
                "source": feed["name"],

                "title": safeText(item.title, "No title"),

                "description": cleanHtml(
                  safeText(item.description, "No description available."),
                ),

                "date": item.pubDate,

                "link": safeText(item.link, ""),
              });
            } catch (e) {
              fetchedNews.add({
                "source": feed["name"],

                "title": "Unable to decode article",

                "description":
                    "Some article data could not be processed safely.",

                "date": DateTime.now(),

                "link": "",
              });
            }
          }

          setState(() {
            allNews.addAll(fetchedNews);

            allNews.sort((a, b) {
              final aDate = parseDate(a["date"]);
              final bDate = parseDate(b["date"]);

              return bDate.compareTo(aDate);
            });
          });
        } catch (e) {
          setState(() {
            errorMessage = "Some news data could not be decoded properly.";
          });
        }
      } else {
        setState(() {
          errorMessage = "Failed to load ${feed["name"]} news.";
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Network error while loading ${feed["name"]}.";
      });
    } finally {
      currentFeedIndex++;

      setState(() {
        loading = false;
        loadingMore = false;
      });
    }
  }

  String safeText(dynamic value, String fallback) {
    try {
      if (value == null) {
        return fallback;
      }

      return value.toString();
    } catch (e) {
      return fallback;
    }
  }

  String cleanHtml(String html) {
    try {
      return html
          .replaceAll(RegExp(r'<[^>]*>'), '')
          .replaceAll("&nbsp;", " ")
          .replaceAll("&#8217;", "'")
          .replaceAll("&amp;", "&")
          .trim();
    } catch (e) {
      return "Unable to display article description.";
    }
  }

  DateTime parseDate(dynamic date) {
    try {
      if (date is DateTime) {
        return date;
      }

      return DateTime.parse(date.toString());
    } catch (e) {
      return DateTime.now();
    }
  }

  String formatDate(dynamic date) {
    try {
      final parsedDate = parseDate(date);

      return "${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";
    } catch (e) {
      return "Unknown date";
    }
  }

  Future<void> openArticle(String url) async {
    try {
      final Uri uri = Uri.parse(url.trim());

      log("Opening >>>>>>>>> : $uri");

      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      showError("Could not open browser: $e");
    }
  }

  void showError(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("News & Updates"), centerTitle: true),

      body: RefreshIndicator(
        onRefresh: refreshNews,

        child: Column(
          children: [
            if (errorMessage != null)
              Container(
                width: double.infinity,

                margin: const EdgeInsets.all(15),

                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.red.withValues(red: .1),

                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),

            Expanded(
              child: allNews.isEmpty && loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      controller: scrollController,

                      padding: const EdgeInsets.all(20),

                      itemCount: allNews.length + (loadingMore ? 1 : 0),

                      itemBuilder: (context, index) {
                        if (index == allNews.length) {
                          return const Padding(
                            padding: EdgeInsets.all(20),

                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final news = allNews[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 15),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),

                            onTap: () {
                              openArticle(news["link"]);
                            },

                            child: Padding(
                              padding: const EdgeInsets.all(18),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.purple
                                            .withOpacity(0.1),

                                        child: const Icon(
                                          Icons.newspaper,

                                          color: Colors.purple,
                                        ),
                                      ),

                                      const SizedBox(width: 12),

                                      Expanded(
                                        child: Text(
                                          news["title"],

                                          style: const TextStyle(
                                            fontSize: 18,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 15),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.public,
                                        size: 16,
                                        color: Colors.grey,
                                      ),

                                      const SizedBox(width: 5),

                                      Expanded(
                                        child: Text(
                                          news["source"],

                                          style: const TextStyle(
                                            color: Colors.grey,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    formatDate(news["date"]),

                                    style: const TextStyle(
                                      color: Colors.grey,

                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  Text(
                                    news["description"],

                                    maxLines: 4,

                                    overflow: TextOverflow.ellipsis,

                                    style: const TextStyle(height: 1.5),
                                  ),

                                  const SizedBox(height: 15),

                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      Text(
                                        "Read More",

                                        style: TextStyle(
                                          color: Colors.purple,

                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(width: 5),

                                      Icon(
                                        Icons.arrow_forward,

                                        size: 18,

                                        color: Colors.purple,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
