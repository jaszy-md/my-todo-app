import 'package:flutter/material.dart';
import 'package:my_todo_app/controllers/todo_controller.dart';

class TodoPage extends StatelessWidget {
  final List items;
  final Function(String id) onDelete;
  final Function(Map item) onEdit;

  const TodoPage({
    super.key,
    required this.items,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Todo', style: TextStyle(color: Colors.lightBlue)),
        ),
      ),
      body:
          items.isEmpty
              ? Center(
                child: Text(
                  'No todo items',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
              : ListView.builder(
                itemCount: items.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final item = items[index] as Map;
                  final id = item['_id'] as String;

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(item['title']),
                      subtitle: Text(item['description']),
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'edit') {
                            onEdit(item);
                          } else if (value == 'delete') {
                            onDelete(id);
                          }
                        },
                        itemBuilder:
                            (context) => const [
                              PopupMenuItem(value: 'edit', child: Text('Edit')),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
