import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late W3MService  _w3mService;
  @override
  void initState() {
    super.initState();
    initalizeState();
  }

  void initalizeState() async {
    _w3mService = W3MService(
      projectId: '62c8eaca39c29a52da1d714e6bb1df02',
      metadata: const PairingMetadata(
        name: 'Web3Modal Flutter Example',
        description: 'Web3Modal Flutter Example',
        url: 'https://www.walletconnect.com/',
        icons: ['https://walletconnect.com/walletconnect-logo.png'],
        redirect: Redirect(
          native: 'w3m://',
          universal: 'https://www.walletconnect.com',
        ),
      ),
    );
    await _w3mService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        W3MConnectWalletButton(service: _w3mService),
        const SizedBox(height: 16),
        W3MNetworkSelectButton(service: _w3mService),
        const SizedBox(height: 16),
        W3MAccountButton(service: _w3mService)
      ],
    );
  }
}
