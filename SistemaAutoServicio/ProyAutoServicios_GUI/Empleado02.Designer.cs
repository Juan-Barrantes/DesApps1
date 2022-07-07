
namespace ProyAutoServicios_GUI
{
    partial class Empleado02
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.grpDatosEmpleado = new System.Windows.Forms.GroupBox();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.mskTelef = new System.Windows.Forms.MaskedTextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtDirec = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtApellidos = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtCodAg = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.cboDepartamento = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.cboProvincia = new System.Windows.Forms.ComboBox();
            this.label9 = new System.Windows.Forms.Label();
            this.cboDistrito = new System.Windows.Forms.ComboBox();
            this.grpDatosEmpleado.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpDatosEmpleado
            // 
            this.grpDatosEmpleado.Controls.Add(this.cboDistrito);
            this.grpDatosEmpleado.Controls.Add(this.label9);
            this.grpDatosEmpleado.Controls.Add(this.cboProvincia);
            this.grpDatosEmpleado.Controls.Add(this.label8);
            this.grpDatosEmpleado.Controls.Add(this.label7);
            this.grpDatosEmpleado.Controls.Add(this.cboDepartamento);
            this.grpDatosEmpleado.Controls.Add(this.comboBox1);
            this.grpDatosEmpleado.Controls.Add(this.btnCancelar);
            this.grpDatosEmpleado.Controls.Add(this.btnGuardar);
            this.grpDatosEmpleado.Controls.Add(this.mskTelef);
            this.grpDatosEmpleado.Controls.Add(this.label6);
            this.grpDatosEmpleado.Controls.Add(this.txtDirec);
            this.grpDatosEmpleado.Controls.Add(this.label5);
            this.grpDatosEmpleado.Controls.Add(this.txtApellidos);
            this.grpDatosEmpleado.Controls.Add(this.label4);
            this.grpDatosEmpleado.Controls.Add(this.txtNombre);
            this.grpDatosEmpleado.Controls.Add(this.label3);
            this.grpDatosEmpleado.Controls.Add(this.txtCodAg);
            this.grpDatosEmpleado.Controls.Add(this.label2);
            this.grpDatosEmpleado.Controls.Add(this.label1);
            this.grpDatosEmpleado.Location = new System.Drawing.Point(27, 28);
            this.grpDatosEmpleado.Name = "grpDatosEmpleado";
            this.grpDatosEmpleado.Size = new System.Drawing.Size(415, 538);
            this.grpDatosEmpleado.TabIndex = 1;
            this.grpDatosEmpleado.TabStop = false;
            this.grpDatosEmpleado.Text = "Datos;";
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(251, 482);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.TabIndex = 15;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(79, 482);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.TabIndex = 14;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // mskTelef
            // 
            this.mskTelef.Location = new System.Drawing.Point(140, 336);
            this.mskTelef.Mask = "999999999";
            this.mskTelef.Name = "mskTelef";
            this.mskTelef.Size = new System.Drawing.Size(151, 22);
            this.mskTelef.TabIndex = 13;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(31, 341);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(68, 17);
            this.label6.TabIndex = 12;
            this.label6.Text = "Telefono:";
            // 
            // txtDirec
            // 
            this.txtDirec.Location = new System.Drawing.Point(140, 167);
            this.txtDirec.Name = "txtDirec";
            this.txtDirec.Size = new System.Drawing.Size(217, 22);
            this.txtDirec.TabIndex = 11;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(31, 167);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 17);
            this.label5.TabIndex = 10;
            this.label5.Text = "Dirección:";
            // 
            // txtApellidos
            // 
            this.txtApellidos.Location = new System.Drawing.Point(140, 119);
            this.txtApellidos.Name = "txtApellidos";
            this.txtApellidos.Size = new System.Drawing.Size(217, 22);
            this.txtApellidos.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(28, 125);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 17);
            this.label4.TabIndex = 8;
            this.label4.Text = "Apellido:";
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(140, 80);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(217, 22);
            this.txtNombre.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(25, 80);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 17);
            this.label3.TabIndex = 6;
            this.label3.Text = "Nombre:";
            // 
            // txtCodAg
            // 
            this.txtCodAg.Location = new System.Drawing.Point(299, 34);
            this.txtCodAg.Name = "txtCodAg";
            this.txtCodAg.Size = new System.Drawing.Size(110, 22);
            this.txtCodAg.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(22, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(111, 17);
            this.label2.TabIndex = 4;
            this.label2.Text = "Codigo Agencia:";
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(22, 39);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 23);
            this.label1.TabIndex = 3;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "11",
            "12",
            "13",
            "14",
            "15",
            "16",
            "17",
            "18",
            "19",
            "20"});
            this.comboBox1.Location = new System.Drawing.Point(140, 39);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 24);
            this.comboBox1.TabIndex = 16;
            // 
            // cboDepartamento
            // 
            this.cboDepartamento.FormattingEnabled = true;
            this.cboDepartamento.Location = new System.Drawing.Point(140, 208);
            this.cboDepartamento.Name = "cboDepartamento";
            this.cboDepartamento.Size = new System.Drawing.Size(217, 24);
            this.cboDepartamento.TabIndex = 17;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(31, 214);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(106, 17);
            this.label7.TabIndex = 18;
            this.label7.Text = "Departamento :";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(34, 251);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(74, 17);
            this.label8.TabIndex = 19;
            this.label8.Text = "Provincia: ";
            // 
            // cboProvincia
            // 
            this.cboProvincia.FormattingEnabled = true;
            this.cboProvincia.Location = new System.Drawing.Point(140, 251);
            this.cboProvincia.Name = "cboProvincia";
            this.cboProvincia.Size = new System.Drawing.Size(217, 24);
            this.cboProvincia.TabIndex = 20;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(38, 289);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(60, 17);
            this.label9.TabIndex = 21;
            this.label9.Text = "Distrito :";
            // 
            // cboDistrito
            // 
            this.cboDistrito.FormattingEnabled = true;
            this.cboDistrito.Location = new System.Drawing.Point(140, 289);
            this.cboDistrito.Name = "cboDistrito";
            this.cboDistrito.Size = new System.Drawing.Size(217, 24);
            this.cboDistrito.TabIndex = 22;
            // 
            // Empleado02
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(463, 599);
            this.Controls.Add(this.grpDatosEmpleado);
            this.Name = "Empleado02";
            this.Text = "Insertar Empleado";
            this.Load += new System.EventHandler(this.Empleado02_Load);
            this.grpDatosEmpleado.ResumeLayout(false);
            this.grpDatosEmpleado.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        internal System.Windows.Forms.GroupBox grpDatosEmpleado;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.MaskedTextBox mskTelef;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtDirec;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtApellidos;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtCodAg;
        private System.Windows.Forms.Label label2;
        internal System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.ComboBox cboDepartamento;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.ComboBox cboProvincia;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cboDistrito;
    }
}