# Flutter generic type problem

Showcase of error using generic type in function.
It is needed to pass the type function further to make it working.
There are no warnings, no errors during compilation, it is not so easy to spot.

# Not working example:

```
class ManagementListNotWorking<T> extends StatefulWidget {
  final Widget Function(T item) someBuilder;
  final List<T> items;

  ManagementListNotWorking({
    @required this.items,
    @required this.someBuilder,
  });

  @override
  State<StatefulWidget> createState() => _ManagementListNotWorkingState();
}

class _ManagementListNotWorkingState extends State<ManagementListNotWorking> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return widget.someBuilder(widget.items.first);
        },
      ),
    );
  }
}
```

# Working example:

```
class ManagementList<T> extends StatefulWidget {
  final Widget Function(T item) someBuilder;
  final List<T> items;

  ManagementList({
    @required this.items,
    @required this.someBuilder,
  });

  @override
  State<StatefulWidget> createState() => _ManagementListState<T>();
}

class _ManagementListState<T> extends State<ManagementList<T>> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return widget.someBuilder(widget.items.first);
        },
      ),
    );
  }
}
```
