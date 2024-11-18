using System;
using System.Globalization;
using System.Windows.Data;

namespace TaskManager
{
    public class BoolToStatusConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            bool isCompleted = (bool)value;
            return isCompleted ? "Выполнена" : "Не выполнена";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value.ToString() == "Выполнена";
        }
    }
}
