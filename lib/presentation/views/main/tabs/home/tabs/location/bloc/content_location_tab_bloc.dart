import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'content_location_tab_event.dart';

part 'content_location_tab_state.dart';

class ContentLocationTabBloc
    extends Bloc<ContentLocationTabEvent, ContentLocationTabState> {
  ContentLocationTabBloc() : super(ContentLocationTabInitial()) {
    on<ShowWebViewEvent>((event, _) => _launchWebView(event));
    on<ShowTelPhoneEvent>((event, _) => _makePhoneCall(event));
  }

  void _launchWebView(ShowWebViewEvent event) async {
    final Uri url = event.url;

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void _makePhoneCall(ShowTelPhoneEvent event) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: event.phoneNumber,
    );

    await launchUrl(launchUri);
  }
}
