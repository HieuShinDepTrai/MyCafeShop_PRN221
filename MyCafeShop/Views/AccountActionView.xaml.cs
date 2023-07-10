using MyCafeShop.DAO.AccountsDao;
using MyCafeShop.ViewModels.AccountAction;
using System.Windows;

namespace MyCafeShop.Views {
    /// <summary>
    /// Interaction logic for AccountActionView.xaml
    /// </summary>
    public partial class AccountActionView : Window
    {
        public AccountActionView()
        {
            InitializeComponent();

            this.DataContext = new AccountActionVM();
        }

        public AccountActionView(AccountDTO account) {
            InitializeComponent();
            this.DataContext = new AccountActionVM(account);
        }


    }
}
