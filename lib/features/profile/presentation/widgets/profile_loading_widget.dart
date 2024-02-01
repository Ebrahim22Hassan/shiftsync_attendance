import 'package:flutter/material.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSkeleton(),
            const SizedBox(height: 20),
            _buildMainInfoSkeleton(),
            const SizedBox(height: 20),
            _buildInfoDetailsSkeleton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSkeleton() {
    return Container(
      height: 200,
      color: Colors.grey[300],
    );
  }

  Widget _buildMainInfoSkeleton() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            width: 200,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 5),
          Container(
            height: 15,
            width: 150,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoDetailsSkeleton() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.email, color: Colors.grey),
                title: Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey[300],
                ),
                subtitle: Container(
                  height: 15,
                  width: 200,
                  color: Colors.grey[300],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.grey),
                title: Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey[300],
                ),
                subtitle: Container(
                  height: 15,
                  width: 150,
                  color: Colors.grey[300],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.grey),
                title: Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey[300],
                ),
                subtitle: Container(
                  height: 15,
                  width: 250,
                  color: Colors.grey[300],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.my_location, color: Colors.grey),
                title: Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey[300],
                ),
                subtitle: Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}