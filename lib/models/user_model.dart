class User {
  final String id;
  final String name;
  final String surname;
  final String imageUrl;

  const User({
    required this.id,
    required this.name,
    required this.surname,
    required this.imageUrl,
  });

  static const List<User> users = [
    User(
        id: '1',
        name: 'Subham',
        surname: 'paul',
        imageUrl: 'https://source.unsplash.com/400x500/?blogs'),
    User(
        id: '2',
        name: 'Harsh',
        surname: 'raj',
        imageUrl:
            'https://images.unsplash.com/photo-1610397962076-02407a169a5b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=700&ixid=MnwxfDB8MXxyYW5kb218MHx8ZnJ1aXR8fHx8fHwxNjg0MjE3MjE3&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=900 '),
    User(
        id: '3',
        name: 'Vishal',
        surname: 'Sharma',
        imageUrl: 'https://source.unsplash.com/400x500/?nature'),
    User(
        id: '3',
        name: 'Soa ',
        surname: 'Friends',
        imageUrl: 'https://source.unsplash.com/400x500/?god'),
    User(
        id: '4',
        name: 'Biswajit',
        surname: 'nanda',
        imageUrl: 'https://source.unsplash.com/400x500/?coding'),
    User(
        id: '5',
        name: 'jitun',
        surname: '',
        imageUrl: 'https://source.unsplash.com/400x500/?salman'),
    User(
        id: '6',
        name: 'subham 2',
        surname: '',
        imageUrl: 'https://source.unsplash.com/400x500/?motivational'),
    User(
        id: '7',
        name: 'Innovation ',
        surname: 'Nit',
        imageUrl: 'https://source.unsplash.com/400x500/?user'),
  ];
}
