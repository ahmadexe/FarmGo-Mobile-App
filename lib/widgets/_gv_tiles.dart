part of 'global_village_card.dart';

class _GVTiles extends StatelessWidget {
  final bool isBot; 
  const _GVTiles({required this.isBot});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(app.radius.lightCurve)),
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width * 0.44,
        color: fieldContrastDark,
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  isBot? 'assets/svgs/bot.svg' : 'assets/svgs/channels.svg',
                  height: 60,
                  width: 60,
                ),
              ),
              Expanded(child: Text(isBot? "Farmer Bot" : "Channels", style: app.text.t1b)),
            ],
          )
        )
      ),
    );
  }
}
