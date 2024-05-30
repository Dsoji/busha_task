import 'package:codez/core/const/app_assets.dart';
import 'package:codez/core/widget/asset_item_widget.dart';
import 'package:codez/core/widget/news_card_widgets.dart';
import 'package:codez/core/widget/top_mover_widget.dart';
import 'package:codez/screens/transaction_list_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(ImageAssets.scan, height: 24, width: 24),
        title: const Text(
          'Explore',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _balanceSection(),
          const Divider(),
          _assetSection(),
          const Divider(),
          _topMoversSection(),
          const Divider(),
          _trendingNewsSection(),
          const Gap(50),
        ],
      ),
    );
  }

  Widget _balanceSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('My balance',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
              IconButton(
                icon: Icon(
                  _isVisible ? Icons.visibility : Icons.visibility_off,
                  size: 16,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 8.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: _isVisible ? '₦' : '',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: _isVisible ? '5,000' : '******',
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: _isVisible ? '.00' : '',
                  style: const TextStyle(
                    fontSize: 18.0, // Smaller font size for .00
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _assetSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My assets',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              Text('See all', style: TextStyle(color: Colors.green)),
            ],
          ),
          const Gap(8.0),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionListScreen(),
                ),
              );
            },
            child: const AssetItem(
              name: 'Bitcoin',
              price: '₦24,500.00',
              percentage: '+1.75%',
              image: ImageAssets.btc,
              abbrv: 'BTC',
            ),
          ),
          const AssetItem(
            name: 'Ethereum',
            price: '₦4,500.00',
            percentage: '-2.75%',
            image: ImageAssets.eth,
            abbrv: 'ETH',
          ),
          const AssetItem(
            name: 'Tezos',
            price: '₦4,500.00',
            percentage: '+3.00%',
            image: ImageAssets.xtz,
            abbrv: 'XTZ',
          ),
        ],
      ),
    );
  }

  Widget _topMoversSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today\'s Top Movers',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              Text('See all', style: TextStyle(color: Colors.green)),
            ],
          ),
          const Gap(8),
          SizedBox(
            height: 127,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                TopMoverItem(
                  name: 'Ethereum',
                  percentage: -1.75,
                  image: ImageAssets.eth,
                ),
                TopMoverItem(
                  name: 'Bitcoin',
                  percentage: 21.75,
                  image: ImageAssets.btc,
                ),
                TopMoverItem(
                  name: 'Solana',
                  percentage: 21.75,
                  image: ImageAssets.sol,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _trendingNewsSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trending news',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              Text('View more', style: TextStyle(color: Colors.green)),
            ],
          ),
          Gap(12.0),
          NewsCard(
            imageUrl: ImageAssets.musk, // Replace with your image URL
            title:
                'Ethereum Co-founder opposes El-Salvador Bitcoin Adoption policy',
            source: 'CoinDesk',
            time: '2h',
          ),
          Gap(8),
          Divider(),
          NewsCard2(
            imageUrl: ImageAssets.elon, // Replace with your image URL
            title:
                'Ethereum Co-founder opposes El-Salvador Bitcoin Adoption policy',
            source: 'CoinDesk',
            time: '2h',
          ),
          Divider(),
          NewsCard2(
            imageUrl: ImageAssets.elon, // Replace with your image URL
            title:
                'Ethereum Co-founder opposes El-Salvador Bitcoin Adoption policy',
            source: 'CoinDesk',
            time: '2h',
          ),
          Divider(),
          NewsCard2(
            imageUrl: ImageAssets.elon, // Replace with your image URL
            title:
                'Ethereum Co-founder opposes El-Salvador Bitcoin Adoption policy',
            source: 'CoinDesk',
            time: '2h',
          ),
        ],
      ),
    );
  }
}
