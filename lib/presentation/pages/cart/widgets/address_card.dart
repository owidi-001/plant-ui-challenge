import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const radioGroup = 1;

    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          isThreeLine: true,
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading:
              Radio(value: 1, groupValue: radioGroup, onChanged: (value) {}),
          title: Text(
            "Home",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "(875) 876-875",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.grey),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Silicon valley, kenya",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.pencil)),
        ));
  }
}
