using MyCafeShop.ViewModels.BillDetailScreen;
using System.Windows;

namespace MyCafeShop.Views {
    /// <summary>
    /// Interaction logic for BillDetailView.xaml
    /// </summary>
    public partial class BillDetailView : Window
    {
        public BillDetailView(string billId)
        {
            InitializeComponent();
            this.DataContext = new BillDetailVM(billId);
        }
    }
}
