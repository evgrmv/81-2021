using System;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;

namespace TaskManager
{
    public partial class MainWindow : Window
    {
        public ObservableCollection<TaskModel> Tasks { get; set; }

        public MainWindow()
        {
            InitializeComponent();
            Tasks = new ObservableCollection<TaskModel>();
            TaskList.ItemsSource = Tasks;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TitleBox.Text))
            {
                var newTask = new TaskModel
                {
                    Title = TitleBox.Text,
                    Description = DescriptionBox.Text,
                    Priority = ((ComboBoxItem)PriorityCombo.SelectedItem)?.Content.ToString(),
                    IsCompleted = false,
                    CreatedDate = DateTime.Now,
                    CompletedDate = null
                };
                Tasks.Add(newTask);
                TitleBox.Clear();
                DescriptionBox.Clear();
            }
            else
            {
                MessageBox.Show("Пожалуйста, введите название задачи.");
            }
        }

        private void MarkAsCompleted_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                var task = button.CommandParameter as TaskModel;
                if (task != null)

                {
                    task.IsCompleted = true; // Изменяем статус задачи на выполненный
                    task.CompletedDate = DateTime.Now; // Устанавливаем дату завершения
                    TaskList.Items.Refresh(); // Обновляем список
                }
            }
        }
    }
}
