
namespace ProyAutoServicios_GUI
{
    partial class Cliente02
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.mskTelf = new System.Windows.Forms.MaskedTextBox();
            this.cboDistrito = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cboProvincia = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cboDepartamento = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cboTipoDoc = new System.Windows.Forms.ComboBox();
            this.txtDoc = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtDir = new System.Windows.Forms.TextBox();
            this.btnGrabar = new System.Windows.Forms.Button();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.txtApe = new System.Windows.Forms.TextBox();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.chkEstado = new System.Windows.Forms.CheckBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.chkEstado);
            this.groupBox1.Controls.Add(this.mskTelf);
            this.groupBox1.Controls.Add(this.cboDistrito);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.cboProvincia);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.cboDepartamento);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.cboTipoDoc);
            this.groupBox1.Controls.Add(this.txtDoc);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.txtDir);
            this.groupBox1.Controls.Add(this.btnGrabar);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.txtApe);
            this.groupBox1.Controls.Add(this.txtNom);
            this.groupBox1.Controls.Add(this.label12);
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.label14);
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Location = new System.Drawing.Point(13, 26);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox1.Size = new System.Drawing.Size(781, 346);
            this.groupBox1.TabIndex = 12;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Datos";
            // 
            // mskTelf
            // 
            this.mskTelf.Location = new System.Drawing.Point(581, 173);
            this.mskTelf.Mask = "999999999";
            this.mskTelf.Name = "mskTelf";
            this.mskTelf.Size = new System.Drawing.Size(103, 22);
            this.mskTelf.TabIndex = 19;
            // 
            // cboDistrito
            // 
            this.cboDistrito.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboDistrito.FormattingEnabled = true;
            this.cboDistrito.Location = new System.Drawing.Point(140, 264);
            this.cboDistrito.Name = "cboDistrito";
            this.cboDistrito.Size = new System.Drawing.Size(203, 24);
            this.cboDistrito.TabIndex = 18;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 264);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 17);
            this.label3.TabIndex = 17;
            this.label3.Text = "Distrito";
            // 
            // cboProvincia
            // 
            this.cboProvincia.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboProvincia.FormattingEnabled = true;
            this.cboProvincia.Location = new System.Drawing.Point(140, 215);
            this.cboProvincia.Name = "cboProvincia";
            this.cboProvincia.Size = new System.Drawing.Size(203, 24);
            this.cboProvincia.TabIndex = 16;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 215);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(66, 17);
            this.label2.TabIndex = 15;
            this.label2.Text = "Provincia";
            // 
            // cboDepartamento
            // 
            this.cboDepartamento.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboDepartamento.FormattingEnabled = true;
            this.cboDepartamento.Location = new System.Drawing.Point(140, 168);
            this.cboDepartamento.Name = "cboDepartamento";
            this.cboDepartamento.Size = new System.Drawing.Size(203, 24);
            this.cboDepartamento.TabIndex = 14;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 168);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(102, 17);
            this.label1.TabIndex = 13;
            this.label1.Text = "Departamento:";
            // 
            // cboTipoDoc
            // 
            this.cboTipoDoc.FormattingEnabled = true;
            this.cboTipoDoc.Items.AddRange(new object[] {
            "--seleccione--",
            "DNI",
            "Pasaporte",
            "Carnet extranjeria",
            "RUC"});
            this.cboTipoDoc.Location = new System.Drawing.Point(472, 40);
            this.cboTipoDoc.Name = "cboTipoDoc";
            this.cboTipoDoc.Size = new System.Drawing.Size(212, 24);
            this.cboTipoDoc.TabIndex = 12;
            // 
            // txtDoc
            // 
            this.txtDoc.Location = new System.Drawing.Point(140, 39);
            this.txtDoc.Margin = new System.Windows.Forms.Padding(4);
            this.txtDoc.Name = "txtDoc";
            this.txtDoc.Size = new System.Drawing.Size(117, 22);
            this.txtDoc.TabIndex = 11;
            // 
            // label9
            // 
            this.label9.Location = new System.Drawing.Point(469, 173);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(85, 20);
            this.label9.TabIndex = 9;
            this.label9.Text = "Telefono:";
            // 
            // txtDir
            // 
            this.txtDir.Location = new System.Drawing.Point(140, 121);
            this.txtDir.Margin = new System.Windows.Forms.Padding(4);
            this.txtDir.Name = "txtDir";
            this.txtDir.Size = new System.Drawing.Size(544, 22);
            this.txtDir.TabIndex = 7;
            // 
            // btnGrabar
            // 
            this.btnGrabar.Location = new System.Drawing.Point(588, 308);
            this.btnGrabar.Margin = new System.Windows.Forms.Padding(4);
            this.btnGrabar.Name = "btnGrabar";
            this.btnGrabar.Size = new System.Drawing.Size(96, 30);
            this.btnGrabar.TabIndex = 5;
            this.btnGrabar.Text = "Grabar";
            this.btnGrabar.Click += new System.EventHandler(this.button1_Click);
            // 
            // label10
            // 
            this.label10.Location = new System.Drawing.Point(11, 39);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(105, 25);
            this.label10.TabIndex = 3;
            this.label10.Text = "DocIdentidad:";
            // 
            // label11
            // 
            this.label11.Location = new System.Drawing.Point(344, 36);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(121, 25);
            this.label11.TabIndex = 3;
            this.label11.Text = "TipoDocumento:";
            // 
            // txtApe
            // 
            this.txtApe.Location = new System.Drawing.Point(472, 77);
            this.txtApe.Margin = new System.Windows.Forms.Padding(4);
            this.txtApe.Name = "txtApe";
            this.txtApe.Size = new System.Drawing.Size(212, 22);
            this.txtApe.TabIndex = 1;
            // 
            // txtNom
            // 
            this.txtNom.Location = new System.Drawing.Point(140, 79);
            this.txtNom.Margin = new System.Windows.Forms.Padding(4);
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(179, 22);
            this.txtNom.TabIndex = 2;
            // 
            // label12
            // 
            this.label12.Location = new System.Drawing.Point(351, 79);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(85, 20);
            this.label12.TabIndex = 3;
            this.label12.Text = "Apellidos:";
            // 
            // label13
            // 
            this.label13.Location = new System.Drawing.Point(11, 125);
            this.label13.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(412, 20);
            this.label13.TabIndex = 3;
            this.label13.Text = "Direccion:";
            // 
            // label14
            // 
            this.label14.Location = new System.Drawing.Point(11, 79);
            this.label14.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(85, 20);
            this.label14.TabIndex = 3;
            this.label14.Text = "Nombres:";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(472, 308);
            this.button2.Margin = new System.Windows.Forms.Padding(4);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(96, 30);
            this.button2.TabIndex = 6;
            this.button2.Text = "Cancelar";
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // chkEstado
            // 
            this.chkEstado.AutoSize = true;
            this.chkEstado.Location = new System.Drawing.Point(581, 210);
            this.chkEstado.Name = "chkEstado";
            this.chkEstado.Size = new System.Drawing.Size(74, 21);
            this.chkEstado.TabIndex = 20;
            this.chkEstado.Text = "Estado";
            this.chkEstado.UseVisualStyleBackColor = true;
            // 
            // Cliente02
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(817, 442);
            this.Controls.Add(this.groupBox1);
            this.Name = "Cliente02";
            this.Text = "Insertal Cliente";
            this.Load += new System.EventHandler(this.Cliente02_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        internal System.Windows.Forms.GroupBox groupBox1;
        internal System.Windows.Forms.TextBox txtDoc;
        internal System.Windows.Forms.Label label9;
        internal System.Windows.Forms.TextBox txtDir;
        internal System.Windows.Forms.Button btnGrabar;
        internal System.Windows.Forms.Label label10;
        internal System.Windows.Forms.Label label11;
        internal System.Windows.Forms.TextBox txtApe;
        internal System.Windows.Forms.TextBox txtNom;
        internal System.Windows.Forms.Label label12;
        internal System.Windows.Forms.Label label13;
        internal System.Windows.Forms.Label label14;
        internal System.Windows.Forms.Button button2;
        private System.Windows.Forms.ComboBox cboTipoDoc;
        private System.Windows.Forms.ComboBox cboDistrito;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cboProvincia;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cboDepartamento;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.MaskedTextBox mskTelf;
        private System.Windows.Forms.CheckBox chkEstado;
    }
}