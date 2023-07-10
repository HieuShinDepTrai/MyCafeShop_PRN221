﻿using DocumentFormat.OpenXml.Presentation;
using MyCafeShop.DAO.BillDao;
using MyCafeShop.ViewModels.ManagerScreen;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for BillManagerView.xaml
    /// </summary>
    public partial class BillView : Window
    {
        public BillView()
        {
            InitializeComponent();
            this.DataContext = new BillViewVM();
        }

    }
}
