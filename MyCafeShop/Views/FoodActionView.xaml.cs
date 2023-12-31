﻿using MyCafeShop.DAO.FoodDao;
using MyCafeShop.ViewModels.AdminScreen;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MyCafeShop.Views
{
    /// <summary>
    /// Interaction logic for FoodActionView.xaml
    /// </summary>
    public partial class FoodActionView : Window
    {

        public FoodActionView() {
            InitializeComponent();
            this.DataContext = new FoodActionVM(null);
        }
        public FoodActionView(FoodDTO food)
        {
            InitializeComponent();
            this.DataContext = new FoodActionVM(food);
        }
    }
}
