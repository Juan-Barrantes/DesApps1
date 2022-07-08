
namespace ProyAutoServicios_GUI
{
    partial class Empleado03
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
            this.cboAgencia = new System.Windows.Forms.ComboBox();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.cboCargo = new System.Windows.Forms.ComboBox();
            this.label11 = new System.Windows.Forms.Label();
            this.cboDistrito = new System.Windows.Forms.ComboBox();
            this.cboProvincia = new System.Windows.Forms.ComboBox();
            this.cboDepartamento = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.lblCod = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.btnCancelarAct = new System.Windows.Forms.Button();
            this.btnGuardarAct = new System.Windows.Forms.Button();
            this.mskTelef = new System.Windows.Forms.MaskedTextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtDirec = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtApellidos = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.grpDatosEmpleado.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpDatosEmpleado
            // 
            this.grpDatosEmpleado.Controls.Add(this.cboAgencia);
            this.grpDatosEmpleado.Controls.Add(this.txtEmail);
            this.grpDatosEmpleado.Controls.Add(this.label12);
            this.grpDatosEmpleado.Controls.Add(this.cboCargo);
            this.grpDatosEmpleado.Controls.Add(this.label11);
            this.grpDatosEmpleado.Controls.Add(this.cboDistrito);
            this.grpDatosEmpleado.Controls.Add(this.cboProvincia);
            this.grpDatosEmpleado.Controls.Add(this.cboDepartamento);
            this.grpDatosEmpleado.Controls.Add(this.label10);
            this.grpDatosEmpleado.Controls.Add(this.label9);
            this.grpDatosEmpleado.Controls.Add(this.label8);
            this.grpDatosEmpleado.Controls.Add(this.lblCod);
            this.grpDatosEmpleado.Controls.Add(this.label7);
            this.grpDatosEmpleado.Controls.Add(this.btnCancelarAct);
            this.grpDatosEmpleado.Controls.Add(this.btnGuardarAct);
            this.grpDatosEmpleado.Controls.Add(this.mskTelef);
            this.grpDatosEmpleado.Controls.Add(this.label6);
            this.grpDatosEmpleado.Controls.Add(this.txtDirec);
            this.grpDatosEmpleado.Controls.Add(this.label5);
            this.grpDatosEmpleado.Controls.Add(this.txtApellidos);
            this.grpDatosEmpleado.Controls.Add(this.label4);
            this.grpDatosEmpleado.Controls.Add(this.txtNombre);
            this.grpDatosEmpleado.Controls.Add(this.label3);
            this.grpDatosEmpleado.Controls.Add(this.label2);
            this.grpDatosEmpleado.Controls.Add(this.label1);
            this.grpDatosEmpleado.Location = new System.Drawing.Point(25, 12);
            this.grpDatosEmpleado.Name = "grpDatosEmpleado";
            this.grpDatosEmpleado.Size = new System.Drawing.Size(796, 427);
            this.grpDatosEmpleado.TabIndex = 2;
            this.grpDatosEmpleado.TabStop = false;
            this.grpDatosEmpleado.Text = "Datos;";
            // 
            // cboAgencia
            // 
            this.cboAgencia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboAgencia.FormattingEnabled = true;
            this.cboAgencia.Location = new System.Drawing.Point(170, 76);
            this.cboAgencia.Name = "cboAgencia";
            this.cboAgencia.Size = new System.Drawing.Size(253, 24);
            this.cboAgencia.TabIndex = 26;
            this.cboAgencia.SelectionChangeCommitted += new System.EventHandler(this.cboAgencia_SelectionChangeCommitted);
            // 
            // txtEmail
            // 
            this.txtEmail.Location = new System.Drawing.Point(530, 344);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(175, 22);
            this.txtEmail.TabIndex = 25;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(454, 343);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(42, 17);
            this.label12.TabIndex = 24;
            this.label12.Text = "Email";
            // 
            // cboCargo
            // 
            this.cboCargo.FormattingEnabled = true;
            this.cboCargo.Items.AddRange(new object[] {
            "--seleccionar--",
            "atención al cliente",
            "Administrador"});
            this.cboCargo.Location = new System.Drawing.Point(530, 295);
            this.cboCargo.Name = "cboCargo";
            this.cboCargo.Size = new System.Drawing.Size(175, 24);
            this.cboCargo.TabIndex = 23;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(451, 295);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(46, 17);
            this.label11.TabIndex = 22;
            this.label11.Text = "Cargo";
            // 
            // cboDistrito
            // 
            this.cboDistrito.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboDistrito.FormattingEnabled = true;
            this.cboDistrito.Location = new System.Drawing.Point(167, 343);
            this.cboDistrito.Name = "cboDistrito";
            this.cboDistrito.Size = new System.Drawing.Size(227, 24);
            this.cboDistrito.TabIndex = 21;
            // 
            // cboProvincia
            // 
            this.cboProvincia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboProvincia.FormattingEnabled = true;
            this.cboProvincia.Location = new System.Drawing.Point(167, 288);
            this.cboProvincia.Name = "cboProvincia";
            this.cboProvincia.Size = new System.Drawing.Size(227, 24);
            this.cboProvincia.TabIndex = 21;
            this.cboProvincia.SelectionChangeCommitted += new System.EventHandler(this.cboProvincia_SelectionChangeCommitted);
            // 
            // cboDepartamento
            // 
            this.cboDepartamento.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboDepartamento.FormattingEnabled = true;
            this.cboDepartamento.Location = new System.Drawing.Point(167, 226);
            this.cboDepartamento.Name = "cboDepartamento";
            this.cboDepartamento.Size = new System.Drawing.Size(227, 24);
            this.cboDepartamento.TabIndex = 21;
            this.cboDepartamento.SelectionChangeCommitted += new System.EventHandler(this.cboDepartamento_SelectionChangeCommitted);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(55, 350);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(52, 17);
            this.label10.TabIndex = 20;
            this.label10.Text = "Distrito";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(57, 295);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(66, 17);
            this.label9.TabIndex = 19;
            this.label9.Text = "Provincia";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(55, 235);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(98, 17);
            this.label8.TabIndex = 18;
            this.label8.Text = "Departamento";
            // 
            // lblCod
            // 
            this.lblCod.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblCod.Location = new System.Drawing.Point(167, 43);
            this.lblCod.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblCod.Name = "lblCod";
            this.lblCod.Size = new System.Drawing.Size(85, 24);
            this.lblCod.TabIndex = 17;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(52, 44);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(56, 17);
            this.label7.TabIndex = 16;
            this.label7.Text = "Codigo:";
            // 
            // btnCancelarAct
            // 
            this.btnCancelarAct.Location = new System.Drawing.Point(457, 398);
            this.btnCancelarAct.Name = "btnCancelarAct";
            this.btnCancelarAct.Size = new System.Drawing.Size(75, 23);
            this.btnCancelarAct.TabIndex = 15;
            this.btnCancelarAct.Text = "Cancelar";
            this.btnCancelarAct.UseVisualStyleBackColor = true;
            this.btnCancelarAct.Click += new System.EventHandler(this.btnCancelarAct_Click);
            // 
            // btnGuardarAct
            // 
            this.btnGuardarAct.Location = new System.Drawing.Point(319, 398);
            this.btnGuardarAct.Name = "btnGuardarAct";
            this.btnGuardarAct.Size = new System.Drawing.Size(75, 23);
            this.btnGuardarAct.TabIndex = 14;
            this.btnGuardarAct.Text = "Guardar";
            this.btnGuardarAct.UseVisualStyleBackColor = true;
            this.btnGuardarAct.Click += new System.EventHandler(this.btnGuardarAct_Click);
            // 
            // mskTelef
            // 
            this.mskTelef.Location = new System.Drawing.Point(530, 235);
            this.mskTelef.Mask = "999999999";
            this.mskTelef.Name = "mskTelef";
            this.mskTelef.Size = new System.Drawing.Size(124, 22);
            this.mskTelef.TabIndex = 13;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(448, 241);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(68, 17);
            this.label6.TabIndex = 12;
            this.label6.Text = "Telefono:";
            // 
            // txtDirec
            // 
            this.txtDirec.Location = new System.Drawing.Point(167, 173);
            this.txtDirec.Name = "txtDirec";
            this.txtDirec.Size = new System.Drawing.Size(604, 22);
            this.txtDirec.TabIndex = 11;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(54, 173);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 17);
            this.label5.TabIndex = 10;
            this.label5.Text = "Dirección:";
            // 
            // txtApellidos
            // 
            this.txtApellidos.Location = new System.Drawing.Point(510, 122);
            this.txtApellidos.Name = "txtApellidos";
            this.txtApellidos.Size = new System.Drawing.Size(261, 22);
            this.txtApellidos.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(442, 128);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 17);
            this.label4.TabIndex = 8;
            this.label4.Text = "Apellido:";
            // 
            // txtNombre
            // 
            this.txtNombre.Location = new System.Drawing.Point(167, 125);
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(256, 22);
            this.txtNombre.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(52, 125);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 17);
            this.label3.TabIndex = 6;
            this.label3.Text = "Nombre:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(52, 81);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 17);
            this.label2.TabIndex = 4;
            this.label2.Text = "Agencia:";
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(22, 39);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 23);
            this.label1.TabIndex = 3;
            // 
            // Empleado03
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(833, 451);
            this.Controls.Add(this.grpDatosEmpleado);
            this.Name = "Empleado03";
            this.Text = "Actualizar Empleado";
            this.Load += new System.EventHandler(this.Empleado03_Load);
            this.grpDatosEmpleado.ResumeLayout(false);
            this.grpDatosEmpleado.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        internal System.Windows.Forms.GroupBox grpDatosEmpleado;
        internal System.Windows.Forms.Label lblCod;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button btnCancelarAct;
        private System.Windows.Forms.Button btnGuardarAct;
        private System.Windows.Forms.MaskedTextBox mskTelef;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtDirec;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtApellidos;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        internal System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cboCargo;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.ComboBox cboDistrito;
        private System.Windows.Forms.ComboBox cboProvincia;
        private System.Windows.Forms.ComboBox cboDepartamento;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.ComboBox cboAgencia;
    }
}