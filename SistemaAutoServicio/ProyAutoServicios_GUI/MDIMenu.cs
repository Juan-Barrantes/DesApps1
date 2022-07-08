using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyAutoServicios_GUI
{
    public partial class MDIMenu : Form
    {
        public MDIMenu()
        {
            InitializeComponent();
        }

        private void MDIPrincipal_Resize(object sender, EventArgs e)
        {
            this.Refresh();
        }

        private void clientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 obj01 = new Form1();
            obj01.MdiParent = this;
            obj01.Show();
        }

        private void serviciosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 obj03 = new Form1();
            obj03.MdiParent = this;
            obj03.Show();
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void empleadosToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            Empleado01 obj02 = new Empleado01();
            obj02.MdiParent = this;
            obj02.Show();
        }

        private void clientesToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            Cliente01 objCli01 = new Cliente01();
            objCli01.MdiParent = this;
            objCli01.Show();
        }

        private void serviciosToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            Servicio01 objSer01 = new Servicio01();
            objSer01.MdiParent = this;
            objSer01.Show();
        }

        private void MDIMenu_Load(object sender, EventArgs e)
        {
            ///mostramos al usuario logeado
            lblUsuario.Text = "Usuario: "+clsCredenciales.Usuario;

            //manejamos la autorizacion
            if(clsCredenciales.Nivel == 1)
            {
                mantenimientosToolStripMenuItem.Visible = true;
                reportesToolStripMenuItem.Visible = true;
                salirToolStripMenuItem.Visible = true;
            }else if(clsCredenciales.Nivel == 2)
            {
                mantenimientosToolStripMenuItem.Visible = false;
                reportesToolStripMenuItem.Visible = true;
                salirToolStripMenuItem.Visible = true;
            }
        }

        private void salirToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void MDIMenu_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult vrpta;
            vrpta = MessageBox.Show("¿Seguro de salir de la aplicación", "Confirmar",
                MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (vrpta == DialogResult.No)
            {
                e.Cancel = true;
            }
        }

        private void MDIMenu_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
