using System;
using System.ComponentModel;

namespace TaskManager
{
    public class TaskModel : INotifyPropertyChanged
    {
        private string title;
        private string description;
        private string priority;
        private bool isCompleted;
        private DateTime createdDate;
        private DateTime? completedDate;

        public string Title
        {
            get => title;
            set
            {
                title = value;
                OnPropertyChanged(nameof(Title));
            }
        }

        public string Description
        {
            get => description;
            set
            {
                description = value;
                OnPropertyChanged(nameof(Description));
            }
        }

        public string Priority
        {
            get => priority;
            set
            {
                priority = value;
                OnPropertyChanged(nameof(Priority));
            }
        }

        public bool IsCompleted
        {
            get => isCompleted;
            set
            {
                isCompleted = value;
                OnPropertyChanged(nameof(IsCompleted));
                OnPropertyChanged(nameof(DisplayCompletionDate));
            }
        }

        public DateTime CreatedDate
        {
            get => createdDate;
            set
            {
                createdDate = value;
                OnPropertyChanged(nameof(CreatedDate));
            }
        }

        public DateTime? CompletedDate
        {
            get => completedDate;
            set
            {
                completedDate = value;
                OnPropertyChanged(nameof(CompletedDate));
                OnPropertyChanged(nameof(DisplayCompletionDate));
            }
        }

        public string DisplayCompletionDate => IsCompleted ? CompletedDate?.ToString("g") : "Не завершена";

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
